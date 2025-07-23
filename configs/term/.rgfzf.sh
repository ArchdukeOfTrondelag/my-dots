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
	echo "Valid options are: "
	echo "find (to find a file based on a word)"
	echo "cd (to open chocen directory)"
	echo "open (to open selected file)"
	return 1
}

ed_1() {
	echo "Jeg lover og sverger å ville tjene riket, kongen og vår fader, den allmektige, i alle tider, gode og vonde, så sant hjelpe meg Gud den allmektige og allvitende."
}

main () {
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
		open)
			open_1
			;;
	esac

	case "$1" in
		help)
			help_1
			;;
	esac

	case "$1" in
		ed1)
			ed_1
			;;
	esac
}

main "$@"
