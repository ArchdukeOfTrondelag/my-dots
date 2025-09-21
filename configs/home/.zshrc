fpath+=($HOME/.zsh/pure)
source ~/.zplug/init.zsh
autoload -U promptinit; promptinit
prompt pure

alias fetch='~/setup/rottedfetch'
alias rgf='source ~/setup/.rgfzf.sh && main '
alias c='source ~/setup/.rgfzf.sh && main cd'
alias s='source ~/setup/.rgfzf.sh && main find'
alias f='source ~/setup/.rgfzf.sh && main open'
alias rfc='source ~/setup/.rgfzf.sh && main cmd '

alias nvimf='nvim -c "FzfLua files"'
alias tl='tmux list-sessions'
alias ta='tmux attach'
alias tn='tmux new -s'
alias tk='tmux kill-session -t'

alias -- nosb='sudo nixos-rebuild switch'
alias -- nosv='sudo nvim /etc/nixos/configuration.nix'
alias -- ncac='rm -rf ~/.cache/* && rm -rf .cache/nvim/'
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
alias nvim="LANG=en_US.UTF-8 nvim"
source <(fzf --zsh)
rgf
