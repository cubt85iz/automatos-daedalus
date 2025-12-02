# Builds the image for the repository.
[linux]
build:
  #!/usr/bin/env bash

  set -euxo pipefail

  # Grab values from config.json
  BASE_IMAGE=$(jq -r '.base_image' config/config.json)
  BASE_IMAGE_TAG=$(jq -r '.base_image_tag' config/config.json)

  # Set default values
  BASE_IMAGE=${BASE_IMAGE:-}
  BASE_IMAGE_TAG=${BASE_IMAGE_TAG:-}
  ROOT="core"

  if [ -n "$BASE_IMAGE" ]; then
    if [ -n "$BASE_IMAGE_TAG" ]; then
      podman build \
        -t automatos-cyclops:latest \
        --build-arg BASE_IMAGE="$BASE_IMAGE" \
        --build-arg BASE_IMAGE_TAG="$BASE_IMAGE_TAG" \
        --build-arg ROOT="$ROOT" \
        -f $ROOT/Containerfile \
        .
    else
      echo "ERROR: A value for base_image_tag must be provided in config.json file."
      exit 1
    fi
  else
      echo "ERROR: A value for base_image must be provided in config.json file."
      exit 1
  fi

# Updates the submodule for automatos.
update:
  @git submodule update --remote core

