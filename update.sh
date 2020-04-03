#!/bin/bash

# Copy settings file.
SETTINGS_PATH=~/Library/Application\ Support/Code/User
if [[ $(uname) == 'Linux' ]]; then
  SETTINGS_PATH=~/.config/Code/User/settings.json
fi
cp "$SETTINGS_PATH/settings.json" .
cp "$SETTINGS_PATH/keybindings.json" .

# Copy installed extensions to extensions file.
code --list-extensions > extensions.txt
