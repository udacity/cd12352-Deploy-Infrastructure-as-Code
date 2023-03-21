#!/bin/bash
# Automation script for CloudFormation templates. 
#
# Parameters
#   $1: Execution mode. Valid values: deploy, delete, preview.
#
# Usage examples:
#   ./run.sh deploy 
#   ./run.sh preview
#   ./run.sh delete
#

# Validate parameters
if [[ $1 != "deploy" && $1 != "delete" && $1 != "preview" ]]; then
    echo "ERROR: Incorrect execution mode. Valid values: deploy, delete, preview." >&2
    exit 1
fi

# Execute CloudFormation CLI
if [ $1 == "deploy" ]
then
    aws cloudformation deploy \
        --stack-name udacity-parametrizing-scripts-lesson \
        --template-file vpc.yml
fi
if [ $1 == "delete" ]
then
    aws cloudformation delete-stack \
        --stack-name udacity-parametrizing-scripts-lesson \
fi
if [ $1 == "preview" ]
then
    aws cloudformation deploy \
        --stack-name udacity-parametrizing-scripts-lesson \
        --template-file vpc.yml \
        --no-execute-changeset
fi
