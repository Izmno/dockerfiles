#!/bin/bash
# Get the list of subdirectories
subdirs=$(find . -type d)

for subdir in $subdirs; do
  # Check if the subdirectory contains a Dockerfile
  if [ -f "$subdir/Dockerfile" ]; then
    echo "Building docker image docker.izmno.be/dockerfiles/$(basename $subdir):latest"

    docker build -t docker.izmno.be/dockerfiles/$(basename $subdir):latest "$subdir" 
    docker push docker.izmno.be/dockerfiles/$(basename $subdir):latest
  fi
done

docker buildx build \
  --platform linux/amd64,linux/arm64 \
  --push \
  -t simondemeyere/gh-ost:latest \
  gh-ost
