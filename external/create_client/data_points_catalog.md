# Catalogo

Este es un catálogo de los parámetros que se recibirán en el servicio de [creación de usuarios](#tag/Clients) en el array de objetos `data_points`. Cada campo contiene información sobre el tipo de dato que se espera, el número mínimo y máximo de caracteres permitidos, si es un campo obligatorio, y en algunos casos, expresiones regulares que validan el formato del valor ingresado.

| **Data Point Key**                     | **Name**                                                  | **Regex**                                | **Min Char** | **Max Char** | **Required** |
|------------------------------------|-----------------------------------------------------------|------------------------------------------|--------------|--------------|--------------|
| razon_social_precalificadora       | Razon Social                                              |                                          | 0            | 1000         | TRUE         |
| producto                           | Producto o Servicio                                       |                                          | 0            | 1000         | TRUE         |
| origen_solicitud                   | Origen de Solicitud                                       |                                          | 0            | 1000         | TRUE         |
| campania                           | Campaña                                                   |                                          | 2            | 250          | TRUE         |
| cliente_ema                        | Cliente EMA                                               |                                          | 2            | 250          | TRUE         |
| numero_cliente_ema                 | Número de Cliente EMA                                     |                                          | 2            | 250          | FALSE        |
| promedio_compra_semanal            | Promedio de Compra Semanal                                |                                          | 1            | 10           | TRUE         |
| promedio_ingresos_mensuales        | Promedio de ingresos mensuales                            |                                          | 1            | 10           | TRUE         |
| documento_identificacion           | Documento de Identificación                               |                                          | 0            | 1000         | FALSE        |
| numero_identificacion              | Número de Identificación                                  |                                          | 13           | 15           | FALSE        |
| primer_nombre                      | Primer Nombre                                             |                                          | 2            | 250          | FALSE        |
| segundo_nombre                     | Segundo Nombre                                            |                                          | 2            | 250          | FALSE        |
| otro_nombre                        | Otro Nombre                                               |                                          | 2            | 250          | FALSE        |
| primer_apellido                    | Primer Apellido                                           |                                          | 2            | 250          | FALSE        |
| segundo_apellido                   | Segundo Apellido                                          |                                          | 2            | 250          | FALSE        |
| apellido_casada                    | Apellido de Casada                                        |                                          | 2            | 250          | FALSE        |
| fecha_nacimiento                   | Fecha de Nacimiento                                       |                                          | 0            | 100          | TRUE         |
| genero                             | Género                                                    |                                          | 0            | 1000         | FALSE        |
| estado_civil                       | Estado Civil                                              |                                          | 1            | 250          | FALSE        |
| nacionalidad                       | Nacionalidad                                              |                                          | 1            | 250          | FALSE        |
| lugar_de_nacimiento                | Lugar de Nacimiento                                       |                                          | 2            | 250          | FALSE        |
| ocupacion                          | Ocupación                                                 |                                          | 2            | 250          | FALSE        |
| vecinidad                          | Lugar de Emisión                                          |                                          | 2            | 250          | TRUE         |
| telefono_linea_fija                | Teléfono principal                                        | `^(?:\d{3}[-\s]?)?[236457]\d{7}$`        | 8            | 12           | TRUE         |
| nit                                | NIT                                                      |                                          | 8            | 12           | TRUE         |
| numero_celular                     | Número de Celular                                         | `^(?:\d{3}[-\s]?)?[236457]\d{7}$`        | 8            | 12           | TRUE         |
| correo                             | Correo Eléctronico                                        | `^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$` | 10  | 250          | FALSE        |
| condicion_migratoria               | Condicion Migratoria                                      |                                          | 0            | 1000         | TRUE         |
| solicitante_pep                    | El solicitante es PEP                                     |                                          | 0            | 1000         | TRUE         |
| origen_de_fondos                   | En caso sea PEP, cual es el origen de sus fondos          |                                          | 0            | 1000         | FALSE        |
| relacion_pep                       | El solicitante tiene relación con PEP                     |                                          | 0            | 1000         | FALSE        |
| asociacion_pep                     | El solicitante tiene asociación con PEP                   |                                          | 0            | 1000         | FALSE        |
| solicitante_cpe                    | El solicitante es contratista o proveedor del estado      |                                          | 0            | 1000         | FALSE        |
| relacion_solicitante               | El solicitante actúa en nombre propio                     |                                          | 0            | 1000         | FALSE        |
| nombre_razon                       | Nombre, Razón Social o Denominación Completa del Aplicante|                                          | 2            | 250          | FALSE        |
| direccion                          | Dirección                                                 |                                          | 5            | 1000         | TRUE         |
| pais                               | País                                                      |                                          | 2            | 250          | TRUE         |
| dueño_departamento                 | Departamento                                              |                                          | 0            | 1000         | TRUE         |
| dueño_municipio                    | Municipio                                                 |                                          | 0            | 1000         | TRUE         |
| dueño_zona                         | Zona/Colonia                                              |                                          | 0            | 100          | TRUE         |
| fuentes_ingreso                    | Fuentes de Ingreso                                        |                                          | 0            | 1000         | TRUE         |
| otras_fuentes_ingreso              | Otras Fuentes de Ingreso                                  |                                          | 0            | 1000         | FALSE        |
| tipo_moneda_ingresos               | Tipo de monedas de los ingresos                           |                                          | 0            | 1000         | TRUE         |
| total_ingresos_mensuales           | Total de Ingresos Mensuales Aproximados                   |                                          | 0            | 1000         | TRUE         |
| tipo_moneda_egresos                | Tipo de moneda de los egresos                             |                                          | 0            | 1000         | TRUE         |
| total_egresos_mensuales            | Total de Egresos Mensuales Aproximados                    |                                          | 2            | 250          | TRUE         |
| nombre_empresa_laboral             | Empresa                                                   |                                          | 2            | 250          | TRUE         |
| nombre_persona_laboral             | Nombre de Referencia                                      |                                          | 2            | 250          | TRUE         |
| telefono_empresa_laboral           | Teléfono (Línea fija)                                     | `^(?:\d{3}[-\s]?)?[236457]\d{7}$`        | 8            | 12           | TRUE         |
| celular_laboral                    | Celular / Móvil                                           | `^(?:\d{3}[-\s]?)?[236457]\d{7}$`        | 8            | 12           | TRUE         |
| nombre_empresa_laboral_2           | Empresa                                                   |                                          | 2            | 250          | FALSE        |
| nombre_persona_laboral_2           | Nombre de Referencia                                      |                                          | 2            | 250          | FALSE        |
| telefono_empresa_laboral_2         | Teléfono (Línea fija)                                     | `^(?:\d{3}[-\s]?)?[236457]\d{7}$`        | 8            | 12           | FALSE        |
| celular_laboral_2                  | Celular / Móvil                                           | `^(?:\d{3}[-\s]?)?[236457]\d{7}$`        | 8            | 12           | FALSE        |
| nombre_referencia_personal         | Nombre Completo                                           |                                          | 2            | 250          | TRUE         |
| teléfono_referencia_personal       | Teléfono (Línea Fija)                                     | `^(?:\d{3}[-\s]?)?[236457]\d{7}$`        | 8            | 12           | TRUE         |
| celular_referencia_personal        | Celular / Móvil                                           | `^(?:\d{3}[-\s]?)?[236457]\d{7}$`        | 8            | 12           | TRUE         |
| nombre_referencia_personal_2       | Nombre Completo                                           |                                          | 2            | 250          | FALSE        |
| teléfono_referencia_personal_2     | Teléfono (Línea Fija)                                     | `^(?:\d{3}[-\s]?)?[236457]\d{7}$`        | 8            | 12           | FALSE        |
| celular_referencia_personal_2      | Celular / Móvil                                           | `^(?:\d{3}[-\s]?)?[236457]\d{7}$`        | 8            | 12           | FALSE        |
| estabilidad_laboral_negocio        | Estabilidad Laboral o de Negocio                          |                                          | 1            | 2            | TRUE         |


# Ejemplo extendido

Aquí tienes ejemplos de cómo usar el catálogo de parámetros en una solicitud `curl` para el servicio de creación de usuarios en la API de `Cuadra`:

### Ejemplo de solicitud `curl` para la creación de usuarios:

```bash
curl --location 'https://api.example.com/api/v1/external/client/registry' \
--header 'Authorization: <jwt_token>' \
--header 'Content-Type: application/json' \
--data '{
    "cui": "2380033370713",
    "first_name": "Juan",
    "last_name": "Perez",
    "phone": "2364571234",
    "product_key": "product_123",
    "product_id": "prod_001",
    "origin": "online",
    "client_id": "client_789",
    "data_points": [
        {
            "key": "razon_social_precalificadora", 
            "value": "Comercial S.A."
        },
        {
            "key": "producto", 
            "value": "Servicio de Consultoría"
        },
        {
            "key": "origen_solicitud", 
            "value": "Web"
        },
        {
            "key": "campania", 
            "value": "Promoción de Primavera"
        },
        {
            "key": "cliente_ema", 
            "value": "EMA12345"
        },
        {
            "key": "numero_cliente_ema", 
            "value": "54321"
        },
        {
            "key": "promedio_compra_semanal", 
            "value": "5000"
        },
        {
            "key": "promedio_ingresos_mensuales", 
            "value": "20000"
        },
        {
            "key": "documento_identificacion", 
            "value": "DPI"
        },
        {
            "key": "numero_identificacion", 
            "value": "2380033370713"
        },
        {
            "key": "primer_nombre", 
            "value": "Juan"
        },
        {
            "key": "segundo_nombre", 
            "value": "Carlos"
        },
        {
            "key": "otro_nombre", 
            "value": "N/A"
        },
        {
            "key": "primer_apellido", 
            "value": "Perez"
        },
        {
            "key": "segundo_apellido", 
            "value": "Lopez"
        },
        {
            "key": "apellido_casada", 
            "value": "N/A"
        },
        {
            "key": "fecha_nacimiento", 
            "value": "1990-01-15"
        },
        {
            "key": "genero", 
            "value": "Masculino"
        },
        {
            "key": "estado_civil", 
            "value": "Soltero"
        },
        {
            "key": "nacionalidad", 
            "value": "Guatemalteco"
        },
        {
            "key": "lugar_de_nacimiento", 
            "value": "Guatemala City"
        },
        {
            "key": "ocupacion", 
            "value": "Ingeniero"
        },
        {
            "key": "vecinidad", 
            "value": "Guatemala"
        },
        {
            "key": "telefono_linea_fija", 
            "value": "2364571234"
        },
        {
            "key": "nit", 
            "value": "1234567"
        },
        {
            "key": "numero_celular", 
            "value": "2364571234"
        },
        {
            "key": "correo", 
            "value": "juan.perez@example.com"
        },
        {
            "key": "condicion_migratoria", 
            "value": "Residente Permanente"
        },
        {
            "key": "solicitante_pep", 
            "value": "No"
        },
        {
            "key": "origen_de_fondos", 
            "value": "Salario"
        },
        {
            "key": "relacion_pep", 
            "value": "No"
        },
        {
            "key": "asociacion_pep", 
            "value": "No"
        },
        {
            "key": "solicitante_cpe", 
            "value": "No"
        },
        {
            "key": "relacion_solicitante", 
            "value": "Sí"
        },
        {
            "key": "nombre_razon", 
            "value": "Comercial S.A."
        },
        {
            "key": "direccion", 
            "value": "4a Calle 12-34 Zona 10"
        },
        {
            "key": "pais", 
            "value": "Guatemala"
        },
        {
            "key": "dueño_departamento", 
            "value": "Guatemala"
        },
        {
            "key": "dueño_municipio", 
            "value": "Guatemala"
        },
        {
            "key": "dueño_zona", 
            "value": "Zona 10"
        },
        {
            "key": "fuentes_ingreso", 
            "value": "Trabajo formal"
        },
        {
            "key": "otras_fuentes_ingreso", 
            "value": "Inversiones"
        },
        {
            "key": "tipo_moneda_ingresos", 
            "value": "Quetzales"
        },
        {
            "key": "total_ingresos_mensuales", 
            "value": "20000"
        },
        {
            "key": "tipo_moneda_egresos", 
            "value": "Quetzales"
        },
        {
            "key": "total_egresos_mensuales", 
            "value": "15000"
        },
        {
            "key": "nombre_empresa_laboral", 
            "value": "Compañía XYZ"
        },
        {
            "key": "nombre_persona_laboral", 
            "value": "Pedro Sanchez"
        },
        {
            "key": "telefono_empresa_laboral", 
            "value": "2364571234"
        },
        {
            "key": "celular_laboral", 
            "value": "2364579876"
        },
        {
            "key": "nombre_empresa_laboral_2", 
            "value": "Compañía ABC"
        },
        {
            "key": "nombre_persona_laboral_2", 
            "value": "Maria Gomez"
        },
        {
            "key": "telefono_empresa_laboral_2", 
            "value": "2364576543"
        },
        {
            "key": "celular_laboral_2", 
            "value": "2364573210"
        },
        {
            "key": "nombre_referencia_personal", 
            "value": "Carlos Ruiz"
        },
        {
            "key": "teléfono_referencia_personal", 
            "value": "2364571111"
        },
        {
            "key": "celular_referencia_personal", 
            "value": "2364572222"
        },
        {
            "key": "nombre_referencia_personal_2", 
            "value": "Lucia Castro"
        },
        {
            "key": "teléfono_referencia_personal_2", 
            "value": "2364573333"
        },
        {
            "key": "celular_referencia_personal_2", 
            "value": "2364574444"
        },
        {
            "key": "estabilidad_laboral_negocio", 
            "value": "1"
        }
    ]
}'
```

### Explicación:
En el ejemplo, cada parámetro del catálogo se ha mapeado a un campo `key` y `value` dentro del array `data_points`. Así, puedes ver cómo enviar varios datos del usuario en la misma solicitud. 

Puedes modificar o eliminar los campos según sea necesario para la creación de un usuario específico.