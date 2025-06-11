alias ls='eza -l'

# List all files colorized in long format, including dot files
alias la='eza -al --git'

# List only directories
alias lsd="ls -lF --color=auto | grep --color=never '^d'"

# Gzip-enabled `curl`
alias gurl='curl --compressed'

## Display as a list, sorting by time modified
alias lt='ls -1t'

## Display the insides of a particular directory
alias lv='ls -R'

# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en0"
alias ips="ifconfig -a | grep -o 'inet6\? \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }'"

# chezmoi
alias che="chezmoi edit"
alias cha="chezmoi apply"
alias chu="chezmoi update"
alias cht="chezmoi add --template"

# Enhanced WHOIS lookups
alias whois="whois -h whois-servers.net"

# View HTTP traffic
alias sniff="sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80'"
alias httpdump="sudo tcpdump -i en1 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""

# URL-encode strings
alias urlencode='python -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1]);"'

# Lock the screen (when going AFK)
alias afk="pmset displaysleepnow"

# navigation
alias codedir='cd ~/code/'

# Git
alias grb="git rebase"
alias grbi="git rebase -i"

# Other
alias g="grep"
alias htmlcov="genhtml -o ./coverage/report ./coverage/lcov.info"
