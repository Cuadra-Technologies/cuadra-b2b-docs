# Quick Guide: Rebuild API Documentation Using Docker and Redocly

## Prerequisites
1. **Docker Installed**  
   Ensure Docker is installed and running on your machine.

2. **Access to `reference.openapi.json`**  
   Confirm that the OpenAPI spec file `reference.openapi.json` is available in your project folder.

## Steps to Rebuild the Documentation

1. **Open a Terminal**  
   Navigate to the folder where `reference.openapi.json` is located. This is important because Docker will reference the file from this directory.

2. **Run the Docker Command**  
   To generate the documentation, execute the following command in the terminal:

   ```bash
   docker run --rm -v $PWD:/spec redocly/cli build-docs reference.openapi.json -o ./public/docs/call_validation/index.html
   ```

   This command will:

   * Pull and use the Redocly CLI Docker image (if not already available).
   * Mount your current working directory (using `$PWD`) to the `/spec` folder inside the Docker container.
   * Build the documentation using `reference.openapi.json` as the source.
   * Output the generated documentation as `./public/docs/call_validation/index.html` in your current directory.

3. **Verify the Output**
   After the command completes, you'll find the HTML file `public/docs/call_validation/index.html` in your current folder. You can open this file in a browser to view the updated static documentation.

## Customization (Optional)

* If needed, adjust the output filename by modifying the `-o` option in the command. For example:

  ```bash
  docker run --rm -v $PWD:/spec redocly/cli build-docs reference.openapi.json -o custom_output.html
  ```

---

## Rebuild All Docs Automatically with Script

Instead of manually building the documentation, you can run the build script to automatically generate documentation for all `.openapi.json` files in the project, including `reference.openapi.json`.

### To run it:

```bash
./scripts/build-docs.sh
```

This script will:

* Detect every `.openapi.json` file in the current directory.
* Generate an HTML file for each one under `public/docs/<spec-name>/index.html`.
* If it finds `reference.openapi.json`, it will generate the main documentation at `public/docs/index.html`.

Make sure the script is executable:

```bash
chmod +x ./scripts/build-docs.sh
```

You can open any of the generated HTML files in a browser to view the documentation.