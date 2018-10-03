### OS Specific ###:
unamestr=`uname`
if [[ "$unamestr" == 'Linux' ]]; then
  platform='Linux'
  # Arch autocomplete
  complete -c man which

  # AWS autocomplete
  complete -C '/usr/local/bin/aws_completer' aws

elif [[ "$unamestr" == 'Darwin' ]]; then
  platform='Darwin'

  # brew env
  export PATH=/usr/local/bin:/usr/local/sbin:$PATH
  export PATH=/usr/local/opt/coreutils/libexec/gnubin:$PATH
  export PATH=/usr/local/opt/gnu-tar/libexec/gnubin:$PATH

  # Virtualenvwrapper config
  #export WORKON_HOME=$HOME/.virtualenvs
  export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python
  export WORKON_HOME=~/virtualenvs
  source /usr/local/bin/virtualenvwrapper.sh
  #export VIRTUALENVWRAPPER_PYTHON=/Users/bthomsen/.virtualenvs/oaf/bin/python

  #Brew -- Bash Autocomplete
  if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
  fi

  # GoLang
  export GOPATH=$HOME/go
  export GOROOT=/usr/local/opt/go/libexec
  export PATH=$PATH:$GOPATH/bin
  export PATH=$PATH:$GOROOT/bin

  # Kubectl
  KUBECONFIG=$(find ~/.kube/kube.d/* | awk '{out=(NR==1) ? $1 : out":"$1} END{print out}')
  export KUBECONFIG
fi

### GLOBAL ###

# TMUX
if [[ -z "$TMUX" ]] ;then
    # get the id of a deattached session
    ID="`tmux ls | grep attached | cut -d: -f1`"
    # if not available create a new one
    if [[ -z "$ID" ]] ;then
        tmux new-session
    else
        # if available attach to it
        tmux attach-session -t "$ID"
    fi
fi

# Git branch in prompt
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'
}

# Kubectl context for prompt
# get_kube_context() {
#   kubectl config current-context | awk -F '.' '{print $1}'
# }

# ssh agent
if [ -z "$SSH_AUTH_SOCK" ] ; then
    eval `ssh-agent`
    ssh-add
fi

# unlimited history
export HISTSIZE=
export HISTFILESIZE=

# AWS
# PATH=~/.local/bin:$PATH
alias role='aws sts get-caller-identity'
export AWS_HOME=~/.aws
function agp {
  echo $AWS_DEFAULT_PROFILE
}
function asp {
  local prompt=${PS1}
  export AWS_DEFAULT_PROFILE=$1
  export AWS_PROFILE=$1
  #export PS1="\$AWS_DEFAULT_PROFILE $prompt"
  if [ ${AWS_PROFILE} == "prod" ]
    then
      printf -- $'\033]6;1;bg;red;brightness;90\a\033]6;1;bg;green;brightness;20\a\033]6;1;bg;blue;brightness;20\a'
    else
      printf -- $'\033]6;1;bg;red;brightness;20\a\033]6;1;bg;green;brightness;20\a\033]6;1;bg;blue;brightness;20\a'
  fi
}

#export PATH
#Prompt
export PS1="\$(parse_git_branch) \[\033[32m\]\w\[\033[00m\] $ "

#bash log
export PROMPT_COMMAND='echo -en "\033];${PWD##*/}\007"; if [ "$(id -u)" -ne 0 ]; then echo "$(date "+%Y-%m-%d.%H:%M:%S") $(pwd) $(history 1)" >> ~/.logs/bash-history-$(date "+%Y-%m-%d").log; fi'

# Load Aliases
if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi

if [ -f ~/.concur_aliases ]; then
  . ~/.concur_aliases
fi
