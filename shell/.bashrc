#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'

# Export nvim as the default editor
export EDITOR=nvim
export VISUAL=$EDITOR

# Environment variable for the ssh-agent socket
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

export XCURSOR_PATH=${XCURSOR_PATH}:/usr/share/icons

# Default Prompt
PS1='[\u@\h \W]\$ '

# Colored Prompt
# PS1='\[\e[1;38;5;204m\]┌──(\[\e[1;38;5;099m\]\u\[\e[38;5;204m\]@\[\e[38;5;135m\]\h\[\e[38;5;204m\])\[\e[1;38;5;114m\]-\[\e[1;38;5;201m\][\[\e[1;38;5;045m\]\w\[\e[38;5;201m\]]\n\[\e[1;38;5;204m\]╰──\[\e[38;5;114m\]\$\[\e[0m\] '
