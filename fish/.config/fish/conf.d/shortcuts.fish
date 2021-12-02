alias ...='cd ../..'
alias ....='cd ../../../'
alias xclip='xclip -selection c'
alias git-clean='git branch --merged master | grep -v "\* master" | xargs -n 1 git branch -d'
alias git-root='cd (git rev-parse --show-toplevel)'

