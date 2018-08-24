# Custom aliases
alias h='heroku'
alias k='kubectl'

alias gc='git commit -am '
alias gp='git pull --ff-only'
alias gpr='git pull --rebase'
alias gpp='gp && git push'
alias gg='git status'
alias gs='git stash'
alias gsa='git stash apply'
alias gco='git checkout '
alias gb='git branch'
alias gl="git log  --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%C(bold blue)<%an>%Creset' --abbrev-commit"
alias gbb="git for-each-ref --sort=committerdate refs/heads/ --format='%(HEAD) %(color:yellow)%(refname:short)%(color:reset) - %(color:red)%(objectname:short)%(color:reset) - %(contents:subject) - %(authorname) (%(color:green)%(committerdate:relative)%(color:reset))'"
alias gv="git rev-parse --short HEAD"

alias uuid='uuidgen | tr -d "\n" | pbcopy'
alias webserver='python -m SimpleHTTPServer'
alias jsonprint='python -m json.tool'

function calc() {
    [[ $# == 0 ]] && return

    if command -v node >/dev/null 2&>1; then
        node -p "$@"
        return
    fi

    # Add more here, e.g. fallback to bc, python, ruby
}
