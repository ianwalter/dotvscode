#!/bin/bash

settingsPath=$HOME/Library/Application\ Support/Code/User
if [[ $(uname) == 'Linux' ]]; then
  settingsPath=~/.config/Code/User/settings.json
fi

# Copy settings files.
cp "$settingsPath/settings.json" .
cp "$settingsPath/keybindings.json" .

# Copy installed extensions to extensions file.
code --list-extensions > extensions.txt
