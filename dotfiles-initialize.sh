#!/bin/bash

function add_submodules() {
    echo "Add submodules" \
	&& sleep 2 \
	&& cd ~/.config/emacs/bin \
	&& git submodule add -f https://github.com/jorgenschaefer/circe.git   \
	&& echo "Circe installed | github.com/jorgenschaefer/circe"           \
	&& git submodule add -f https://github.com/re5et/emux.git             \
	&& echo "Emux installed | github.com/re5et/emux"                      \
	&& git submodule add -f https://github.com/magit/magit.git            \
	&& echo "Magit installed | github.com/magit/magit"                    \
	&& git submodule add -f https://github.com/emacsmirror/multi-term.git \
	&& echo "Multi-Term installed | github.com/emacsmirror/multi-term"    \
	&& git submodule add -f https://github.com/scymtym/rudel.git          \
 	&& echo "Rudel installed | github.com/scymtym/rudel"                  \
	&& git submodule add -f https://github.com/jcsalomon/smarttabs.git    \
	&& echo "SmartTabs installed | github.com/jcsalomon/smarttabs"
}
