# Custom aliases
alias gc='git commit -am '
alias gp='git pull --rebase'
alias gpp='gp && git push'
alias gg='git status'
alias gs='git stash'
alias gsa='git stash apply'
alias gco='git checkout '
alias gb='git branch'
alias gl="git log  --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%C(bold blue)<%an>%Creset' --abbrev-commit"
alias gbb="git for-each-ref --sort=committerdate refs/heads/ --format='%(committerdate:short) %(refname:short)'"
alias gv="git rev-parse --short HEAD"

alias webserver='python -m SimpleHTTPServer'
alias jsonprint='python -m json.tool'
