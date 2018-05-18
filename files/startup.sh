#! /bin/sh

if [ -z "$SLS_STAGE" ]; then
    read -p 'Stage name: ' sls_stage
    export SLS_STAGE=$sls_stage
fi


aws configure

# Update materials
cd aws-serverless-workshops
git fetch origin

exec bash -l
