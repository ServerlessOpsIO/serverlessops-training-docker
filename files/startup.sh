#! /bin/sh

if [ -z "$SLS_STAGE" ]; then
    read -p 'Stage name: ' sls_stage
    export SLS_STAGE=$sls_stage
fi


aws configure

# optionally clone workshop if it was not provided as a volume argument.
#if [ ! -d "/workshop/.git"  ]; then
#    echo "Cloning workshop from Github..."
#    git clone https://github.com/ServerlessOpsIO/aws-serverless-workshops.git ./
#    git submodule init
#fi

exec bash -l
