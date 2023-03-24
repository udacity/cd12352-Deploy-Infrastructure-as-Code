#!/bin/bash
# Automation script for CloudFormation templates. 
#
# Parameters
#   $1: Execution mode. Valid values: deploy, delete, preview.
#   $2: Target region.
#   $3: Name of the cloudformation stack.
#   $4: Name of the template file.
#   $5: Name of the parameters file.
#
# Usage examples:
#   ./run.sh deploy us-east-1 udacity-scripts-exercise exercise.yml exercise-params.json
#   ./run.sh preview us-east-1 udacity-scripts-exercise exercise.yml exercise-params.json
#   ./run.sh delete us-east-1 udacity-scripts-exercise
#

# Validate parameters
if [[ $1 != "deploy" && $1 != "delete" && $1 != "preview" ]]; then
    echo "ERROR: Incorrect execution mode. Valid values: deploy, delete, preview." >&2
    exit 1
fi

EXECUTION_MODE=$1
REGION=$2
STACK_NAME=$3
TEMPLATE_FILE_NAME=$4
PARAMETERS_FILE_NAME=$5

# Execute CloudFormation CLI
if [ $EXECUTION_MODE == "deploy" ]
then
    aws cloudformation deploy \
        --stack-name $STACK_NAME \
        --template-file $TEMPLATE_FILE_NAME \
        --parameter-overrides file://$PARAMETERS_FILE_NAME \
        --region=$REGION
fi
if [ $EXECUTION_MODE == "delete" ]
then
    aws cloudformation delete-stack \
        --stack-name $STACK_NAME \
        --region=$REGION
fi
if [ $EXECUTION_MODE == "preview" ]
then
    aws cloudformation deploy \
        --stack-name $STACK_NAME \
        --template-file $TEMPLATE_FILE_NAME \
        --parameter-overrides file://$PARAMETERS_FILE_NAME \
        --no-execute-changeset \
        --region=$REGION 
fi
