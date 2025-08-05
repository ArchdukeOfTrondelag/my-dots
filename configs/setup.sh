#!/usr/bin/env bash

cd

curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
mkdir -p ".zsh"
git clone https://github.com/sindresorhus/pure.git ".zsh/pure"

git clone https://github.com/ArchdukeOfTrondelag/my-dots .config/my-dots

mv .config/my-dots/configs/niri ~/.config
mv .config/my-dots/configs/i3 ~/.config
mv .config/my-dots/configs/nvim ~/.config
mv .config/my-dots/configs/waybar ~/.config
mv .config/my-dots/configs/polybar ~/.config
mv .config/my-dots/configs/kitty ~/.config
mv .config/my-dots/configs/rofi ~/.config
mv .config/my-dots/configs/swaylock ~/.config
mv .config/my-dots/configs/vieb ~/.config
mv .config/my-dots/configs/home/.tmux.conf ./
mv .config/my-dots/configs/home/.rgfzf.sh ./
mv .config/my-dots/configs/home/.zshrc ./

rm setup.sh
rm -rf .config/my-dots
