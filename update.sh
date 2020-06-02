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

codeBin='code'
if [[ `which code-server` ]]; then
  codeBin=code-server
fi

# Copy installed extensions to extensions file.
$codeBin --list-extensions > extensions.txt
