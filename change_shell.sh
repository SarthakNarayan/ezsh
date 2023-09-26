echo "Changing defaults shell"
sudo chsh -s $(which zsh)

echo "Updating oh my zsh"
/bin/zsh -i -c 'omz update'

echo -e "Installation Successful, exit terminal and enter a new session"
exit