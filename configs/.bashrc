# auto starts tmux when launching a terminal/konsole etc
if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
  tmux a -t default || exec tmux new -s default && exit;
fi

# sets the fzf theme and colours
export FZF_DEFAULT_OPTS="--preview 'bat --color=always {}'"

# aliases
# nixos build
alias -- nosb='sudo nixos-rebuild switch'
# nixos clean
alias -- nosc='nix-store --gc'
# noxos open config file in vim
alias -- nosv='sudo vim /etc/nixos/configuration.nix'
# launch uwufetch with the gnu acsii art
alias -- uwu='uwufetch -d gnu'
# start fzf with color syntax
alias -- fzf="fzf --preview 'bat --color=always {}'"
# remove the cache
alias -- ncac='rm -rf ~/.cache/*'
# remove old versions and rebuilds the system
alias -- nosd='sudo nix-collect-garbage -d && sudo nixos-rebuild switch'

