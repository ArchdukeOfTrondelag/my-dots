fpath+=($HOME/.zsh/pure)
source ~/.zplug/init.zsh
autoload -U promptinit; promptinit
prompt pure
# auto starts tmux when launching a terminal/konsole etc
if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
	tmux a -t default || exec tmux new -s default && exit;
fi

alias fetch='~/.rottedfetch'
alias rgf='source ~/.rgfzf.sh && main '
alias c='source ~/.rgfzf.sh && main cd'
alias s='source ~/.rgfzf.sh && main find'
alias f='source ~/.rgfzf.sh && main open'
alias rfc='source ~/.rgfzf.sh && main cmd '

alias font='sudo setfont lat0-16'
alias font1='sudo setfont -d'
alias font2='sudo setfont -d iso07u-16'
alias nvimf='nvim -c "FzfLua files"'
alias vimf='vim -c Files'

# aliases
# nixos build
alias -- nosb='sudo nixos-rebuild switch'
# noxos open config file in vim
alias -- nosv='sudo nvim /etc/nixos/configuration.nix'
# remove the cache
alias -- ncac='rm -rf ~/.cache/* && rm -rf .cache/nvim/'
# remove old versions and rebuilds the system
alias -- nosd='nix-store --gc && sudo nix-collect-garbage -d' 


zstyle ':fzf-tab:*' fzf-command ftb-tmux-popup
zplug 'zplug/zplug', hook-build:'zplug --self-manage'
zplug 'Aloxaf/fzf-tab'
zplug 'zsh-users/zsh-syntax-highlighting'
zplug 'zsh-users/zsh-completions'
zplug 'zsh-users/zsh-autosuggestions'
zplug 'MikeDacre/tmux-zsh-vim-titles'

if ! zplug check --verbose; then
    printf "Install? [Y/n]: "
    if read -q; then
        echo; zplug install
    fi
fi
zplug load --verbose
echo; clear


export EDITOR='nvim'
export VISUAL=$EDITOR
export $tzvt_set_tmux_window_status=true
