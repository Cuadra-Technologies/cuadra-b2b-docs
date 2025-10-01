# Dynamic Forms integration guide

> This document explains how to integrate with the Dynamic Forms endpoints from a front‑end application. It covers the **primary endpoints** (Navigate and Save Values) and the **helper endpoint** (Render Page). It also includes integration patterns, error semantics and a flow diagrams.

## 0. High‑Level Overview
**Domain:** A user works through a multi‑page form (a _process_). The backend manages a runtime _form instance_, navigation (start/next/previous/submit), and persistence of user inputs (datapoints).
**Key concepts**
*   **Process**: A form flow definition with ordered pages and optional rules.
*   **Form Instance**: A user’s current run through a process (status: `in_progress | submitted | ...`).
*   **Page**: A screen in the flow. Each page contains components (inputs) and static config.
*   **Component**: Renderable unit (text input, dropdown, etc.) with `component_id`, `field_id`, `is_required`, UI props, and validations.
*   **Navigation Context**: What the user can do from the current page (actions, breadcrumb).
**Core endpoints**
*   `POST /forms/{process_id}/navigation` → **Navigate** (_start/next/previous/submit_) and optionally return the target page for immediate render.
*   `POST /forms/{process_id}/instances/{instance_id}/pages/{page_key}/values` → **Save Values** for the current page (component → value map).
*   `POST /forms/{process_id}/pages/{page_key}` → **Render Page** (helper; typically not used in prod as `navigation` already returns page data).
**ETag & Progress**
*   Responses include an **ETag** and **progress** metadata so the FE can optimize re‑renders and track completion.
### Version & Scope (v1.0 – staging)
*   This version is deployed **only to staging** so FE can start integrating.
*   **Backend validation/sanitization** is **not implemented yet**; it is planned and will be completed **before production**.
### Performance Characteristics
*   **Component Loading**: Single query fetches all components with values using optimized JOIN/LEFT JOIN operations.
*   **No N+1 queries**: All page data retrieved in one database round‑trip.
*   **Ordered Results**: Components returned in `order_num` sequence for consistent rendering.
* * *

## 1. Checklist
1. **Start a session**
    *   Call **Navigate** with `{ action: "start", options: { include_page_data: true }, client_id }`.
    *   Render the returned `page` and `navigation_context.actions`.
2. **On page edit**
    *   Maintain a local state keyed by `component_id`.
    *   On blur/auto‑save or before navigation, call **Save Values** with `{ values: { [component_id]: value, ... } }`.
3. **Go Next / Previous**
    *   After successful save (or if you auto‑save), call **Navigate** with `{ action: "next" }` or `{ action: "previous" }`.
    *   Render the returned `page`.
4. **Submit**
    *   Ensure all required pages are complete. Call **Navigate** with `{ action: "submit" }`.
    *   Use the `submission` object (confirmation number, etc.) for receipts/vouchers (not needed on v1).
5. **Optimizations**
    *   Use `navigation_context.breadcrumb` for UX (optional).
    *   Respect `actions`: only enable Next/Prev/Submit per the backend’s `enabled` flags.
    *   Use `metadata.etag` to skip re‑renders if content is unchanged (cache local to avoid hitting backend services).
### Navigation Flow
1. **Save** current page values (if any).
2. **Wait** for save confirmation (`status=ok`).
3. **Navigate** with the desired action (`start|next|previous|submit`).
> Note: `saved_values` in the navigation request body is **reserved** for **backend business logic validations**.

* * *
## 2. Data Contracts
**IDs**
*   `process_id`: integer path param
*   `instance_id`: integer path param (known after `start`)
*   `page_key`: string key of the page
*   `client_id`: UUID (authenticated user identifier)
**Component payload** (render output)

```json
{
  "component_id": 2001,
  "component_type": "text_input",
  "label": "First Name",
  "is_required": true,
  "ui_props": { "type": "text", "class": "form-control" },
  "validations": { "type": "string", "maxLength": 50 },
  "value": "John"
}
```

**Navigation context**

```json
{
  "actions": {
    "next": { "enabled": true, "target_page": "contact_info", "validation_required": true },
    "previous": { "enabled": false },
    "submit": { "enabled": false }
  },
  "breadcrumb": [ {"key":"personal_info","title":"Personal Information","accessible":true} ]
}
```

### Component Value Loading
Values are fetched via **LEFT JOIN** on `DataPointModel` matching:
*   `data_field_id` (from the component’s field mapping)
*   `client_id` (the current user)
Empty values return **`null`**, distinguishing between "never set" and "explicitly cleared".
### Access Control
*   `backoffice_only` (boolean) may be present on components.
*   FE should **hide** these.
*   Backend **enforces** access on save operations (not shown in current snippets).
### Progress Tracking
*   `completed_pages`: derived from `page_state` rows where `is_complete = true`.
*   `percentage`: `(completed_pages / total_pages) * 100`.
*   **Navigation stack ≠ completed pages** (users may go back without affecting completion).

* * *
## 3. Integration Patterns
*   **Authoritative navigation**: Never hard‑code flow order in FE. Always ask the backend (`navigation_context.actions`).
*   **Save before moving**: Call **Save Values** on blur/auto‑save or immediately before `next` (\`previous\` should not save values).
*   **Idempotency**: Re‑sending the same values is safe; unknown components are ignored.
*   **ETags**: Cache the last ETag per page; if unchanged, skip re‑render for performance.
*   **Error UX**: Map `FN01/FN02/FN03`, `FV01/FV02`, `FP01` to friendly messages with fallback.
*   **Accessibility**: Use `breadcrumb` to allow non‑linear review only if server enables links.
*   **Validation Errors:** Backend will return a custom response context that maps component\_id → validation errors so FE can render appropriately on each component.
### Transaction Boundaries
*   Reads end with `end_read_tx()` to close any implicit transactions.
*   All writes are wrapped in an explicit `transactional()` context.
*   This prevents nested/auto‑begin conflicts before subsequent writes.
### ETag Support (Partial – v1.0)
*   ETags are generated from instance state + values.
*   **Client caching only** for now; backend could implement server-side caching using this same method + minor intervention at the FE level.

## 4. Example UX Wiring (pseudo)

```markdown
// Start
const nav = await api.navigate(processId, { action: "start", client_id, options: { include_page_data: true } });
render(nav.page, nav.navigation_context);

// Save then Next
await api.saveValues(processId, instanceId, page.key, { client_id, values });
const nav2 = await api.navigate(processId, { action: "next", client_id });
render(nav2.page, nav2.navigation_context);

// Previous
const navPrev = await api.navigate(processId, { action: "previous", client_id });
render(navPrev.page, navPrev.navigation_context);

// Submit
const res = await api.navigate(processId, { action: "submit", client_id });
```

* * *

## 5. FAQs
*   **Can FE request a page directly?** Yes, via the Render Page endpoint, but prefer `navigation` with `include_page_data=true` for consistency as this not update the navigation stack for a current user.
*   **What if FE sends unknown component IDs?** They are ignored on the server; no error thrown.
*   **How do we know what buttons to show?** Use `navigation_context.actions` from the last response.
*   **How do we calculate progress?** Use `instance.progress` from responses; it’s authoritative.
* * *

##