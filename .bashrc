# TMUX
if [[ -z "$TMUX" ]] ;then
    ID="`tmux ls | grep -vm1 attached | cut -d: -f1`" # get the id of a deattached session
    if [[ -z "$ID" ]] ;then # if not available create a new one
        tmux new-session
    else
        tmux attach-session -t "$ID" # if available attach to it
    fi
fi

#PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
export PATH=/usr/local/bin:/usr/local/sbin:$PATH

# Arch autocomplete
complete -c man which

# GoLang
export PATH=$PATH:/usr/local/go/bin
export PATH="$PATH:~/go/bin"

# Update all the things
alias brewup="sudo chown -R $(whoami) /usr/local/bin && brew update && brew upgrade && brew cask cleanup && brew cleanup&& osascript -e 'display notification \"Update finished\" with title \"Brew\"'"
alias update='sudo softwareupdate -iva'
alias pipup='pip freeze --local | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 pip install -U'

# fix docker time creep
alias timefix="docker run -it --rm --privileged --pid=host debian nsenter -t 1 -m -u -n -i date -u $(date -u +%m%d%H%M%Y)"

# AWS autocomplete
complete -C '/usr/local/bin/aws_completer' aws

# Git branch
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# Virtualenvwrapper config
#export WORKON_HOME=$HOME/.virtualenvs
#source /usr/local/bin/virtualenvwrapper.sh
#export VIRTUALENVWRAPPER_PYTHON=/Users/bthomsen/.virtualenvs/oaf/bin/python

# brew path
export PATH=/usr/local/bin:/usr/local/sbin:$PATH

# git aliases
alias ga='git add'
alias gb='git branch'
alias gc='git checkout'
alias gd='git diff'
alias gl='git log'
alias gp='git pull'
alias gs='git status'
alias gcm='git commit -m'
alias gpo='git push origin '

# unlimited history
export HISTSIZE=
export HISTFILESIZE=

# AWS
export PATH=~/.local/bin:$PATH
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

#Prompt
export PS1="\[\033[0;36m\]\$AWS_DEFAULT_PROFILE \[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "

#bash log
export PROMPT_COMMAND='echo -en "\033];${PWD##*/}\007"; if [ "$(id -u)" -ne 0 ]; then echo "$(date "+%Y-%m-%d.%H:%M:%S") $(pwd) $(history 1)" >> ~/.logs/bash-history-$(date "+%Y-%m-%d").log; fi'

#Docker alias
alias ctop='docker run -ti --name ctop --rm -v /var/run/docker.sock:/var/run/docker.sock quay.io/vektorlab/ctop:latest'
alias meta='~/git/ec2metadata-role-assumption/setup.sh; make daemon -C ~/git/ec2metadata-role-assumption'
#alias aws='docker run --rm -v "$(ls -d ~/.aws):/root/.aws" -it brycetho/stevedore:aws aws'
alias aws-shell='docker run --rm -v "$(ls -d ~/.aws):/root/.aws" -it brycetho/stevedore:aws-shell aws-shell'
pvim () { docker run --rm -v `pwd`:/pvim -e VUSER=$USER -e FILE=$1 -it brycetho/pvim ; }
py () { docker run --rm -v `pwd`:/py -e FILE=$1 -it brycetho/stevedore:py ; }
