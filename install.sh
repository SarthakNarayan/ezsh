#!/bin/bash

if command -v zsh &> /dev/null && command -v git &> /dev/null && command -v wget &> /dev/null; then
    echo -e "ZSH and Git are already installed\n"
else
    if sudo apt install -y zsh git wget || sudo pacman -S zsh git wget || sudo dnf install -y zsh git wget || sudo yum install -y zsh git wget || brew install git zsh wget || pkg install git zsh wget ; then
        echo -e "zsh wget and git Installed\n"
    else
        echo -e "Please install the following packages first, then try again: zsh git wget \n" && exit
    fi
fi

if mv -n ~/.zshrc ~/.zshrc-backup-$(date +"%Y-%m-%d"); then # backup .zshrc
    echo -e "Backed up the current .zshrc to .zshrc-backup-date\n"
fi

echo -e "The setup will be installed in '~/.config/ezsh'\n"
echo -e "Place your personal zshrc config files under '~/.config/ezsh/zshrc/'\n"
mkdir -p ~/.config/ezsh/zshrc

echo -e "Installing oh-my-zsh\n"
if [ -d ~/.config/ezsh/oh-my-zsh ]; then
    echo -e "oh-my-zsh is already installed\n"
    git -C ~/.config/ezsh/oh-my-zsh remote set-url origin https://github.com/ohmyzsh/ohmyzsh.git
elif [ -d ~/.oh-my-zsh ]; then
    echo -e "oh-my-zsh in already installed at '~/.oh-my-zsh'. Moving it to '~/.config/ezsh/oh-my-zsh'"
    export ZSH="$HOME/.config/ezsh/oh-my-zsh"
    mv ~/.oh-my-zsh ~/.config/ezsh/oh-my-zsh
    git -C ~/.config/ezsh/oh-my-zsh remote set-url origin https://github.com/ohmyzsh/ohmyzsh.git
else
    git clone --depth=1 https://github.com/ohmyzsh/ohmyzsh.git ~/.config/ezsh/oh-my-zsh
fi

cp -f .zshrc ~/
cp -f ezshrc.zsh ~/.config/ezsh/


mkdir -p ~/.config/ezsh/zshrc         # PLACE YOUR ZSHRC CONFIGURATIONS OVER THERE
cp -f -r ./zshrc/* ~/.config/ezsh/zshrc # COPYING custom configuration to the zshrc directory in config

mkdir -p ~/.config/ezsh/prompt
cp -f -r ./prompt/* ~/.config/ezsh/prompt # COPYING prompt configuration
cp -f -r ./prompt/.p10k.zsh ~/.config/ezsh/prompt

mkdir -p ~/.cache/zsh/                # this will be used to store .zcompdump zsh completion cache files which normally clutter $HOME

if [ -f ~/.zcompdump ]; then
    mv ~/.zcompdump* ~/.cache/zsh/
fi

if [ -d ~/.config/ezsh/oh-my-zsh/plugins/zsh-autosuggestions ]; then
    cd ~/.config/ezsh/oh-my-zsh/plugins/zsh-autosuggestions && git pull
else
    git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions ~/.config/ezsh/oh-my-zsh/plugins/zsh-autosuggestions
fi

if [ -d ~/.config/ezsh/oh-my-zsh/custom/plugins/zsh-syntax-highlighting ]; then
    cd ~/.config/ezsh/oh-my-zsh/custom/plugins/zsh-syntax-highlighting && git pull
else
    git clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.config/ezsh/oh-my-zsh/custom/plugins/zsh-syntax-highlighting
fi

if [ -d ~/.config/ezsh/oh-my-zsh/custom/plugins/zsh-completions ]; then
    cd ~/.config/ezsh/oh-my-zsh/custom/plugins/zsh-completions && git pull
else
    git clone --depth=1 https://github.com/zsh-users/zsh-completions ~/.config/ezsh/oh-my-zsh/custom/plugins/zsh-completions
fi

# INSTALL FONTS

echo -e "Installing Nerd Fonts version of Hack, Roboto Mono, DejaVu Sans Mono\n"

wget -q --show-progress -N https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Hack/Regular/complete/Hack%20Regular%20Nerd%20Font%20Complete.ttf -P ~/.fonts/
wget -q --show-progress -N https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/RobotoMono/Regular/complete/Roboto%20Mono%20Nerd%20Font%20Complete.ttf -P ~/.fonts/
wget -q --show-progress -N https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/DejaVuSansMono/Regular/complete/DejaVu%20Sans%20Mono%20Nerd%20Font%20Complete.ttf -P ~/.fonts/

fc-cache -fv ~/.fonts

if [ -d ~/.config/ezsh/oh-my-zsh/custom/themes/powerlevel10k ]; then
    cd ~/.config/ezsh/oh-my-zsh/custom/themes/powerlevel10k && git pull
else
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.config/ezsh/oh-my-zsh/custom/themes/powerlevel10k
fi

if [ -d ~/.~/.config/ezsh/fzf ]; then
    cd ~/.config/ezsh/fzf && git pull
    ~/.config/ezsh/fzf/install --all --key-bindings --completion --no-update-rc
else
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.config/ezsh/fzf
    ~/.config/ezsh/fzf/install --all --key-bindings --completion --no-update-rc
fi

if [[ $1 == "--cp-hist" ]] || [[ $1 == "-c" ]]; then
    echo -e "\nCopying bash_history to zsh_history\n"
    if command -v python &>/dev/null; then
        wget -q --show-progress https://gist.githubusercontent.com/muendelezaji/c14722ab66b505a49861b8a74e52b274/raw/49f0fb7f661bdf794742257f58950d209dd6cb62/bash-to-zsh-hist.py
        cat ~/.bash_history | python bash-to-zsh-hist.py >> ~/.zsh_history
    else
        if command -v python3 &>/dev/null; then
            wget -q --show-progress https://gist.githubusercontent.com/muendelezaji/c14722ab66b505a49861b8a74e52b274/raw/49f0fb7f661bdf794742257f58950d209dd6cb62/bash-to-zsh-hist.py
            cat ~/.bash_history | python3 bash-to-zsh-hist.py >> ~/.zsh_history
        else
            echo "Python is not installed, can't copy bash_history to zsh_history\n"
        fi
    fi
else
    echo -e "\nNot copying bash_history to zsh_history, as --cp-hist or -c is not supplied\n"
fi

echo "Updating oh my zsh"
/bin/zsh -i -c 'omz update'

echo -e "Run the following command to change the default shell to zsh \n\n> sudo chsh -s $(which zsh) $USER"
