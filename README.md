# ezsh
A simple script to setup an awesome shell environment.
Quickly install and setup zsh and oh-my-zsh (https://github.com/robbyrussell/oh-my-zsh) with
* powerlevel10k theme (https://github.com/romkatv/powerlevel10k)
* Nerd-Fonts (https://github.com/ryanoasis/nerd-fonts)
* zsh-completions (https://github.com/zsh-users/zsh-completions)
* zsh-autosuggestions (https://github.com/zsh-users/zsh-autosuggestions)
* zsh-syntax-highlighting (https://github.com/zsh-users/zsh-syntax-highlighting)
* fzf (https://github.com/junegunn/fzf)

Sets following useful aliases and ohmyzsh plugins. **You can add more or overwrite these in your personal zsh config files under `~/.config/ezsh/zshrc/`** 
* [x="extract"](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/extract)         - extract any compressed files
* [z](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/z)   - quickly jump to most visited directories
* myip - (wget -qO- https://wtfismyip.com/text)       - what's my ip: quickly find out external IP


## Installation
Requirements:
* `git` to clone it.
* `python3` or `python` is required to run option '-c' which copies history from .bash_history

``` bash
git clone https://github.com/SarthakNarayan/ezsh
cd ezsh
./install.sh
```
This will install the setup under `~/.config/ezsh/`
Change your terminal's fonts to either "RobotoMono Nerd Font" or "Hack Nerd Font" or "DejaVu Sans Mono Nerd Fonts".
You can also manually install Nerd Fonts of your choice.

## Sourcing new changes made to `ezshrc.zsh`

```
source ~/.zshrc
```

or if this doesn't work then

```
source ~/ezsh/ezshrc.zsh
```

## Notes
* If you are already using zsh, your zsh config will be backed up to .zshrc-backup-date

* If the text/icons look broken, make sure your terminal is using one of the Nerd fonts. [discussion](https://github.com/powerline/fonts/issues/185). I recommend "RobotoMono Nerd Font"

* All oh-my-zsh plugins are installed under `~/.config/ezsh/oh-my-zsh/` plugin, Other tools (fzf) are installed in `~/.config/ezsh/`

* The look of the shell can be very easily [customised](https://github.com/bhilburn/powerlevel9k#prompt-customization) by overwriting POWERLEVEL10K settings
in your personal config file under `~/.config/ezsh/zshrc/`. 

* You can also refer to the sample `.p10k.zsh` file in the repository to know more about the configuration options.

* If you want to add modifications to the zshrc then add files to the `zshrc` folder or modify the existing files.