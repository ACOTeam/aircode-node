#!/bin/bash
if docker history -q  "$TAG" 2>&1 >/dev/null; then
  echo "$TAG exists..."
else
  echo "$TAG doesn't exist..."
  docker build -f ./deploy/Dockerfile.base -t $TAG .
fi
