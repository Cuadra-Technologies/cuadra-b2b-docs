# `build-docs.sh` — API Documentation Builder with Docker & Redocly

This script automates the generation of HTML documentation from OpenAPI specifications (`*.openapi.json`) using [Redocly CLI](https://redocly.com/docs/cli/). It also supports optional packaging of the output into a `.zip` file for distribution.

---

## What It Does

- Scans the current directory for all `.openapi.json` files.
- Uses Docker to run Redocly CLI and generate static HTML documentation.
- Copies shared assets (from `assets/`) into each output folder.
- Cleans previous output folders in `public/docs/` before building.
- Optionally compresses the generated documentation into `artifacts/docs_bundle.zip`.

---

## Usage

From the root of the project, run:

```bash
./scripts/build-docs.sh
````

---

## Optional Parameters

You can pass named arguments to modify the script’s behavior:

### `--zip=true`

Creates a `docs_bundle.zip` file under the `artifacts/` directory, containing all generated documentation.

```bash
./scripts/build-docs.sh --zip=true
```

### `--prefix=<name>`

Overrides the default folder name used for each spec’s output. All specs will be generated inside the same folder with this name.

```bash
./scripts/build-docs.sh --prefix=cuadra_docs
```

### Combine both:

```bash
./scripts/build-docs.sh --zip=true --prefix=api_docs
```

---

## Output Structure

```bash
public/
└── docs/
    ├── reference/
    │   ├── index.html
    │   └── assets/
    ├── user_auth/
    │   ├── index.html
    │   └── assets/
artifacts/
└── docs_bundle.zip  # (only if --zip=true)
```

---

## Notes

* The script uses `docker run` to execute Redocly CLI, so Docker must be installed and running.
* Make sure your OpenAPI spec files are named using the `.openapi.json` suffix.
* Any contents in `assets/` will be copied into each generated documentation folder.

---

## Clean Build

The script removes all previous folders under `public/docs/` before generating new ones. This ensures a fresh build each time.

---

## Permissions

Ensure the script is executable:

```bash
chmod +x ./scripts/build-docs.sh
```

---

## Questions or Improvements?

Feel free to open a PR or suggest enhancements to make this utility more robust or portable.
