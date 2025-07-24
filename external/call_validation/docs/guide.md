Esta guía describe el uso y finalidad del endpoint `/external/assistant-cx/calls`, diseñado para recibir los resultados de llamadas ejecutadas por proveedores externos (por ejemplo, el servicio Asistente CX), durante el proceso de validación de crédito.

## Objetivo

Permitir que el sistema Cuadra reciba y almacene la información resultante de llamadas realizadas a titulares o referencias, con el fin de respaldar decisiones informadas en procesos automáticos o manuales de aprobación o rechazo crediticio.

## Contexto

Durante la validación de aplicaciones de crédito, se realiza una llamada automática al titular o referencias del solicitante. Esta llamada puede:

* Confirmar datos clave.
* Validar coincidencia de información.
* Detectar anomalías o inconsistencias.

Los resultados de estas llamadas deben almacenarse para trazabilidad, análisis y soporte de decisiones, tanto automáticas como manuales.

## Campos esperados en la solicitud

| Property              | Required    | Type         | Descripción                                                                 |
|-----------------------|-------------|--------------|------------------------------------------------------------------------------|
| `status`              | Si         | string       | Resultado de la llamada (`success` o `failed`).                             |
| `reason`              | Condicional| string       | Solo si la llamada fue fallida. Motivo específico del fallo.                |
| `attempts`            | No          | integer      | Número de intentos realizados si la llamada falló.                          |
| `conversation_id`     | Si         | string       | Identificador único de la llamada.                                          |
| `transcript_path`     | Si         | string (URI) | Ruta al archivo de transcripción en S3.                                     |
| `audio_path`          | Si         | string (URI) | Ruta al archivo de audio en S3.                                             |
| `detected_gender`     | No          | string       | Género detectado en la llamada: `male`, `female` o `undefined`.             |

> **Nota:** Los campos `transcript_path` y `audio_path` deben contener URIs válidas. Se recomienda el formato `/{folder}/{key}`, ej. `transcripts/3fa85f6457174562b3fc2c963f66afa6.txt`.

### Objeto anidado: `declared_data`

Este objeto contiene la información **declarada verbalmente por el cliente** durante la llamada.

| Property                    | Required | Type   | Descripción                                                                |
|-----------------------------|----------|--------|----------------------------------------------------------------------------|
| `declared_data.average_income` | No       | string | Ingreso promedio declarado por el cliente durante la llamada.              |
| `declared_data.address`        | No       | string | Dirección declarada por el cliente.                                        |
| `declared_data.born_year`     | No       | string | Año de nacimiento que el cliente indicó (formato: YYYY).                   |

## Comportamiento del endpoint

* Si `status` es `failed` pero no se proporciona `reason`, el sistema responderá con error `422`.
* Si `transcript_path` o `audio_path` no son rutas válidas (o los archivos no existen), se responderá con rechazo explícito.
* Si todos los datos son válidos, la información se almacena y el sistema responde con un objeto de confirmación.

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

