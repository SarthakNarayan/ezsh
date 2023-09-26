# change it to true if you want to use vim mode in terminal
export VIM_MODE=false

if $VIM_MODE; then
	echo "VIM_MODE is true"
    bindkey -v

    # if you have a low keytimeout value it is not possible to use jk for escaping from insert mode
    # https://superuser.com/questions/351499/how-to-switch-comfortably-to-vi-command-mode-on-the-zsh-command-line
    export KEYTIMEOUT=20 

    # Use vim keys in tab complete menu:
    bindkey -M menuselect 'h' vi-backward-char
    bindkey -M menuselect 'k' vi-up-line-or-history
    bindkey -M menuselect 'l' vi-forward-char
    bindkey -M menuselect 'j' vi-down-line-or-history
    bindkey -M menuselect '^[[Z' vi-up-line-or-history

    bindkey -v '^?' backward-delete-char # using backspace to delete
    bindkey -M viins 'jk' vi-cmd-mode # remaping esc to jk

    # move to beginning and end of line
    # https://stackoverflow.com/questions/18042685/list-of-zsh-bindkey-commands
    # https://zsh.sourceforge.io/Doc/Release/Zsh-Line-Editor.html
    bindkey -M vicmd 'H' beginning-of-line
    bindkey -M vicmd 'L' end-of-line

    # Change cursor shape for different vi modes.
    function zle-keymap-select () {
        case $KEYMAP in
            vicmd) echo -ne '\e[1 q';;      # block
            viins|main) echo -ne '\e[5 q';; # beam
        esac
    }
    zle -N zle-keymap-select
    zle-line-init() {
        zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
        echo -ne "\e[5 q"
    }
    zle -N zle-line-init
    echo -ne '\e[5 q' # Use beam shape cursor on startup.
    preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

fi