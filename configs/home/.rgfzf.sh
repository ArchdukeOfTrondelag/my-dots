#!/usr/bin/env bash

nix_1() {
  valgene=( "build nix configuration" "edit the configuration.nix file" "delete and clean old nix profiles/rollbacks" )
  valgenix=$(printf "%s\n" "${valgene[@]}" | fzf-tmux -p -w 65% -h 30% --reverse --no-preview )
  nosb_1() {
    sudo nixos-rebuild switch
  }
nosv_1() {
  sudo nvim /etc/nixos/configuration.nix
}
nosd_1() {
  nix-store --gc && sudo nix-collect-garbage -d
}
if [[ "$valgenix" == "${valgene[1]}" ]]; then
  nosb_1
fi
if [[ "$valgenix" == "${valgene[2]}" ]]; then
  nosv_1
fi
if [[ "$valgenix" == "${valgene[3]}" ]]; then
  nosd_1
fi
}
screen_1() {
  ord=$(fzf-tmux -p 35,4 --reverse --prompt="PictureName: " --print-query | awk 'NR==1' )
  sudo fbgrab ~/nix/Bilder/"$ord".png > /dev/null 2>&1
}

command_1() { 
  command=$(fzf-tmux -p 35,4 --reverse --prompt="Command: " --print-query | awk 'NR==1' )
  fd --type f --hidden | fzf-tmux -p -w 35% -h 25% -p --reverse --no-preview | xargs "$command"
}


fnd_1() {
  ord=$(fzf-tmux -p 35,4 --reverse --prompt="Searchword: " --print-query | awk 'NR==1' )
  rg -l --hidden "$ord" | fzf-tmux -p 80%,80% --delimiter : --preview "bat --color=always  --highlight-line=1 {1} "| xargs nvim
}

cd_1() { 
  dir=$(fd --type d --hidden | fzf-tmux -p)
  cd "$dir"
}

open_1() { 
  fd --type f --hidden | fzf-tmux -p -w 35% -h 25% -p --reverse --no-preview | xargs nvim
}

help_1() {
  bat ~/.rgfzf.sh
}

co_1() {
  dir=$(fd --type d --hidden | fzf-tmux -p)
  cd "$dir"
  ord=$(fzf-tmux -p 35,4 --reverse --prompt="Filnavn: " --print-query | awk 'NR==1' )
  nvim "$ord"
}

cd_2() {
  dir=$(fd --type d --hidden | fzf-tmux -p)
  cd "$dir"
  ord=$(fzf-tmux -p 35,4 --reverse --prompt="Mappenavn: " --print-query | awk 'NR==1' )
  mkdir "$ord"
  cd "$ord"
}

mf_1() {
  dir=$(fd --type d --hidden | fzf-tmux -p)
  cd "$dir"
  ord=$(fzf-tmux -p 35,4 --reverse --prompt="Filnavn: " --print-query | awk 'NR==1' )
  touch "$ord" 
  cd --
}

co_2() {
  dir=$(fd --type d --hidden | fzf-tmux -p)
  cd "$dir"
  ord=$(fzf-tmux -p 35,4 --reverse --prompt="Filnavn: " --print-query | awk 'NR==1' )
  touch "$ord" 
}


fd_1() {
  dir=$(fd --type d --hidden | fzf-tmux -p)
  dir2=$(fd --type d --hidden | fzf-tmux -p)
  cp -r "$dir" "$dir2"
}

cp_1() {
  dir=$(fd --type d --hidden | fzf-tmux -p)
  dir2=$(fd --type d --hidden | fzf-tmux -p)
  mv "$dir" "$dir2"
}

cp_2() {
  fil=$( fd --type f --hidden | fzf-tmux -p -w 35% -h 25% -p --reverse --no-preview )
  dir=$(fd --type d --hidden | fzf-tmux -p)
  mv "$fil" "$dir"

}

cp_3() {
  fil=$( fd --type f --hidden | fzf-tmux -p -w 35% -h 25% -p --reverse --no-preview )
  dir=$(fd --type d --hidden | fzf-tmux -p)
  cp "$fil" "$dir"

}

ed_1() {
  echo "Jeg lover og sverger å ville tjene riket, kongen og vår fader, den allmektige, i alle tider, gode og vonde, så sant hjelpe meg Gud den allmektige og allvitende."
}

