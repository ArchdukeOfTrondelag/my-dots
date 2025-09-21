#!/usr/bin/env bash


name="Alice"
user1=( $(whoami) )
distro1=( $(awk -F'[="]+' '/^NAME=/ { print $2 }' /etc/os-release) )
kerver=$(uname -r)
logo="\\____)\\___
/\\__  ___^<
    )/"
gpu1="no" #set the variable to "yes" to enable gpu in the fetch with lspci

if [[ "${distro1[*]}" == *@(NixOS|NixOwOS)* ]]; then
  gens=( $(nixos-rebuild list-generations) )
  content="${gens[8]}"
  packages=( $(nix-store --query --requisites /run/current-system | wc -l ) )
fi

content1="Welcome to the $name machine with ${distro1[*]}"
if [ "${content: -1}" == "5" ]; then
  content1="Welcome to the $name machine with ${distro1[*]} :3"
fi

cpu1=( $( grep 'model name' /proc/cpuinfo | uniq ) )
unset "cpu1[0]" "cpu1[1]" "cpu1[2]"
cpu1=("${cpu1[@]}")

if [[ "$gp1" == "yes" ]]; then
  gpu=( $( lspci | grep VGA | awk -F'VGA compatible controller: ' '{print $20}' ) )
fi

mem=( $(free -g | awk "/^Mem:/ ") )
swap=( $(free -g | awk "/^Swap:/ ") )

ctime=$(date +"%H:%M")
dtime=$(date +"%d-%m-%Y")

stor=( $( df -h --type=ext4 | grep "/dev/" )  )
unset "stor[0]" "stor[3]" "stor[4]" "stor[5]"
stor=("${stor[@]}")

echo "${logo[*]}"
echo "******************************************"
echo "$content1"
echo "******************************************"
echo "User:" "${user1[@]}"
echo "Time:" "$ctime"
echo "Date:" "$dtime"
echo "__________________________________________"
echo "Distro:" "${distro1[@]}"
echo "Kernel:" "$kerver"
if [[ "${distro1[*]}" == *@(NixOS|NixOwOS)* ]]; then
  echo "Nix generation: ${content}"
  echo "Number of packages:" "${packages[@]}"
fi
echo "__________________________________________"
echo "CPU:" "${cpu1[@]}"
echo "Mem:" "${mem[1]}" "GiB" / "${mem[2]}" "GiB"
if [[ "${swap[1]}" != "0" ]]; then
  echo "Swap:" "${swap[1]}" "GiB" / "${swap[2]}" "GiB"
fi
if [[ "$gpu1" = "yes" ]]; then
  printf '%s\n' "${gpu[@]}"
fi
if [[ "${distro1[*]}" == *@(NixOS|NixOwOS)* ]]; then
  if [ "${content: -1}" == "9" ]; then
    if [[ "$gpu1" = "no" ]]; then
      echo "Sorry, i stole your GPU :3"
    fi
  fi
fi
echo "Disk:" "${stor[1]}"iB / "${stor[0]}"iB

