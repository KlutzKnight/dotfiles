#!/bin/sh

HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000

# Aliases
alias ls="ls --color=auto"
alias grep="grep --color=auto"

# Exports
export EDITOR="nvim"
export VISUAL=$EDITOR

bindkey -v

# The following lines were added by compinstall
zstyle :compinstall filename '/home/rafi/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Prompt
PS1='%F{204}┌──(%B%F{99}%n%F{204}@%B%F{135}%m%F{204})%B%F{114}-%B%F{201}[%B%F{45}%~%F{201}]%b
%F{204}╰──%F{114}$%f '

# Add Zsh Syntax Hightlighting (Downloaded from Arch Repo)
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
