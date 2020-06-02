#!/bin/bash

settingsPath=$HOME/Library/Application\ Support/Code/User
codeServerPath=$HOME/.local/share/code-server/User
if [[ $(uname) == 'Linux' ]]; then
  if [[ -d $codeServerPath ]]; then
    settingsPath=$codeServerPath
  else
    settingsPath=~/.config/Code/User/settings.json
  fi
fi

# Copy settings files.
cp "$settingsPath/settings.json" .
cp "$settingsPath/keybindings.json" .

# Copy installed extensions to extensions file.
if [[ `which code` ]]; then
  code --list-extensions > extensions.txt
fi
