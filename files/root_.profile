# Git
export GITAWAREPROMPT=~/.bash/git-aware-prompt
source "${GITAWAREPROMPT}/main.sh"

export PS1="[${SLS_STAGE}@\h:\${AWS_DEFAULT_PROFILE} \W\[$txtcyn\]\$git_branch\[$txtred\]\$git_dirty\[$txtrst\]]\$ "

if [ -f ~/.bashrc ]; then . ~/.bashrc; fi
