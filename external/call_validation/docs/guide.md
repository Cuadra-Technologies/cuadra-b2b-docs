# Guía de uso – Resultados de llamada Asistente CX

Esta guía describe el uso y finalidad de los endpoints disponibles para registrar los resultados de llamadas realizadas durante el proceso de validación de crédito, ya sea al titular o a una referencia personal.

---

## Endpoints disponibles

| Endpoint                                 | Finalidad                                                    |
| ---------------------------------------- | ------------------------------------------------------------ |
| `/external/assistant-cx/calls`           | Registrar resultado de llamada al titular.                   |
| `/external/assistant-cx/calls-reference` | Registrar resultado de llamada a una referencia del titular. |

---

## Objetivo

Permitir que el sistema Cuadra reciba y almacene la información resultante de llamadas realizadas a **titulares** o **referencias**, con el fin de respaldar decisiones informadas en procesos automáticos o manuales de aprobación o rechazo crediticio.

---

## Contexto

Durante la validación de aplicaciones de crédito, se realiza una llamada automática al titular o a sus referencias. Estas llamadas pueden:

* Confirmar datos clave.
* Validar coincidencia de información.
* Detectar anomalías o inconsistencias.

Los resultados deben almacenarse para trazabilidad, análisis y soporte de decisiones.

---

## 1. Registro de llamada al titular (/external/assistant-cx/calls)

### Campos esperados en la solicitud

| Property          | Required    | Type         | Descripción                                                                                     |
| ----------------- | ----------- | ------------ | ----------------------------------------------------------------------------------------------- |
| `status`          | Sí          | string       | Resultado general de la llamada. Es failed si hubo un error técnico o el contacto no respondió. Es success si la llamada fue completada, aunque pueden existir observaciones o problemas dentro del flujo.                                                 |
| `reason`          | Condicional | enum string  | Catálogo de posibles problemas detectados en la llamada. Ver tabla de tipificación de motivos para los valores posibles. |
| `attempts`        | No          | integer      | Número de intentos realizados si la llamada falló.                                              |
| `conversation_id` | Sí          | string       | Identificador único de la llamada.                                                              |
| `transcript_path` | Sí          | string (URI) | Ruta al archivo de transcripción en S3.                                                         |
| `audio_path`      | Sí          | string (URI) | Ruta al archivo de audio en S3.                                                                 |
| `detected_gender` | No          | string       | Género detectado en la llamada: `male`, `female` o `undefined`.                                 |

> **Nota:** Se recomienda el formato `/{folder}/{key}`, por ejemplo:
> `transcripts/3fa85f6457174562b3fc2c963f66afa6.txt`

#### Objeto anidado: `declared_data`

Contiene información **declarada verbalmente por el cliente**:

| Property                       | Required | Type   | Descripción                             |
| ------------------------------ | -------- | ------ | --------------------------------------- |
| `declared_data.average_income` | No       | string | Ingreso promedio declarado.             |
| `declared_data.address`        | No       | string | Dirección declarada.                    |
| `declared_data.age`            | No       | string | Año de nacimiento (formato: YYYY).      |
| `declared_data.id_number`      | No       | string | CUI u otro documento de identificación. |
| `declared_data.ocupation`      | No       | string | Ocupación laboral declarada.            |

---

## 2. Registro de llamada a referencia (/external/assistant-cx/calls-reference)

### Campos esperados en la solicitud

| Property          | Required    | Type         | Descripción                                                                                     |
| ----------------- | ----------- | ------------ | ----------------------------------------------------------------------------------------------- |
| `status`          | Sí          | string       | Resultado general de la llamada. Es failed si hubo un error técnico o el contacto no respondió. Es success si la llamada fue completada, aunque pueden existir observaciones o problemas dentro del flujo.                                                 |
| `reason`          | Condicional | enum string  | Catálogo de posibles problemas detectados en la llamada. Ver tabla de tipificación de motivos para los valores posibles. |
| `attempts`        | No          | integer      | Número de intentos realizados si la llamada falló.                                              |
| `conversation_id` | Sí          | string       | Identificador único de la llamada.                                                              |
| `transcript_path` | Sí          | string (URI) | Ruta al archivo de transcripción en S3.                                                         |
| `audio_path`      | Sí          | string (URI) | Ruta al archivo de audio en S3.                                                                 |
| `detected_gender` | No          | string       | Género detectado en la llamada: `male`, `female` o `undefined`.                                 |

#### Objeto anidado: `declared_data`

Contiene respuestas de la referencia respecto al titular:

| Property                          | Required | Type    | Descripción                             |
| --------------------------------- | -------- | ------- | --------------------------------------- |
| `declared_data.knows_holder`      | No       | boolean | Indica si la persona conoce al titular. |
| `declared_data.recommends_holder` | No       | boolean | Indica si recomienda al titular.        |

---

## Comportamiento general de los endpoints

* Si `status` es `failed` y no se proporciona `reason`, se responderá con `422`.
* Si los paths no son válidos o no existen los archivos, se rechazará la solicitud.
* Si los datos son válidos, se almacenan y se responde con un mensaje de éxito.

---

## Respuesta esperada

```json
{
  "header": {
    "title": "Registro Exitoso",
    "message": "Llamada registrada exitosamente.",
    "type": "success",
    "code": "000",
    "event_id": "event_67890"
  },
  "content": {
    "transaction_id": "3fa85f64-5717-4562-b3fc-2c963f66afa6"
  }
}
```

---

## Ejemplo de error

```json
{
  "header": {
    "title": "Error",
    "message": "Campo faltante: reason",
    "type": "error",
    "code": "422",
    "event_id": "event_67890"
  }
}
```

---