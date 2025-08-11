#!/usr/bin/env bash

fnd_1 () {
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

main () {

  case "$1" in
    fc)
      cp_3
      ;;
  esac

  case "$1" in
    fm)
      cp_2
      ;;
  esac

  case "$1" in
    mm)
      cp_1
      ;;
  esac

  case "$1" in
    find)
      fnd_1
      ;;
  esac

  case "$1" in
    cd)
      cd_1
      ;;
  esac

  case "$1" in
    co)
      co_1
      ;;
  esac

  case "$1" in
    open)
      open_1
      ;;
  esac

  case "$1" in
    md)
      cd_2
      ;;
  esac

  case "$1" in
    mf)
      mf_1
      ;;
  esac

  case "$1" in
    --help)
      help_1
      ;;
  esac

  case "$1" in
    df)
      co_2
      ;;
  esac
}

main "$@"
