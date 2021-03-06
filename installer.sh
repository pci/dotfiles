#!/bin/bash
cd ~/
mv .screenrc .screenrc_bak
ln -s dotfiles/.screenrc .screenrc
mv .bash_profile .bash_profile_bak
ln -s dotfiles/.bash_profile .bash_profile
mv .bashrc .bashrc_bak
ln -s dotfiles/.bashrc .bashrc
mv .vimrc .vimrc_bak
ln -s dotfiles/.vimrc .vimrc
mv .vim .vim_bak
ln -s dotfiles/.vim .vim
mv .bash_aliases .bash_aliases_bak
ln -s dotfiles/.bash_aliases .bash_aliases
mv .git-prompt.sh .git-prompt.sh.bak
ln -s dotfiles/.git-prompt.sh .git-prompt.sh
mv .xmonad .xmonad_bak
ln -s dotfiles/.xmonad .xmonad
mv .psqlrc .psqlrc_bak
ln -s dotfiles/.psqlrc .psqlrc
mv .zshrc .zshrc_bak
ln -s dotfiles/.zshrc .zshrc

# Install the vim plugins
vim +PlugInstall +qall

echo "Dotfiles installed"

