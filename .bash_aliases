# git - aliases
alias ga='git add'
alias gb='git branch'
alias gc='git checkout'
alias gd='git diff'
alias gl='git log'
alias gt='git tag'
alias gp='git pull'
alias gs='git status'
alias gcm='git commit -m'
alias gpo='git push origin'

# docker - aliases
alias dm='docker-machine'
alias dc='docker-compose'

# python - update all pip packages
alias pipup='pip3 freeze --local | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 pip3 install -U'

# Docker alias
alias ctop='docker run -ti --name ctop --rm -v /var/run/docker.sock:/var/run/docker.sock quay.io/vektorlab/ctop:latest'
# alias meta='~/git/ec2metadata-role-assumption/setup.sh; make daemon -C ~/git/ec2metadata-role-assumption'
#alias aws='docker run --rm -v "$(ls -d ~/.aws):/root/.aws" -it brycetho/stevedore:aws aws'
# alias aws-shell='docker run --rm -v "$(ls -d ~/.aws):/root/.aws" -it brycetho/stevedore:aws-shell aws-shell'
# pvim () { docker run --rm -v `pwd`:/pvim -e VUSER=$USER -e FILE=$1 -it brycetho/pvim ; }
# py () { docker run --rm -v `pwd`:/py -e FILE=$1 -it brycetho/stevedore:py ; }

### Concur utilities ###
alias aws-shell="docker run -it --rm -v $HOME/.aws/:/root/.aws aws-shell"
alias docker_drift="docker run -it --rm --privileged --pid=host debian nsenter -t 1 -m -u -n -i date -u $(date -u +%m%d%H%M%Y)"
alias singapore-aws="make renew -C ~/git/resources/auth ARGS='-e aws-cn-poc -r aws-cn-poc-iopsSystems'"
alias nonporod-aws="make renew -C ~/git/resources/auth ARGS='-e da-nonprod-comm -r da-nonprod-comm-RETeam'"
alias emea-aws="make renew -C ~/git/resources/auth ARGS='-e da-eu-prod-comm -r da-eu-prod-comm_Admins'"
alias qa-aws="make renew -C ~/git/resources/auth ARGS='-e aws-qa -r aws-qa_iopsSystems'"
alias dev-aws="make renew -C ~/git/resources/auth ARGS='-e aws-dev -r aws-dev_iopsSystems'"
alias lint="docker run -it -v `pwd`:/lint/ quay.cnqr.delivery/da-iam/images:2-python-lint"
alias lint3="docker run -it -v $PWD:/lint/ quay.cnqr.delivery/da-iam/images:3-python-lint"

alias helm-client="docker run -it --rm -v ~/.kube/kube.d/kubeconfig-t17a.us-west-2.nonprod:/kubeconf/t17a:ro -v $PWD:/helm -w /helm -e KUBECONFIG=/kubeconf/t17a quay.cnqr.delivery/containerhosting/helm-client"


### Dockerized Runtime Envs ###

# groovy - https://hub.docker.com/_/groovy/
alias groovysh="docker run -it --rm -v grapes-cache:/home/groovy/.groovy/grapes groovy:alpine"
alias groovy="docker run --rm -v grapes-cache:/home/groovy/.groovy/grapes -v "$PWD":/home/groovy/scripts -w /home/groovy/scripts groovy:alpine groovy"

### OS Specific ###
if [[ "$platform" == 'Linux' ]]; then
  alias update='sudo apt update && apt upgrade -y && apt autoremove'
elif [[ "$platform" == 'Darwin' ]]; then
  alias brewup="brew update && brew upgrade && brew cask cleanup && brew cleanup && osascript -e 'display notification \"Update finished\" with title \"Brew\"'"
  alias update='sudo softwareupdate -ia'
fi
