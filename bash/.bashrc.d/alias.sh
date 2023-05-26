#!/bin/sh
# ----------------------------------------------------------------------------------
# ls
# ----------------------------------------------------------------------------------
alias ls='exa --icons --long'
alias ll='exa --all --icons --long'
alias lsl='exa --all --long --tree --git-ignore --icons'
alias l='exa --icons --long'

# ----------------------------------------------------------------------------------
# cd
# ----------------------------------------------------------------------------------
alias cd='z'

# ----------------------------------------------------------------------------------
# file management
# ----------------------------------------------------------------------------------
# make interactive & verbose default
alias cp='cp -iv'
alias mv='mv -iv'

# alias rn='rename'

# fzf with preview window + bat syntax highlighting
alias fzf='fzf --preview "bat --color=always {}" --preview-window '~3''

# wezterm imgcat
alias imgcat='wezterm imgcat'

alias ..='cd ..'

# ----------------------------------------------------------------------------------
# misc
# ----------------------------------------------------------------------------------

# alias for pretty path
alias path='echo -e ${PATH//:/\\n}'

# disk usage
alias du='du -kh'
alias df='df -kTh'

# wayland fixes
alias obsidian='obsidian --enable-features=UseOzonePlatform --ozone-platform=wayland'
alias discord-canary='discord-canary --enable-features=UseOzonePlatform --ozone-platform=wayland'

# weather curl
alias weather='curl wttr.in/Miami'
