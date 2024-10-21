

## 1. Autenticación en la API

Se proporcionará un token de autenticación de larga duración.

> **Nota**: Guarda este `token`, ya que lo necesitarás para todas las solicitudes futuras.

---

## 2. Registrar un Cliente

Una vez que estés autenticado, puedes proceder a registrar un nuevo cliente usando el endpoint de registro. Asegúrate de enviar toda la información requerida.

#### **Endpoint**
```http
POST /external/client/registry
```

#### **Cuerpo de la solicitud**
```json
{
  "cui": "2380033370713",
  "first_name": "Juan",
  "last_name": "Pérez",
  "phone": "555-1234",
  "product_key": "ABC123",
  "product_id": "98765",
  "origin": "website",
  "client_id": "CL123456",
  "data_points": [
    {
      "key": "name",
      "value": "Juan"
    }
    ...
  ]
}
```


---

## 3. Respuesta Exitosa

Si el registro del cliente es exitoso, recibirás una respuesta similar a la siguiente:

#### **Respuesta de éxito**
```json
{
  "header": {
    "title": "Registro Exitoso",
    "message": "El cliente ha sido registrado correctamente.",
    "type": "success",
    "code": "200",
    "event_id": "event_67890"
  },
  "content": {
    "client_id": "3fa85f64-5717-4562-b3fc-2c963f66afa6"
  }
}
```

---

## 4. Manejo de Errores

Si hay algún problema con los datos proporcionados o con la autenticación, la API responderá con un código de error. Aquí te mostramos cómo interpretar estos errores.

### **Posibles Errores**

1. **Solicitud incorrecta** (`400 Bad Request`):
   - Esto sucede cuando faltan campos obligatorios o los datos son incorrectos.
   - **Respuesta de ejemplo**:
   ```json
   {
     "header": {
       "title": "Solicitud Incorrecta",
       "message": "Los datos proporcionados no son válidos.",
       "type": "error",
       "code": "400",
       "event_id": "event_67891"
     }
   }
   ```

2. **Error de autenticación** (`401 Unauthorized`):
   - Si el token JWT no es válido o ha expirado.
   - **Respuesta de ejemplo**:
   ```json
   {
     "header": {
       "title": "No Autorizado",
       "message": "El token de autenticación es inválido o ha expirado.",
       "type": "error",
       "code": "401",
       "event_id": "event_67892"
     }
   }
   ```