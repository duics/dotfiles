if status is-interactive
    # Commands to run in interactive sessions can go here
end

# tabtab source for packages
# uninstall by removing these lines
[ -f ~/.config/tabtab/fish/__tabtab.fish ]; and . ~/.config/tabtab/fish/__tabtab.fish; or true
# eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

fish_add_path ~/.cargo/bin

# Created by `pipx` on 2024-04-08 06:49:42
set PATH $PATH /home/maxsal/.local/bin

# Ensure configs get loaded correctly on Mac
set -x XDG_CONFIG_HOME $HOME/.config

# pnpm
set -gx PNPM_HOME /Users/max/Library/pnpm
if not string match -q -- $PNPM_HOME $PATH
    set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end
