goaws () {
   PROFILE=$1
   export AWS_DEFAULT_PROFILE=$PROFILE
   # Can't set stage because it breaks workshops with multiple people.
   #export _SLS_STAGE=$(echo $AWS_DEFAULT_PROFILE | cut -s -d '-' -f 2)
   #if [ "$_SLS_STAGE" = "training" ]; then
   #    export SLS_STAGE="${_SLS_STAGE}-$(echo $AWS_DEFAULT_PROFILE | cut -s -d '-' -f 3)"
   #else
   #    export SLS_STAGE=${_SLS_STAGE:-prime}
   #fi

}

complete -C aws_completer aws

# Set training environment
goaws training-dev

export WORKSHOP="/workshop"
alias ws="cd ${WORKSHOP}"
