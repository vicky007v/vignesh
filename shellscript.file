#!/bin/bash
SERVICE_NAME="newproject"
IMAGE_VERSION="latest"${BUILD_NUMBER}
TASK_FAMILY="newApp"

# Create a new task definition for this build
sed -e "s;latest;${BUILD_NUMBER};g" flask-signup.json > flask-signup-v_${BUILD_NUMBER}.json
aws ecs register-task-definition --family flask-signup --cli-input-json file://flask-signup-v_${BUILD_NUMBER}.json

aws ecs update-service --cluster default --newservice ${SERVICE_NAME} --newproject ${TASK_FAMILY}:${TASK_REVISION} --1 ${DESIRED_COUNT}'
         
