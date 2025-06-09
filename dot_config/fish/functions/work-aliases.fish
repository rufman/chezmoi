# Kubectl stuff
alias kpg='kubectl get po -o wide | grep'
alias kbc="kubectl"
alias kinfra="kubectl config use-context infra"
alias kcplay="kubectl config use-context cv-play"
alias kcdev="kubectl config use-context cv-dev"

# Git stuff
alias git-rpull="git pull --rebase"

# navigation
alias arista='cd ~/go/src/arista/'

# Global protect
alias gpar='globalprotect connect --portal gp.arista.com -u stephane'

function watch-apiserver
  while sleep 1; kpg apiserver; end;
end
