ord=$(fzf-tmux -p 35,4 --reverse --prompt="Searchword: " --print-query | awk 'NR==1' )
rg -l "$ord" | fzf-tmux -p 80%,80% --delimiter : --preview "bat --color=always  --highlight-line=1 {1} "| xargs nvim
