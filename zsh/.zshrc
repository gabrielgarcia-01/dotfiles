# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/gabriel/.zshrc'

autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
# End of lines added by compinstall

# Use vim keys in tab complete menu
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'j' vi-up-line-or-history
bindkey -M menuselect 'k' vi-forward-char
bindkey -M menuselect 'l' vi-downline-or-history
bindkey -v '^?' backward-delete-char

# ----------------------------------------------------------------------------------
# Aliases
# ----------------------------------------------------------------------------------

# ----------------------------------------------------------------------------------
# Silent Java Options
# ----------------------------------------------------------------------------------
SILENT_JAVA_OPTIONS="$JDK_JAVA_OPTIONS"
unset JDK_JAVA_OPTIONS
alias java='java "$SILENT_JAVA_OPTIONS"'
alias java-algs4='java-algs4 "$SILENT_JAVA_OPTIONS"'

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

# ----------------------------------------------------------------------------------
# Functions
# ----------------------------------------------------------------------------------

# ----------------------------------------------------------------------------------
# Searches
# ----------------------------------------------------------------------------------

rgh() {
    # [h]istory [g]rep searches history for unique commands
    if [[ "$1" ]]; then
        # cut uses ' ' as a delimiter & prints everything from
        # the 3 field to the end of line
        history | rg "$1" | cut -c 8- | uniq -u
        # Other variations:
        # history | rg "$1" | cut -d' ' -f3- | uniq -u
    else
        echo -e "rgh needs a pattern to look for"
    fi
}

rgp() {
    # [p]ackage [g]rep
    if [[ "$1" ]]; then
        paru -Q | rg "$1"
    else
        echo -e "rgp needs a pattern to look for"
    fi
}

# ----------------------------------------------------------------------------------
# Files
# ----------------------------------------------------------------------------------

swap() {
    # Swap 2 filenames around, if they exist (from Uzi's bashrc).
    local TMPFILE=tmp.$$

    [ $# -ne 2 ] && echo "swap: 2 arguments needed" && return 1
    [ ! -e $1 ] && echo "swap: $1 does not exist" && return 1
    [ ! -e $2 ] && echo "swap: $2 does not exist" && return 1

    mv "$1" $TMPFILE
    mv "$2" "$1"
    mv $TMPFILE "$2"
}

extract() {
    # extract any file type
    if [ ! -f "$1" ]; then
        echo "Error: file $1 does not exist."
        return 1
    fi

    if [ ! -d "$2" ]; then
        echo "Error: directory $2 does not exist."
        return 1
    fi

    case "$1" in
        *.tar.bz2) tar xvjf "$1" -C "$2" ;;
        *.tar.gz) tar xvzf "$1" -C "$2" ;;
        *.tar.xz) tar xvJf "$1" -C "$2" ;;
        *.bz2) bunzip2 "$1" -C "$2" ;;
        *.rar) unrar x "$1" "$2" ;;
        *.gz) gunzip "$1" -C "$2" ;;
        *.tar) tar xvf "$1" -C "$2" ;;
        *.tbz2) tar xvjf "$1" -C "$2" ;;
        *.tgz) tar xvzf "$1" -C "$2" ;;
        *.zip) unzip "$1" -d "$2" ;;
        *) echo "Error: file format not recognized." ;;
    esac
}

nman() {
    # [n]eovim [man] pages
    if [ -z "$1" ]; then
        echo "specify man page"
    else
        man -P cat "$1" | nvim -R -
    fi
}

# ----------------------------------------------------------------------------------
# System monitoring
# ----------------------------------------------------------------------------------

myip() {
    # [my] [ip] address
    echo -e "🌐 $(curl -s https://api.ipify.org)"
}

# ----------------------------------------------------------------------------------
# Path
# ----------------------------------------------------------------------------------

path+=('/home/gabriel/bin')
path+=('/home/gabriel/.cargo/bin')
export PATH



# ----------------------------------------------------------------------------------
# Startup stuff
# ----------------------------------------------------------------------------------

nitch
eval "$(zoxide init zsh)"
eval "$(starship init zsh)"


source /home/gabriel/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
