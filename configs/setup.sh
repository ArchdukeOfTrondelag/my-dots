#!/usr/bin/env bash

cd

rm -r .config/niri
rm -r .config/i3
rm -r .config/nvim
rm -r .config/waybar
rm -r .config/polybar
rm -r .config/kitty
rm -r .config/rofi
rm -r .config/swaylock
rm -r .config/vieb/viebrc
rm .tmux.conf
rm .zshrc

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








clear

echo " Now you have a set of programs ready for use "
echo " Those are: "
echo " Niri "
echo " Rofi "
echo " Waybar "
echo " Polybar "
echo " i3 "
echo " zsh "
echo " neovim "
echo " tmux "
echo " kitty "
echo " swaylock "
echo "   "
echo " A few usefull commands that are added are: "
echo "   "
echo " c to change directory with a fuzzy finder "
echo " f to find and open a file based on a word or text inside the file (with ripgrep) "
echo " s to fuzzy find and open a file "
echo " cs to fuzzy find a directory and open a new named file "
echo "   "
echo " all of these open in nvim "
echo " ************************************************* "


