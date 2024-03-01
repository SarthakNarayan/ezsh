# change it to true if you want to use vim mode in terminal
export VIM_MODE=true

if $VIM_MODE; then
	echo "VIM_MODE is true"
  bindkey -v

  # if you have a low keytimeout value it is not possible to use jk for escaping from insert mode
  # https://superuser.com/questions/351499/how-to-switch-comfortably-to-vi-command-mode-on-the-zsh-command-line
  export KEYTIMEOUT=20
  export VI_MODE_SET_CURSOR=true

  bindkey -v '^?' backward-delete-char # using backspace to delete
  bindkey -M viins 'jk' vi-cmd-mode # remaping esc to jk

  # move to beginning and end of line
  # https://stackoverflow.com/questions/18042685/list-of-zsh-bindkey-commands
  # https://zsh.sourceforge.io/Doc/Release/Zsh-Line-Editor.html
  bindkey -M vicmd 'H' beginning-of-line
  bindkey -M vicmd 'L' end-of-line
fi