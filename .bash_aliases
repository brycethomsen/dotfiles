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

# dockerized utilities
alias ctop='docker run -ti  --rm -v /var/run/docker.sock:/var/run/docker.sock quay.io/vektorlab/ctop:latest'
alias wee='docker run -it -e TZ=America/Los_Angeles -v "${HOME}/.weechat:/home/user/.weechat" wee-slack'
alias aws-shell="docker run -it --rm -v $HOME/.aws/:/root/.aws aws-shell"
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
if [[ "$platform" == 'Linux' ]]; then
  alias update='sudo apt update && apt upgrade -y && apt autoremove'
elif [[ "$platform" == 'Darwin' ]]; then
  alias update="brew update && brew upgrade && && brew cask upgrade && brew cask cleanup && brew cleanup && osascript -e 'display notification \"Update finished\" with title \"Brew\"'"
  #alias update='sudo softwareupdate -ia'
fi

### Concur utilities ###
# AWS Auth
alias aws-singapore="make renew -C ~/git/resources/auth ARGS='-e aws-cn-poc -r aws-cn-poc-iopsSystems'"
alias aws-nonporod="make renew -C ~/git/resources/auth ARGS='-e da-nonprod-comm -r da-nonprod-comm-RETeam'"
alias aws-emea="make renew -C ~/git/resources/auth ARGS='-e da-eu-prod-comm -r da-eu-prod-comm_Admins'"
alias aws-qa="make renew -C ~/container/aws-okta-auth ARGS='-a 0oa3nt2v27BnZBxMg0x7/272 -o concurasp -u bthomsen -n aws-qa_k8Admins'"
alias aws-dev="make renew -C ~/git/resources/auth ARGS='-e aws-dev -r aws-dev_iopsSystems'"
alias aws-da-prod="make renew -C ~/git/resources/auth ARGS='-e da-us-prod-comm -r aws-da-us-prod-comm_superAdmins'"
# K8s
alias get2gs="echo -e '127.0.0.1\tseags1am.cnqr.delivery' | sudo tee --append /etc/hosts > /dev/null; ssh -L 9443:seags1am.cnqr.delivery:443 seags1bast001 -N"
# Utils
alias lint="docker run -it -v `pwd`:/lint/ quay.cnqr.delivery/da-iam/images:2-python-lint"
alias lint3="docker run -it -v $PWD:/lint/ quay.cnqr.delivery/da-iam/images:3-python-lint"
alias helm-client="docker run -it --rm -v ~/.kube/kube.d/kubeconfig-t17a.us-west-2.nonprod:/kubeconf/t17a -v $PWD:/helm -w /helm -e KUBECONFIG=/kubeconf/t17a quay.cnqr.delivery/containerhosting/helm-client"
#function kn() { kubectl config set-context ${kubectl config current-context} --namespace=$1 ; }
