#
# ~/.bash_profile
#

# source .bashrc
[[ -f ~/.bashrc ]] && . ~/.bashrc

# User specific environment and startup programs
# Languages
. "$HOME/.cargo/env"

# Clean Up PATH
PATH="$(perl -e 'print join(":", grep { not $seen{$_}++ } split(/:/, $ENV{PATH}))')"
