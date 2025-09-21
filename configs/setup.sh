#!/usr/bin/env bash
echo " This will remove all files affected by this script you alreddy have "
echo " Procede Y/n <type n to end> "
read -r svar1

if [ "$svar1" == "n" ]; then
  end
else

cd ~

rm -fr .config/nvim/init.lua
rm .tmux.conf
rm .zshrc
rm -fr .zsh
rm -fr .zplug

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
mkdir -p ".zsh"
git clone https://github.com/sindresorhus/pure.git ".zsh/pure"

git clone https://github.com/ArchdukeOfTrondelag/my-dots.git my-dots

clear

echo " Do you need a .config directory? "
echo " y/N "
read -r config
if [ "$config" == "y" ]; then
  mkdir ~/.config
fi



echo " All directories and files related to whats affected here will be removed "
echo " "
echo " Which profile do you wish for? "
echo " type w for wayland "
echo " or x for xorg/x11 "
echo " or type wx for wayland and xorg "
echo " it's important that you write in lower case "
echo " otherwise none of them will be installed "
echo " this can also be if you don't want any config installed, type nothing or something else "

read -r valg


if [ "$valg" == "w" ]; then 
  rm -fr .config/niri
  rm -fr .config/waybar
  rm -fr .config/swaylock
  mkdir ~/.config/niri
  mkdir ~/.config/waybar
  mkdir ~/.config/swaylock

  cp -fr my-dots/configs/niri/* ~/.config/niri/
  cp -fr my-dots/configs/waybar/* ~/.config/waybar/
  cp -fr my-dots/configs/swaylock/* ~/.config/swaylock/
fi

if [ "$valg" == "x" ]; then 
  rm -fr .config/i3
  rm -fr .config/polybar
  rm -fr .config/rofi
  mkdir ~/.config/i3
  mkdir ~/.config/polybar
  mkdir ~/.config/rofi

  cp -fr my-dots/configs/i3/* ~/.config/i3/
  cp -fr my-dots/configs/polybar/* ~/.config/polybar/
  cp -fr my-dots/configs/rofi/* ~/.config/rofi/
fi

if [ "$valg" == "wx" ]; then 
  rm -fr .config/niri
  rm -fr .config/waybar
  rm -fr .config/swaylock
  rm -fr .config/i3
  rm -fr .config/polybar
  rm -fr .config/rofi
  mkdir ~/.config/niri
  mkdir ~/.config/waybar
  mkdir ~/.config/swaylock

  mkdir ~/.config/i3
  mkdir ~/.config/polybar
  mkdir ~/.config/rofi

  cp -r my-dots/configs/niri/* ~/.config/niri/
  cp -r my-dots/configs/waybar/* ~/.config/waybar/
  cp -r my-dots/configs/swaylock/* ~/.config/swaylock/

  cp -r my-dots/configs/i3/* ~/.config/i3/
  cp -r my-dots/configs/polybar/* ~/.config/polybar/
  cp -r my-dots/configs/rofi/* ~/.config/rofi/
fi

echo " Do you want vimrc? "
echo " The config file for standard vim "
echo "y/N"
read -r vim
if [ "$vim" == "y" ]; then
  cp -r my-dots/configs/oldvim/.vimrc ~/
fi

mkdir ~/.config/nvim
mkdir ~/setup

cp -r my-dots/configs/home/.rottedfetch ~/setup/rottedfetch
chmod +x setup/rottedfetch 
cp -r my-dots/configs/home/clock.sh ~/setup/clock.sh

cp -r my-dots/configs/nvim/init.lua ~/.config/nvim/

cp -r my-dots/configs/home/.tmux.conf ./
cp -r my-dots/configs/home/.rgfzf.sh ./setup/
cp -r my-dots/configs/home/.zshrc ./

rm -fr my-dots

clear

echo " "
echo " Now you have a set of programs ready for use "
echo " Those are: "

if [ "$valg" == "w" ]; then 
  echo " Niri "
  echo " Waybar "
  echo " swaylock "
fi

if [ "$valg" == "x" ]; then 
  echo " i3 "
  echo " Rofi "
  echo " Polybar "
fi

if [ "$valg" == "wx" ]; then 
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
echo "   "
echo " ************************************************* "
echo "  "
echo " For the script to work properly you need: "
echo " tmux (not needed, but reqemended)"
echo " fd"
echo " ripgrep"
echo " fzf"
echo " bat (for the bat option)"
echo " nvim (the 0.12.0 build or later) "
echo " fbcat (for screenshots)"
echo "  "
echo " If you use zsh there is aliases for the managemnt script"
echo " To get started run rgf setup to get everything working"
echo " rgf pick or rfc can be called to see the diffrent options (in pick you can select the option)"
echo ""
echo " ************************************************* "
echo "  "
echo " Type y to start zsh and install the plugins "
echo " Ater the instalation this will take some time, so just wait "
echo "  "


read -r ord
if [ "$ord" == "y" ]; then 
  zsh
else 
  echo " Restart zsh manually to start the plugin instalation "
  echo "  "
fi
fi
