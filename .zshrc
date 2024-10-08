################# DO NOT MODIFY THIS FILE #######################
####### PLACE YOUR CONFIGS IN ~/ezsh/zshrc FOLDER #######
#################################################################

# This file is created by ezsh setup.
# Place all your .zshrc configurations / overrides in a single or multiple files under ~/ezsh/zshrc/ folder

# Load ezsh configurations
source "$HOME/.config/ezsh/ezshrc.zsh"

# Now source oh-my-zsh.sh so that any plugins added in ~/.config/ezsh/zshrc/* files also get loaded
source $ZSH/oh-my-zsh.sh


# Configs that can only work after "source $ZSH/oh-my-zsh.sh", such as Aliases that depend oh-my-zsh plugins

# Now source fzf.zsh , otherwise Ctr+r is overwritten by ohmyzsh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_OPS="--extended"

# Any zshrc configurations under the folder ~/ezsh/zshrc/ will override the default ezsh configs.
# Place all of your personal configurations over there
ZSH_CONFIGS_DIR="$HOME/.config/ezsh/zshrc"


if [ "$(ls -A $ZSH_CONFIGS_DIR)" ]; then
    for file in "$ZSH_CONFIGS_DIR"/*; do
        source "$file"
    done
fi