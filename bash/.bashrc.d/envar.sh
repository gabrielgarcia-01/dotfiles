#!/bin/sh

# Change the default editor
export EDITOR=/usr/bin/nvim
export SUDO_EDITOR=/usr/bin/nvim
export VISUAL=/usr/bin/nvim

[ -f "/home/gabriel/.ghcup/env" ] && source "/home/gabriel/.ghcup/env" # ghcup-env

# silence the java warning
SILENT_JAVA_OPTIONS="$JDK_JAVA_OPTIONS"
unset JDK_JAVA_OPTIONS
alias java='java "$SILENT_JAVA_OPTIONS"'
export OPENAI_API_KEY=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
