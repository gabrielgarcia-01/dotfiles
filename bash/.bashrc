#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# ----------------------------------------------------------------------------------
# Source global definitions
# ----------------------------------------------------------------------------------
if [ -f /etc/bash.bashrc ]; then
	. /etc/bash.bashrc
fi
# ----------------------------------------------------------------------------------
# Environment variables
# ----------------------------------------------------------------------------------
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
	PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

PS1='[\u@\h \W]\$ '
. "$HOME/.cargo/env"

# Clean up PATH
PATH="$(perl -e 'print join(":", grep { not $seen{$_}++ } split(/:/, $ENV{PATH}))')"

# ----------------------------------------------------------------------------------
# Source aliases and functions from .bashrc.d
# ----------------------------------------------------------------------------------

if [ -d ~/.bashrc.d ]; then
	for rc in ~/.bashrc.d/*; do
		if [ -f "$rc" ]; then
			. "$rc"
		fi
	done
fi
unset rc
