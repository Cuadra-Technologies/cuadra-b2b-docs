#!/bin/bash
set -e

REDOCLY_IMAGE="redocly/cli"
CACHE_ROOT="public"
OUTPUT_ROOT="public/docs"
ASSETS_ROOT="assets"
ZIP_DIR="artifacts"
ZIP_OUTPUT="$ZIP_DIR/docs_bundle.zip"
DOC_PREFIX=""
SHOULD_ZIP=false

# Parse named arguments
for arg in "$@"; do
  case $arg in
    --zip=true)
      SHOULD_ZIP=true
      shift
      ;;
    --prefix=*)
      DOC_PREFIX="${arg#*=}"
      shift
      ;;
    *)
      ;;
  esac
done

echo "info: Generating documentation for all .openapi.json specs..."

echo "info: Cleaning cache..."
find "$CACHE_ROOT" -mindepth 1 -type d -exec rm -rf {} +

mkdir -p "$OUTPUT_ROOT"

# Loop over all OpenAPI spec files in current directory
for SPEC_FILE in ./*.openapi.json; do
  [ -e "$SPEC_FILE" ] || continue

  BASENAME=$(basename "$SPEC_FILE" .openapi.json)
  FOLDER_NAME="${DOC_PREFIX:-$BASENAME}"
  OUTPUT_DIR="$OUTPUT_ROOT/$FOLDER_NAME"
  OUTPUT_FILE="$OUTPUT_DIR/index.html"

  echo "info: Generating documentation from $SPEC_FILE → $OUTPUT_FILE"

  mkdir -p "$OUTPUT_DIR"

  # Copy shared assets if available
  if [ -d "$ASSETS_ROOT" ]; then
    cp -r "$ASSETS_ROOT" "$OUTPUT_DIR/"
  fi

  docker run --rm -v "$PWD:/spec" "$REDOCLY_IMAGE" build-docs "$SPEC_FILE" -o "$OUTPUT_FILE"
done

echo "success: All documentation generated under: $OUTPUT_ROOT/"

# Optional zip
if [ "$SHOULD_ZIP" = true ]; then
  echo "info: Creating ZIP archive: $ZIP_OUTPUT"
  rm -rf "$ZIP_DIR"
  mkdir -p "$ZIP_DIR"
  zip -r "$ZIP_OUTPUT" "$OUTPUT_ROOT" > /dev/null
  echo "success: ZIP archive created → $ZIP_OUTPUT"
fi
