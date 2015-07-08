# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions

# Go
export GOROOT=/usr/local/go
export GOPATH=$HOME/devel/go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin

# powerline-shell
source /usr/share/powerline/bash/powerline.sh

# aliases
alias vi='vim -O'
alias ssh='ssh -A'

# AWS Completion
complete -C aws_completer aws
# The next line updates PATH for the Google Cloud SDK.
source $HOME/google-cloud-sdk/path.bash.inc
# The next line enables shell command completion for gcloud.
source $HOME/google-cloud-sdk/completion.bash.inc
