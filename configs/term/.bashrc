# auto starts tmux when launching a terminal/konsole etc
if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
  tmux a -t default || exec tmux new -s default && exit;
fi


# aliases
# nixos build
alias -- nosb='sudo nixos-rebuild switch'
# nixos clean
alias -- nosc='nix-store --gc'
# noxos open config file in vim
alias -- nosv='sudo nvim /etc/nixos/configuration.nix'
# remove the cache
alias -- ncac='rm -rf ~/.cache/*'
# remove old versions and rebuilds the system
alias -- nosd='sudo nix-collect-garbage -d && sudo nixos-rebuild switch'

#makes vim open nvim
alias -- vim='nvim'
#makes the calendar open with kcal
alias -- kcal='khal calendar'
#makes w3ms open duckduckgo in w3m
alias -- w3ms='w3m duckduckgo.com/' 
#makes fz search files in a pupop no priview and opens it in nvim when selected
alias -- f='fd --type f --hidden --exclude .gnupg --exclude .git --exclude .local --exclude .vim | fzf-tmux -p --reverse --no-preview | xargs nvim'
#does same as above, but in fullscreen and with priview
alias -- fq='fd --type f --hidden --exclude .git --exclude .local --exclude .vim | fzf --preview "bat --color=always {}" --reverse | xargs nvim'
#searches and priviews
alias -- fw="fzf --preview 'bat --color=always {}'"
#searches and doesnt priview
alias -- fe="fzf-tmux --no-preview -p --reverse"
