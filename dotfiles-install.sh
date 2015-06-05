#!/bin/bash
#
# Dotfiles Installation, management, etc


function symlinks_create() {
    echo "Creating symbolic links" \
	&& sleep 2 \
	&& ln -sf ~/.dotfiles/home/.* ~/ \
	&& ln -sf ~/.dotfiles/config/ ~/.config/
}

function submodule_init() {
    echo "" \
	&& sleep 2  \
	&& git submodule init \
	&& git submodule update --remote --rebase
}


function submodule_update() {
    echo "" \
	&& sleep 2
}


symlinks_create
submodule_init
