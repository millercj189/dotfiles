#
# ~/.bashrc
#

# Misc
set show-all-if-ambiguous on

# Appearance
PS1='[\u@\h \W]\$ '

# Application Path(s)
export GOPATH=~/.gocode
export PATH="$PATH:/bin:$(ruby -e 'print Gem.user_dir')/bin:$GOPATH/bin:~/.local/share/bin"

# Default Applications
export GIT_EDITOR="emacs -nw"
export EDITOR="emacs -nw"
export BROWSER="xdg-open"
