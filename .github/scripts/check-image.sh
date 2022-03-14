#!/bin/bash
set -u

echo "Checking if exist the Docker Image with TAG=$IMAGE_TAG on the ECR Repository: $ECR_REPOSITORY . . . "
echo ". "
echo ". . "
echo ". . ."

IMAGE_STATUS=$(aws ecr batch-get-image --repository-name $ECR_REPOSITORY --image-ids imageTag=$IMAGE_TAG --query 'images[].imageManifest' --output text)
if [ -n "$IMAGE_STATUS" ]; then
  echo "The image with the $IMAGE_TAG already exists on the ECR and gonna be re-use"
  echo "IMAGE_EXIST=true" >> $GITHUB_ENV
  exit 0
fi
echo "The image with the $IMAGE_TAG does't exist on the ECR and can be create"
echo "IMAGE_EXIST=false" >> $GITHUB_ENV