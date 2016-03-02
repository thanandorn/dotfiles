# .bashrc
set show-all-if-ambiguous on
set complete-ignore-case on

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -f $HOME/.bash_aliases ]; then
  source $HOME/.bash_aliases
fi

# Go
export GOROOT=/usr/local/go
export GOPATH=$HOME/devel/go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin

# powerline-shell
source /usr/share/powerline/bash/powerline.sh

# aliases
alias vi='vim -O'
alias ssh='ssh -A'
alias ipcalc='ipcalc -nmb'
alias goss='time goss'
# http://dev.nuclearrooster.com/2009/12/07/quick-download-benchmarks-with-curl/
alias dl='curl --silent -w "Total:          %{time_total}\nDNS:            %{time_namelookup}\nConnect:        %{time_connect}\nPretransfer:    %{time_pretransfer}\nRedirect:       %{time_redirect}\nStart Transfer: %{time_starttransfer} \n" --output /dev/null '
eval "$(thefuck-alias)"

# AWS Completion
complete -C aws_completer aws

# added by travis gem
[ -f /home/tron/.travis/travis.sh ] && source /home/tron/.travis/travis.sh

function awsenv {

  profile=$1

  ak=`cat /home/tron/Documents/.aws/credentials|grep -A 2 $profile|grep aws_access_key|cut -d'=' -f 2`
  sk=`cat /home/tron/Documents/.aws/credentials|grep -A 2 $profile|grep aws_secret_access_key|cut -d '=' -f 2`
  rg=`cat /home/tron/Documents/.aws/credentials|grep -A 3 $profile|grep region|cut -d '=' -f 2`

  echo
  echo export AWS_ACCESS_KEY_ID=$ak
  export AWS_ACCESS_KEY_ID=$ak
  echo export AWS_SECRET_ACCESS_KEY=$sk
  export AWS_SECRET_ACCESS_KEY=$sk
  echo export AWS_DEFAULT_REGION=$rg
  export AWS_DEFAULT_REGION=$rg
  echo

}

# Mobile internet TTL mangling
function ttl_inc {
  sudo /sbin/iptables -t mangle -A PREROUTING -j TTL --ttl-inc 1
}

#source $(which virtualenvwrapper.sh)
source /home/tron/devel/bashton/bashton-my-aws/functions # bashton-my-aws
source /home/tron/devel/bashton/bashton-my-aws/bash_completion.sh # bashton-my-aws

# The next line updates PATH for the Google Cloud SDK.
source '/home/tron/google-cloud-sdk/path.bash.inc'

# The next line enables shell command completion for gcloud.
source '/home/tron/google-cloud-sdk/completion.bash.inc'

# Node.js
export PATH=$PATH:$HOME/node_modules/.bin
