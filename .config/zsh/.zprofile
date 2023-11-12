#!/bin/sh

# Defaults
export EDITOR="code"
export TERMINAL="kitty"
export BROWSER="brave-desktop"
export READER="brave-desktop"
export FILE="dolphin"

if [[ "$OSTYPE" == "darwin"* ]]; then
  export MACOS=true
fi

# XDG
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
  exec startx
fi
