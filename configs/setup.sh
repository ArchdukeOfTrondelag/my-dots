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

clear

echo " Which profile do you wish for? "
echo " type w for wayland "
echo " or x for xorg/x11 "
echo " or type wx for wayland and xorg "
echo " it's important that you write in lower case "
echo " otherwise none of them will be installed "
echo " this can also be if you don't want any config installed, type nothing or something else "

read -r valg

if [ "$valg" = "w" ]; then
  mv .config/my-dots/configs/niri ~/.config
  mv .config/my-dots/configs/waybar ~/.config
  mv .config/my-dots/configs/swaylock ~/.config
fi

if [ "$valg" = "x" ]; then
  mv .config/my-dots/configs/i3 ~/.config
  mv .config/my-dots/configs/polybar ~/.config
  mv .config/my-dots/configs/rofi ~/.config
fi

if [ "$valg" = "wx" ]; then
  mv .config/my-dots/configs/niri ~/.config
  mv .config/my-dots/configs/waybar ~/.config
  mv .config/my-dots/configs/swaylock ~/.config

  mv .config/my-dots/configs/i3 ~/.config
  mv .config/my-dots/configs/polybar ~/.config
  mv .config/my-dots/configs/rofi ~/.config
fi


mv .config/my-dots/configs/nvim ~/.config
mv .config/my-dots/configs/kitty ~/.config

mv .config/my-dots/configs/home/.tmux.conf ./
mv .config/my-dots/configs/home/.rgfzf.sh ./
mv .config/my-dots/configs/home/.zshrc ./

rm -r .config/my-dots

clear

tmux

clear

echo " "
echo " Now you have a set of programs ready for use "
echo " Those are: "

if [ "$valg" = "w" ]; then
  echo " Niri "
  echo " Waybar "
  echo " swaylock "
fi

if [ "$valg" = "x" ]; then
  echo " i3 "
  echo " Rofi "
  echo " Polybar "
fi

if [ "$valg" = "wx" ]; then
  echo " Niri "
  echo " Waybar "
  echo " swaylock "

  echo " i3 "
  echo " Rofi "
  echo " Polybar "
fi

echo " zsh "
echo " neovim "
echo " tmux "
echo " kitty "
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
echo "  "
echo " For the bash script to work properly you need: "
echo " tmux"
echo " fd"
echo " ripgrep"
echo " bat "
echo "  "
echo " ************************************************* "
echo "  "
echo " Type Y to start zsh and install the plugins "
echo " Ater the instalation this will take some time, so just wait "
echo " if you don't want this type N or nothing and press return "
echo "  "


read -r ord
if [ "$ord" = "Y" ]; then 
  zsh
else 
  echo " Restart zsh manually to start the plugin instalation "
  echo "  "
fi