ls_1() {
  dir=$(fd --type d --hidden | fzf-tmux -p)
  ls "$dir"
}

bat_1() {
  fil=$( fd --type f --hidden | fzf-tmux -p -w 35% -h 25% -p --reverse --no-preview )
  bat "$fil"
}


cmd_1() {
  echo " "
  echo " find    - finds file based on prmpt word "
  echo " cd      - fuzzy find and change directory "
  echo " open    - finds and opens a file in nvim "
  echo " co      - fuzzy find directory and make file in that directory with nvim "
  echo " md      - make directory in input directory and cd into it "
  echo " df      - cd into directory and make file, but doesnt open "
  echo " ls      - fuzzy find directory and ls, lists the content "
  echo " mf      - makes file in given directory and you remain in your directory "
  echo " mm      - moves picked directory 1 to picked directory 2 "
  echo " fm      - moves file into picked directory "
  echo " fc      - copes file into picked directory "
  echo " fd      - copes directory into picked directory "
  echo " bat     - opens file in bat "
  echo " screen  - takes screenshot and names it with the user input"
  echo " command - selects file and executes given command with it"
}

picker_1() {
  valg=( "find    - finds file based on prmpt word" "cd      - fuzzy find and change directory" "open    - finds and opens a file in nvim" "co      - fuzzy find directory and make file in that directory with nvim" "md      - make directory in input directory and cd into it" "df      - cd into directory and make file, but doesnt open" "ls      - fuzzy find directory and ls, lists the content" "mf      - makes file in given directory and you remain in your directory" "mm      - moves picked directory 1 to picked directory 2" "fm      - moves file into picked directory" "fc      - copes file into picked directory" "fd      - copes directory into picked directory" "bat     - opens file in bat" "screen  - takes screenshot and names it with the user inpu" "command - selects file and executes given command with it" "nix - opens nix management options")
  valge=$(printf "%s\n" "${valg[@]}" | fzf-tmux -p -w 65% -h 50% --reverse --no-preview )
  if [[ "$valge" == "${valg[1]}" ]]; then
    fnd_1
  fi
  if [[ "$valge" == "${valg[2]}" ]]; then
    cd_1
  fi
  if [[ "$valge" == "${valg[3]}" ]]; then
    open_1
  fi
  if [[ "$valge" == "${valg[4]}" ]]; then
    co_1
  fi
  if [[ "$valge" == "${valg[5]}" ]]; then
    cd_2
  fi
  if [[ "$valge" == "${valg[6]}" ]]; then
    co_2
  fi
  if [[ "$valge" == "${valg[7]}" ]]; then
    ls_1
  fi
  if [[ "$valge" == "${valg[8]}" ]]; then
    mf_1
  fi
  if [[ "$valge" == "${valg[9]}" ]]; then
    cp_1
  fi
  if [[ "$valge" == "${valg[10]}" ]]; then
    cp_2
  fi
  if [[ "$valge" == "${valg[11]}" ]]; then
    cp_3
  fi
  if [[ "$valge" == "${valg[12]}" ]]; then
    fd_1
  fi
  if [[ "$valge" == "${valg[13]}" ]]; then
    bat_1
  fi
  if [[ "$valge" == "${valg[14]}" ]]; then
    screen_1
  fi
  if [[ "$valge" == "${valg[15]}" ]]; then
    command_1
  fi

  if [[ "$valge" == "${valg[16]}" ]]; then
    nix_1
  fi

  if [[ -z "$valge" ]]; then
    cmd_1
  fi
}



main () {

  case "$1" in
    pick)
      picker_1
      ;;
    command)
      command_1
      ;;
    screen)
      screen_1
      ;;
    bat)
      bat_1
      ;;
    fc)
      cp_3
      ;;
    fm)
      cp_2
      ;;
    mm)
      cp_1
      ;;
    find)
      fnd_1
      ;;
    cd)
      cd_1
      ;;
    co)
      co_1
      ;;
    open)
      open_1
      ;;
    md)
      cd_2
      ;;
    mf)
      mf_1
      ;;
    ls)
      ls_1
      ;;
    --help)
      help_1
      ;;
    fd)
      fd_1
      ;;
    df)
      co_2
      ;;
    cmd)
      cmd_1
      ;;
    nix)
      nix_1
      ;;
  esac

}
