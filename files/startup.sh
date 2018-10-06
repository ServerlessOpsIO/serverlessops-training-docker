#! /bin/sh

if [ -z "$SLS_STAGE" ]; then
    read -p 'Stage name: ' sls_stage
    export SLS_STAGE=$sls_stage
fi

if [ -n "$AWS_ACCESS_KEY_ID" ]; then
    aws configure set aws_access_key_id $AWS_ACCESS_KEY_ID
    unset AWS_ACCESS_KEY_ID
fi

if [ -n "$AWS_SECRET_ACCESS_KEY" ]; then
    aws configure set aws_secret_access_key $AWS_SECRET_ACCESS_KEY
    unset AWS_SECRET_ACCESS_KEY
fi

aws configure

# optionally clone workshop if it was not provided as a volume argument.
#if [ ! -d "/workshop/.git"  ]; then
#    echo "Cloning workshop from Github..."
#    git clone https://github.com/ServerlessOpsIO/aws-serverless-workshops.git ./
#    git submodule init
#fi

exec bash -l
