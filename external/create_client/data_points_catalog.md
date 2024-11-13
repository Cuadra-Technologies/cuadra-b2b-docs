# Catalogo

Este es un catálogo de los parámetros que se recibirán en el servicio de [creación de usuarios](#tag/Clients) en el array de objetos `data_points`. Cada campo contiene información sobre el tipo de dato que se espera, el número mínimo y máximo de caracteres permitidos, si es un campo obligatorio, y en algunos casos, expresiones regulares que validan el formato del valor ingresado.

| **Data Point Key**                 | **Name**                                                  | **Regex**                                | **Min Char** | **Max Char** | **Required** |
|------------------------------------|-----------------------------------------------------------|------------------------------------------|--------------|--------------|--------------|
| id_tipo_documento_identificacion   | Tipo de Documento de Identificación                       |                                          | 1            | 1000         | TRUE         |
| tipo_documento_identificacion      | Tipo de Documento de Identificación                       |                                          | 0            | 1000         | TRUE         |
| numero_identificacion              | Número de Identificación                                  |                                          | 0            | 1000         | TRUE         |
| primer_nombre                      | Primer Nombre                                             |                                          | 2            | 250          | TRUE         |
| segundo_nombre                     | Segundo Nombre                                            |                                          | 2            | 250          | FALSE        |
| primer_apellido                    | Primer Apellido                                           |                                          | 2            | 250          | TRUE         |
| segundo_apellido                   | Segundo Apellido                                          |                                          | 2            | 250          | FALSE        |
| apellido_casada                    | Apellido Casada                                           |                                          | 2            | 250          | FALSE        |
| nit                                | NIT                                                       |                                          | 8            | 12           | TRUE         |
| numero_celular                     | Número de Celular                                         | `^(?:\d{3}[-\s]?)?[236457]\d{7}$`        | 8            | 12           | TRUE         |
| telefono_linea_fija                | Teléfono principal                                        | `^(?:\d{3}[-\s]?)?[236457]\d{7}$`        | 8            | 12           | TRUE         |
| correo                             | Correo Eléctronico                                        | `^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$` | 10  | 250          | FALSE        |
| direccion                          | Dirección                                                 |                                          | 5            | 1000         | TRUE         |
| id_pais                            | Id del País                                               |                                          | 1            | 1000         | TRUE         |
| pais                               | País                                                      |                                          | 1            | 1000         | TRUE         |
| id_dueño_departamento              | Id Departamento                                           |                                          | 1            | 1000         | TRUE         |
| dueño_departamento                 | Departamento                                              |                                          | 0            | 1000         | TRUE         |
| id_dueño_municipio                 | Id Municipio                                              |                                          | 1            | 1000         | TRUE         |
| dueño_municipio                    | Municipio                                                 |                                          | 0            | 1000         | TRUE         |
| dueño_zona                         | Zona                                                      |                                          | 0            | 100          | TRUE         |
| dueño_colonia                      | Colonia                                                   |                                          | 0            | 100          | TRUE         |
| profesion                          | Profesion u Oficio                                        |                                          | 2            | 250          | TRUE         |
| fuentes_ingreso                    | Fuentes de Ingreso                                        |                                          | 0            | 1000         | TRUE         |
| otras_fuentes_ingreso              | Otras Fuentes de Ingreso                                  |                                          | 0            | 1000         | FALSE        |
| nombre_empresa                     | Nombre de la empresa                                      |                                          | 2            | 250          | FALSE        |
| puesto                             | Puesto                                                    |                                          | 2            | 250          | FALSE        |
| telefono_empresa                   | Teléfono de la Empresa                                    | `^(?:\d{3}[-\s]?)?[236457]\d{7}$`        | 8            | 12           | FALSE        |
| direccion_empresa                  | Dirección de la Empresa                                   |                                          | 5            | 1000         | FALSE        |
| nombre_negocio                     | Nombre del Negocio                                        |                                          | 2            | 250          | FALSE        |
| anios_negocio                      | Años de tener el Negocio                                  |                                          | 1            | 3            | FALSE        |
| telefono_negocio                   | Teléfono del Negocio                                      | `^(?:\d{3}[-\s]?)?[236457]\d{7}$`        | 8            | 12           | FALSE        |
| direccion_negocio                  | Dirección del Negocio                                     |                                          | 5            | 1000         | FALSE        |
| antiguedad_actividad_economica     | Antigüedad en la Actividad Económica indicada             |                                          | 1            | 2            | FALSE        |
| total_ingresos_mensuales           | Total de Ingresos Mensuales Aproximados                   |                                          | 1            | 1000         | TRUE         |
| total_egresos_mensuales            | Total de Egresos Mensuales Aproximados                    |                                          | 1            | 1000         | TRUE         |
| nombre_referencia_personal         | Nombre Completo                                           |                                          | 2            | 250          | TRUE         |
| celular_referencia_personal        | Celular / Móvil                                           | `^(?:\d{3}[-\s]?)?[236457]\d{7}$`        | 8            | 12           | TRUE         |
| nombre_referencia_personal_2       | Nombre Completo                                           |                                          | 2            | 250          | FALSE        |
| celular_referencia_personal_2      | Celular / Móvil                                           | `^(?:\d{3}[-\s]?)?[236457]\d{7}$`        | 8            | 12           | FALSE        |
| nombre_referencia_personal_3       | Nombre Completo                                           |                                          | 2            | 250          | FALSE        |
| celular_referencia_personal_3      | Celular / Móvil                                           | `^(?:\d{3}[-\s]?)?[236457]\d{7}$`        | 8            | 12           | FALSE        |
| solicitante_pep                    | El solicitante es PEP                                     |                                          | 0            | 1000         | TRUE         |
| relacion_pep                       | El solicitante tiene relación con PEP                     |                                          | 0            | 1000         | FALSE        |
| asociacion_pep                     | El solicitante tiene asociación con PEP                   |                                          | 0            | 1000         | FALSE        |
| solicitante_cpe                    | El solicitante es contratista o proveedor del estado      |                                          | 0            | 1000         | FALSE        |

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
            "key": "tipo_documento_identificacion", 
            "value": "DPI"
        },
            {
            "key": "id_tipo_documento_identificacion", 
            "value": "2"
        },
        {
            "key": "numero_identificacion", 
            "value": "2409046182101"
        },
        {
            "key": "primer_nombre", 
            "value": "Juan"
        },
        {
            "key": "segundo_nombre", 
            "value": "Luis"
        },
        {
            "key": "primer_apellido", 
            "value": "Perez"
        },
        {
            "key": "segundo_apellido", 
            "value": "Perez"
        },
        {
            "key": "nit", 
            "value": "91829898"
        },       
        {
            "key": "numero_celular", 
            "value": "2364571234"
        },
        {
            "key": "telefono_linea_fija", 
            "value": "23645712"
        },
        {
            "key": "correo", 
            "value": "juan.perez@example.com"
        },
        {
            "key": "direccion", 
            "value": "4a Calle 12-34 Zona 10"
        },
         {
            "key": "id_pais", 
            "value": "1"
        },
        {
            "key": "pais", 
            "value": "Guatemala"
        },
         {
            "key": "id_dueño_departamento", 
            "value": "100"
        },
        {
            "key": "dueño_departamento", 
            "value": "Guatemala"
        },
        {
            "key": "id_dueño_municipio", 
            "value": "1"
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
            "key": "dueño_colonia", 
            "value": "Los Balcones"
        },
        {
            "key": "profesion", 
            "value": "Ingeniero"
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
            "key": "nombre_empresa", 
            "value": "Fundea"
        },    
        {
            "key": "puesto", 
            "value": "Gerente General"
        },
        {
            "key": "telefono_empresa", 
            "value": "2364571234"
        },               
        {
            "key": "direccion_empresa", 
            "value": "4ta avenida lote 55 zona 5"
        },
        {
            "key": "total_ingresos_mensuales", 
            "value": "20000"
        },
         {
            "key": "total_egresos_mensuales", 
            "value": "15000"
        },
         {
            "key": "nombre_referencia_personal", 
            "value": "Carlos Ruiz"
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
            "key": "celular_referencia_personal_2", 
            "value": "2364574444"
        },
         {
            "key": "nombre_referencia_personal_3", 
            "value": "Angela Ruiz"
        },        
        {
            "key": "celular_referencia_personal_3", 
            "value": "2364573333"
        },
        {
            "key": "solicitante_pep", 
            "value": "No"
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
        }
    ]
}'
```

### Explicación:
En el ejemplo, cada parámetro del catálogo se ha mapeado a un campo `key` y `value` dentro del array `data_points`. Así, puedes ver cómo enviar varios datos del usuario en la misma solicitud. 

Puedes modificar o eliminar los campos según sea necesario para la creación de un usuario específico.