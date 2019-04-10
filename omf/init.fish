# Environment vars
set -x TERM xterm-256color
set -gx VISUAL vim
set -gx EDITOR vim
set -gx QT_STYLE_OVERRIDE gtk2
 
# Aliases
source ~/.config/omf/aliases.fish

# autojump
source ~/.config/fish/functions/autojump.fish
#source ~/anaconda3/etc/fish/conf.d/conda.fish

# Enable default conda env
#conda activate base

# Enable vi mode
fish_vi_key_bindings

# Key bindings
function fish_user_keybindings
    bind -M insert \es sudope
end
