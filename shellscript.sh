#!/bin/bash
SERVICE_NAME="newservice"
IMAGE_VERSION="latest"${BUILD_NUMBER}
TASK_FAMILY="newproject"

# Create a new task definition for this build
# sed -e "s;latest;${BUILD_NUMBER};g" flask-signup.json > flask-signup-v_${BUILD_NUMBER}.json
/usr/local/bin/aws ecs register-task-definition --family newproject --cli-input-json file://flask-signup.json

TASK_REVISION=`/usr/local/bin/aws ecs describe-task-definition --task-definition newproject | egrep "revision" | tr "/" " " | awk '{print $2}' | sed 's/"$//'`
echo $TASK_REVISION
/usr/local/bin/aws ecs update-service --cluster newcluster --service ${SERVICE_NAME} --task-definition ${TASK_FAMILY} --desired-count 1
         
