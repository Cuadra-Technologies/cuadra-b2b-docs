# Quick Guide: Rebuild Documentation for `servicio_registro_clientes.json` with Docker

## Prerequisites
1. **Docker Installed**  
   Ensure Docker is installed and running on your machine.

2. **Access to `servicio_registro_clientes.json`**  
   Confirm that the OpenAPI spec file `servicio_registro_clientes.json` is available in your project folder.

## Steps to Rebuild the Documentation

1. **Open a Terminal**  
   Navigate to the folder where `servicio_registro_clientes.json` is located. This is important because Docker will reference the file from this directory.

2. **Run the Docker Command**  
   To generate the documentation, execute the following command in the terminal:

   ```bash
   docker run --rm -v $PWD:/spec redocly/cli build-docs servicio_registro_clientes.json -o doc_registro_cliente.html
   ```

   This command will:
   - Pull and use the Redocly CLI Docker image (if not already available).
   - Mount your current working directory (using `$PWD`) to the `/spec` folder inside the Docker container.
   - Build the documentation using `servicio_registro_clientes.json` as the source.
   - Output the generated documentation as `doc_registro_cliente.html` in your current directory.

3. **Verify the Output**  
   After the command completes, you'll find the HTML file `doc_registro_cliente.html` in your current folder. You can open this file in a browser to view the updated static documentation.

## Customization (Optional)
- If needed, adjust the output filename by modifying the `-o` option in the command. For example:

   ```bash
   docker run --rm -v $PWD:/spec redocly/cli build-docs servicio_registro_clientes.json -o custom_output.html
   ```
