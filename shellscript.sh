#!/bin/bash
SERVICE_NAME="newservice"
IMAGE_VERSION="latest"${BUILD_NUMBER}
TASK_FAMILY="newproject"

# Create a new task definition for this build
sed -e "s;latest;${BUILD_NUMBER};g" flask-signup.json > flask-signup-v_${BUILD_NUMBER}.json
aws ecs register-task-definition --family newproject --cli-input-json file://flask-signup-v_${BUILD_NUMBER}.json

TASK_REVISION=`aws ecs describe-task-definition --task-definition newApp | egrep "revision" | tr "/" " " | awk '{print $2}' | sed 's/"$//'`

aws ecs update-service --cluster default --newservice ${SERVICE_NAME} --newproject ${TASK_FAMILY}:${TASK_REVISION} --desired-count 1
         
