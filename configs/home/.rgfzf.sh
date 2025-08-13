#!/usr/bin/env bash

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

ls_2() {
  dir=$(fd --type d --hidden | fzf-tmux -p)
  l "$dir"
}

cmd_1() {
  echo " find -finds file based on prmpt word "
  echo " cd -fuzzy find and change directory "
  echo " open -finds and opens a file in nvim "
  echo " co -fuzzy find directory and make file in that directory with nvim "
  echo " md -make directory in input directory and cd into it "
  echo " df -cd into directory and make file, but doesnt open "
  echo " ls -fuzzy find directory and ls, lists the content "
  echo " l -fuzzy find directory and l, lists the content with hidden files "
  echo " mf -makes file in given directory and you remain in your directory "
  echo " mm -moves picked directory 1 to picked directory 2 "
  echo " fm -moves file into picked directory "
  echo " fc -copes file into picked directory "
  echo " fd -copes directory into picked directory "
}


main () {

case "$1" in
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
  l)
    ls_2
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
  *)
    echo "Unknown command: $1"
    ;;
esac

}



if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main "$@"
fi
