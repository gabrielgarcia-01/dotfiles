#!/bin/sh
#
# ----------------------------------------------------------------------------------
# Searches
# ----------------------------------------------------------------------------------

function rgh() {
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

function rgp() {
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

function swap() {
    # Swap 2 filenames around, if they exist (from Uzi's bashrc).
    local TMPFILE=tmp.$$

    [ $# -ne 2 ] && echo "swap: 2 arguments needed" && return 1
    [ ! -e $1 ] && echo "swap: $1 does not exist" && return 1
    [ ! -e $2 ] && echo "swap: $2 does not exist" && return 1

    mv "$1" $TMPFILE
    mv "$2" "$1"
    mv $TMPFILE "$2"
}

function extract() {
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

function nman() {
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

function myip() {
    # [my] [ip] address
    echo -e "🌐 $(curl -s https://api.ipify.org)"
}
