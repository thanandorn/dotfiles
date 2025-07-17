# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export XDG_CONFIG_HOME=$HOME/.config

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/go/bin:$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  direnv
  git
  kubectl
  kubectx
  zsh-autosuggestions
  jfrog
  terraform
  thefuck
  gh
  gcloud
  aws
)

source $ZSH/oh-my-zsh.sh

export FZF_CTRL_T_OPTS="
  --preview 'bat -n --color=always {}'
  --bind 'ctrl-/:change-preview-window(down|hidden|)'"

export FZF_CTRL_R_OPTS="
  --preview 'echo {}' --preview-window up:3:hidden:wrap
  --bind 'ctrl-/:toggle-preview'
  --bind 'ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort'
  --color header:italic
  --header 'Press CTRL-Y to copy command into clipboard'"

export FZF_ALT_C_OPTS="--preview 'tree -C {}'"

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Cloud Provider CLI
complete -C aws_completer aws

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# direnv
eval "$(direnv hook zsh)"

# asdf-vm
export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/tron/Tools/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/tron/Tools/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/tron/Tools/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/tron/Tools/google-cloud-sdk/completion.zsh.inc'; fi

#alias vi='nvim -O'
alias vi='nvim -O'
alias ssh='ssh -A'
alias gcurl='curl -H "$(oauth2l header --json /tmp/credentials.json cloud-platform)" -H "Content-Type: application/json"'
export LIMA_INSTANCE=fedora
#alias docker='lima nerdctl'
alias more='less'
alias dl='curl --silent -w "Total:          %{time_total}\nDNS:            %{time_namelookup}\nConnect:        %{time_connect}\nPretransfer:    %{time_pretransfer}\nRedirect:       %{time_redirect}\nStart Transfer: %{time_starttransfer} \n" --output /dev/null '
alias dns_cache_clear="sudo dscacheutil -flushcache;sudo killall -HUP mDNSResponder"
alias yless='jless --yaml'

# Datree
eval "$(datree completion zsh)"

# kubectl
#eval "$(kubectl completion zsh)"
#eval "$(k9s completion zsh)"
eval $(helm completion zsh)
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
#eval "$(kubectl krew completion zsh)"
alias kevents="kubectl get events --sort-by='.metadata.creationTimestamp'"
alias k='kubectl'
alias kpods="kubectl get pods -o 'custom-columns=NAMESPACE:.metadata.namespace,POD:.metadata.name,IMAGE:.spec.containers[*].image'"

# TheFuck
eval $(thefuck --alias)

# glab
eval "$(glab completion -s zsh)"

# cue
eval "$(cue completion zsh)"

# argocd
eval "$(argocd completion zsh)"

autoload -U +X compinit && compinit -i
autoload -U +X bashcompinit && bashcompinit -i

# Alibaba Cloud
complete -C acs-sso acs-sso

# bash-my-aws
export PATH="$PATH:$HOME/.bash-my-aws/bin"
source ~/.bash-my-aws/aliases
autoload -U +X compinit && compinit
autoload -U +X bashcompinit && bashcompinit
source ~/.bash-my-aws/bash_completion.sh

source  $HOME/bin/tawi-utils/awsconsole-completion.sh


complete -o nospace -F /opt/homebrew/bin/aliyun aliyun

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
#export PATH="/Users/tron/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)
#export PATH="/opt/homebrew/opt/node@16/bin:$PATH"

#export $(printf "AWS_ACCESS_KEY_ID=%s AWS_SECRET_ACCESS_KEY=%s AWS_SESSION_TOKEN=%s" \
#$(aws sts assume-role \
#  --role-arn arn:aws:iam::123456789012:role/MyAssumedRole \
#  --role-session-name MySessionName \
#  --query "Credentials.[AccessKeyId,SecretAccessKey,SessionToken]" \
#  --output text))

complete -o nospace -C /opt/homebrew/bin/vault vault

# bun completions
[ -s "/Users/tron/.bun/_bun" ] && source "/Users/tron/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

eval $(jira completion zsh)

eval $(kubectl-oidc completion zsh)

# Github Cli
eval $(gh completion -s zsh)

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# dotnet
#. ~/.asdf/plugins/dotnet-core/set-dotnet-home.zsh
#. ~/.asdf/plugins/dotnet/set-dotnet-env.zsh
export PATH="$PATH:/Users/tron/.dotnet/tools"
export MODULAR_HOME="/Users/tron/.modular"
export PATH="/Users/tron/.modular/pkg/packages.modular.com_mojo/bin:$PATH"

#eval "$(atuin init zsh)"
#autoload -U compinit; compinit

# yazi
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# steampipe
source <(steampipe completion zsh)

setopt PROMPT_SUBST

show_virtual_env() {
  if [[ -n "$VIRTUAL_ENV" && -n "$DIRENV_DIR" ]]; then
    echo "($(basename $VIRTUAL_ENV))"
  fi
}
PS1='$(show_virtual_env)'$PS1


