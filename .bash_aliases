# Custom aliases
alias h='heroku'
alias k='kubectl'

# some more ls aliases
alias ll='ls -alFh'
alias la='ls -Ah'
alias l='ls -CFh'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

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
alias cloud-shell='gcloud alpha cloud-shell ssh'

function calc() {
    [[ $# == 0 ]] && return

    if command -v node >/dev/null 2&>1; then
        node -p "$@"
        return
    fi

    # Add more here, e.g. fallback to bc, python, ruby
}

function guse() {
    [[ $# == 0 ]] && return

    VERSION=$1

    # test the version exists:
    command "go$VERSION" version
    if [[ $? != 0 ]]; then
      echo "go$VERSION doesn't exist"
      return
    fi

    GOLOC=$(which go)
    mv "$GOLOC" "$GOLOC.bak"
    ln -s $(which "go$VERSION") "$GOLOC"
    rm "$GOLOC.bak"
    # tooling
    GODOC=$(which godoc)
    GONEWDOC=$(go$VERSION tool -n doc)
    [ -f "$GODOC" ] && mv "$GODOC" "$GODOC.bak"
    ln -s "$GONEWDOC" "${GOLOC}doc"
    rm -f "$GODOC.bak"
    # there's currently no gofmt equivelent: https://github.com/golang/go/issues/27166
    rm -f ${GOLOC}fmt
    ln -s "$GOPATH/sdk/go$VERSION/bin/gofmt" ${GOLOC}fmt

    echo "go => go$VERSION"
    return
}

function ginstall() {
    [[ $# == 0 ]] && return

    VERSION=$1

    go get "golang.org/dl/go$VERSION"
    command "go$VERSION" download
    guse "$VERSION"
    return
}

function whoiz() {
    # TODO: Take a flag which allows explicit switching but with a default
    local ip="$1"

    if [ -n "$2" ]; then
        whois -h asn.shadowserver.org "peer $ip"
    else
        whois -h whois.cymru.com "$ip"
    fi
}
