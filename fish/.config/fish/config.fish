# Path to Oh My Fish install.
set -q XDG_DATA_HOME
  and set -gx OMF_PATH "$XDG_DATA_HOME/omf"
  or set -gx OMF_PATH "$HOME/.local/share/omf"

# Customize Oh My Fish configuration path.
#set -gx OMF_CONFIG "/home/maxsal/.config/omf"

# Load oh-my-fish configuration.
source $OMF_PATH/init.fish
source ~/.asdf/asdf.fish

# Load workstation specific confs
source ~/conf.fish

# Set path
set -gx PATH ~/.bin $PATH

# Aliases
alias ..='cd ..'
alias ...='cd ../..'
alias xclip='xclip -selection c'
alias git-clean='git branch --merged master | grep -v "\* master" | xargs -n 1 git branch -d'
alias git-root='cd (git rev-parse --show-toplevel)'
