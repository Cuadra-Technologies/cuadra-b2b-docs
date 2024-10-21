# Redocly Static Page with Docker

This guide explains how to build a static page for your OpenAPI specification using Redocly and Docker.

## Prerequisites

- Docker installed on your machine.
- An OpenAPI specification file (e.g., `openapi/petstore.json`).

## Steps to Build the Static Docs

1. Ensure you have your OpenAPI specification file ready. The default example uses `openapi/petstore.json`, but you can adjust the path to your own specification.

2. Run the following command to generate the static documentation:

    ```bash
    docker run --rm -v $PWD:/spec redocly/cli build-docs openapi/petstore.json -o doc_folder/filename.html
    ```

    This command will:
    
    - Pull the Redocly CLI Docker image if you don’t have it.
    - Mount your current working directory (`$PWD`) to the `/spec` folder inside the container.
    - Use the Redocly CLI to build the documentation from your OpenAPI file (`openapi/petstore.yaml`).
    - Export file in specific path and spcific name (`doc_folder/filename.html`)

3. After the build completes, the static HTML files will be available in the `openapi/` folder (or the folder where your OpenAPI file resides), in this case this will export on `doc_folder/filename.html`.

## Customizing the Command

- If your OpenAPI file is in a different directory, adjust the file path. For example:

    ```bash
    docker run --rm -v $PWD:/spec redocly/cli build-docs path/to/your/openapi.yaml -o doc_folder/filename.html
    ```

- You can also specify additional [Redocly CLI options](https://redocly.com/docs/cli/commands/build-docs/) if needed.

## Conclusion

This method allows you to easily generate static documentation from an OpenAPI file without installing Redocly locally by utilizing Docker.
