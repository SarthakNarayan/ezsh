if chsh -s $(which zsh) && /bin/zsh -i -c 'omz update'; then
    echo -e "Installation Successful, exit terminal and enter a new session"
else
    echo -e "Something is wrong"
fi
exit