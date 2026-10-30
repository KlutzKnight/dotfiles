
# ------------------------ Zsh Options ------------------------

setopt GLOB_DOTS
setopt EXTENDED_HISTORY

HISTFILE=~/.zsh_history
HISTSIZE=500
SAVEHIST=10000

# ------------------------ Environment ------------------------

export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"

# ------------------------ Completion ------------------------

zmodload zsh/complist
autoload -Uz compinit

# Rebuild completion cache only when needed
if [[ -n ${ZDOTDIR:-$HOME}/.zcompdump(#qN.mh+24) ]]; then
    compinit
else
    compinit -C
fi

zstyle ':completion:*' menu select

# Navigate completion menu
bindkey -M menuselect '^n' down-line-or-history
bindkey -M menuselect '^p' up-line-or-history
bindkey -M menuselect '^y' accept-line

# ------------------------ Vim Mode ------------------------

bindkey -v

bindkey -M viins '^W' backward-kill-word
bindkey -M viins '^?' backward-delete-char
bindkey -M viins '^H' backward-delete-char

KEYTIMEOUT=1

# Cursor shape
function zle-keymap-select {
    case $KEYMAP in
        vicmd)      print -Pn '\e[2 q' ;;
        viins|main) print -Pn '\e[6 q' ;;
    esac
}

function zle-line-init {
    print -Pn '\e[6 q'
}

function zle-line-finish {
    print -Pn '\e[2 q'
}

zle -N zle-keymap-select
zle -N zle-line-init
zle -N zle-line-finish

# ------------------------ Plugins ------------------------

# Autosuggestions
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# Accept full suggestion with Ctrl + /
bindkey '^_' autosuggest-accept

# Syntax highlighting (keep last)
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# ------------------------ Aliases ------------------------

alias ls="ls --color=auto"
alias lsa="ls -a"
alias grep="grep --color=auto"

# ------------------------ Starship ------------------------

eval "$(starship init zsh)"
