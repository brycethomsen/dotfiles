# git
alias ga='git add'
alias gb='git branch'
alias gc='git checkout'
alias gd='git diff'
alias gl='git log --graph --decorate --pretty=oneline --abbrev-commit'
alias gt='git tag'
alias gp='git pull'
alias gs='git status'
alias gcm='git commit -m'
alias gpo='git push origin'

# docker
alias dm='docker-machine'
alias dc='docker-compose'

# python - update all pip packages
alias pipup='pip3 freeze --local | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 pip3 install -U'

# dockerized utilities
alias ctop='docker run -ti  --rm -v /var/run/docker.sock:/var/run/docker.sock quay.io/vektorlab/ctop:latest'
alias wee='docker run -it -e TZ=America/Los_Angeles -v "${HOME}/.weechat:/home/user/.weechat" wee-slack'
#alias aws-shell="docker run -it --rm -v $HOME/.aws/:/root/.aws aws-shell"
alias docker_drift="docker run -it --rm --privileged --pid=host debian nsenter -t 1 -m -u -n -i date -u $(date -u +%m%d%H%M%Y)"
# alias meta='~/git/ec2metadata-role-assumption/setup.sh; make daemon -C ~/git/ec2metadata-role-assumption'
#alias aws='docker run --rm -v "$(ls -d ~/.aws):/root/.aws" -it brycetho/stevedore:aws aws'
# alias aws-shell='docker run --rm -v "$(ls -d ~/.aws):/root/.aws" -it brycetho/stevedore:aws-shell aws-shell'
# pvim () { docker run --rm -v `pwd`:/pvim -e VUSER=$USER -e FILE=$1 -it brycetho/pvim ; }
# py () { docker run --rm -v `pwd`:/py -e FILE=$1 -it brycetho/stevedore:py ; }

### Dockerized Runtime Envs ###
# groovy - https://hub.docker.com/_/groovy/
alias groovysh="docker run -it --rm -v grapes-cache:/home/groovy/.groovy/grapes groovy:alpine"
alias groovy="docker run --rm -v grapes-cache:/home/groovy/.groovy/grapes -v "$PWD":/home/groovy/scripts -w /home/groovy/scripts groovy:alpine groovy"
# Linux
alias centos="docker run -it --rm -v `pwd`:/shared centos:latest /bin/bash"
alias alpine="docker run -it --rm -v `pwd`:/shared alpine:latest /bin/sh"
alias ubuntu="docker run -it --rm -v `pwd`:/shared ubuntu:latest /bin/bash"

### OS Specific ###
if [[ "$distro" == 'ubuntu' ]]; then
  alias update='sudo apt update && sudo apt upgrade -y && sudo apt autoremove && sudo flatpak update'
elif [[ "$distro" == 'arch' ]]; then
  alias update='sudo pacman -Syu && sudo flatpak update'
elif [[ "$platform" == 'Darwin' ]]; then
  alias update="brew update && brew upgrade && brew cask upgrade && brew cleanup"
  #alias update='sudo softwareupdate -ia'
fi
