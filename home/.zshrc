# General
###########################################################
# History
HISTFILE=~/.histfile
HISTSIZE=4096
SAVEHIST=4096
setopt HIST_IGNORE_DUPS

# Allow running failed matches
setopt nonomatch

# Vi/Vim
bindkey -v

zstyle :compinstall filename '/home/$USER/.zshrc'
zstyle ':completion:*' menu select
setopt completealiases
autoload -Uz compinit
compinit

# Set Path
typeset -U path
#$(ruby -rubygems -e "puts Gem.user_dir")/bin
PATH="/usr/bin:$PATH:$(ruby -rubygems -e "puts Gem.user_dir")/bin"

# UI
###########################################################
# Prompt Config
autoload -U promptinit
promptinit
prompt redhat


# Defaults
###########################################################
export GIT_EDITOR="emacs -nw"

if [ -n "$DISPLAY" ]; then
  export BROWSER="xdg-open"
  export EDITOR="emacs"
else
  export BROWSER="links"
  export EDITOR="emacs -nw"
fi
