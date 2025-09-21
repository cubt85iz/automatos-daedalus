# Builds the image for the repository.
[linux]
build:
  #!/usr/bin/env bash

  set -euxo pipefail

  BASE_IMAGE=$(jq -r '.base_image' .config/daedalus)
  BASE_IMAGE_TAG=$(jq -r '.base_image_tag' .config/daedalus)
  MACHINE="daedalus"
  ROOT="core"

  podman build \
    -t automatos-$MACHINE:latest \
    --build-arg BASE_IMAGE="$BASE_IMAGE" \
    --build-arg BASE_IMAGE_TAG="$BASE_IMAGE_TAG" \
    --build-arg MACHINE="$MACHINE" \
    --build-arg ROOT="$ROOT" \
    -f core/Containerfile \
    .

# Updates the submodule for automatos.
update:
  @git submodule update --remote core

