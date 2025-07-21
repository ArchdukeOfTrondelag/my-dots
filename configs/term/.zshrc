#plugins=(git zsh-autosuggestions fzf-tab zsh-syntax-highlighting)
fpath+=($HOME/.zsh/pure)
source ~/.zplug/init.zsh
autoload -U promptinit; promptinit
prompt pure
if [[ -n $SSH_CONNECTION ]]; then
	export EDITOR='nvim'
fi


# auto starts tmux when launching a terminal/konsole etc
if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
	tmux a -t default || exec tmux new -s default && exit;
fi
alias -- T='nvim ~/TODO'
alias -- clock='bash ~/.config/clock/clock.sh'
alias -- fz='cd ~/nix/Filmer/ && fzf-tmux -p | xargs cage mpv'
alias -- s='bash ~/.rgfzf.sh'

# aliases
# nixos build
alias -- nosb='sudo nixos-rebuild switch'
# noxos open config file in vim
alias -- nosv='sudo nvim /etc/nixos/configuration.nix'
# remove the cache
alias -- ncac='rm -rf ~/.cache/* && rm -rf .cache/nvim/'
# remove old versions and rebuilds the system
alias -- nosd='nix-store --gc && sudo nix-collect-garbage -d' 

#makes vim open nvim
alias -- vim='nvim'
#makes the calendar open with kcal
alias -- kcal='khal calendar'
#makes fz search files in a pupop no priview and opens it in nvim when selected
alias -- f='fd --type f --hidden --exclude Vieb --exclude .oh-my-zsh --exclude .gnupg --exclude .git --exclude .local --exclude .vim --exclude .cache | fzf-tmux -p -w 35% -h 25% -p --reverse --no-preview | xargs nvim'
#does same as above, but in fullscreen and with priview
alias -- fq='fd --type f --hidden --exclude .git --exclude Vieb --exclude .oh-my-zsh --exclude .local --exclude .vim --exclude .cache | fzf --preview "bat --color=always {}" --reverse | xargs nvim'
#searches and priviews
alias -- fw="fzf --preview 'bat --color=always {}'"
#searches and doesnt priview
alias -- fe="fzf-tmux --no-preview -p --reverse"

q() {
	local dir
	dir=$(find ${1:-.} -type d 2> /dev/null | fzf-tmux -p) && cd "$dir" 
}
zstyle ':fzf-tab:*' fzf-command ftb-tmux-popup


zplug 'zplug/zplug', hook-build:'zplug --self-manage'
zplug 'Aloxaf/fzf-tab'
zplug 'zsh-users/zsh-syntax-highlighting'
zplug 'zsh-users/zsh-completions'

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load --verbose

echo; clear
