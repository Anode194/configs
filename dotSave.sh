#!/bin/sh

cp ~/.config/alacritty/alacritty.toml alacritty/alacritty.toml
cp -R ~/.config/alacritty/themes/themes/*.toml alacritty/themes/themes/
cp ~/.config/ohmyzsh/.aliases .aliases
cp -R ~/.config/nvim/init.vim ~/Code/configs/nvim/init.vim
cp -R ~/.config/joplin/keymap.json Joplin/keymap.json


#cp -R ~/Code/configs/nvim/nvim ~/.config/
#cp ~/Code/configs/.aliases ~/.oh-my-zsh/.aliases

