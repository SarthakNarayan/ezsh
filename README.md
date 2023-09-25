# ezsh
A simple script to setup an awesome shell environment.
Quickly install and setup zsh and oh-my-zsh (https://github.com/robbyrussell/oh-my-zsh) with
* powerlevel10k theme (https://github.com/romkatv/powerlevel10k)
* Nerd-Fonts (https://github.com/ryanoasis/nerd-fonts)
* zsh-completions (https://github.com/zsh-users/zsh-completions)
* zsh-autosuggestions (https://github.com/zsh-users/zsh-autosuggestions)
* zsh-syntax-highlighting (https://github.com/zsh-users/zsh-syntax-highlighting)
* history-substring-search (https://github.com/zsh-users/zsh-history-substring-search)
* fzf (https://github.com/junegunn/fzf)

Sets following useful aliases and ohmyzsh plugins. **You can add more or overwrite these in your personal zsh config files under `~/.config/ezsh/zshrc/`** 
* [x="extract"](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/extract)         - extract any compressed files
* [z](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/z)   - quickly jump to most visited directories
* myip - (wget -qO- https://wtfismyip.com/text)       - what's my ip: quickly find out external IP

## Demo

Command prompt looks like this (easily customize it by placing your configs in ~/.config/ezsh/zshrc/)
![prompt](https://user-images.githubusercontent.com/8462091/43674765-8bb13a76-9817-11e8-8b7b-16b8b1998408.png)
user :  directory  :  git stats : last command exit code                     free memory: load : time

Watch this to get an idea of what your Shell (well, life!) could be like!!

[![asciicast](https://asciinema.org/a/225226.svg)](https://asciinema.org/a/225226)


## Installation
Requirements:
* `git` to clone it.
* `python3` or `python` is required to run option '-c' which copies history from .bash_history

``` bash
git clone https://github.com/jotyGill/ezsh
cd ezsh
./install.sh -c        # only run with '-c' the first time, running multiple times will duplicate history entries
```
This will install the setup under `~/.config/ezsh/`
Change your terminal's fonts to either "RobotoMono Nerd Font" or "Hack Nerd Font" or "DejaVu Sans Mono Nerd Fonts".
You can also manually install Nerd Fonts of your choice.

## Notes
* If you are already using zsh, your zsh config will be backed up to .zshrc-backup-date

* If the text/icons look broken, make sure your terminal is using one of the Nerd fonts. [discussion](https://github.com/powerline/fonts/issues/185). I recommend "RobotoMono Nerd Font"

* All oh-my-zsh plugins are installed under ~/.config/ezsh/oh-my-zsh/plugin, Other tools (fzf) are installed in ~/.config/ezsh/

* The look of the shell can be very easily customised[https://github.com/bhilburn/powerlevel9k#prompt-customization] by overwriting POWERLEVEL10K settings
in your personal config file under ~/.config/ezsh/zshrc/ . See my setup under example/personal_rc.zsh

Suggestions about more cool tools are always welcome :)
