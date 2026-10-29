# Zsh Options
setopt GLOB_DOTS

# History
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000

# Environment
export EDITOR="nvim"
export VISUAL=$EDITOR
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"

# Initialize
eval "$(starship init zsh)"

# Aliases
alias ls="ls --color=auto"
alias lsa="ls -a"
alias grep="grep --color=auto"

# ------------------------ Completion Menu ------------------------
zstyle :compinstall filename '/home/rafi/.zshrc'

zmodload zsh/complist
autoload -Uz compinit
compinit

zstyle ':completion:*' menu select

# Navigate completion menu with ctrl+n and ctrl+p
bindkey -M menuselect '^n' down-line-or-history
bindkey -M menuselect '^p' up-line-or-history
bindkey -M menuselect '^y' accept-line

# ----------------------- End Completion Menu ------------------------

# ------------------------ VIM Mode ------------------------
bindkey -v  # Enable vim mode

# Fix Ctrl+W in vi insert mode
bindkey -M viins '^W' backward-kill-word

# Fix Backspace in vi insert mode
bindkey -M viins '^?' backward-delete-char
bindkey -M viins '^H' backward-delete-char

KEYTIMEOUT=1

# Cursor shape: block in Normal mode, beam in Insert mode
function zle-keymap-select {
  case $KEYMAP in
    vicmd)      echo -ne '\e[2 q' ;;  # Block cursor
    viins|main) echo -ne '\e[6 q' ;;  # Beam cursor
  esac
}

# Set beam cursor when a prompt appears
function zle-line-init {
  print -Pn '\e[6 q'
}

zle -N zle-keymap-select
zle -N zle-line-init

# Restore cursor shape when command finishes
function zle-line-finish {
  echo -ne '\e[2 q'
}
zle -N zle-line-finish

# ------------------------ End VIM Mode ------------------------

# Custom Prompt
# PS1='%F{204}┌──(%B%F{99}%n%F{204}@%B%F{135}%m%F{204})%B%F{114}-%B%F{201}[%B%F{45}%~%F{201}]%b
# %F{204}╰──%F{114}$%f '

# Add Zsh Syntax Hightlighting (Downloaded from Arch Repo)
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
