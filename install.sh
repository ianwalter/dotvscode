#!/bin/bash

# Read in the extensions file.
read -d '' -a master < extensions.txt

# Uninstall any installed extensions that are not in the extension file.
installed=$(code --list-extensions)
for i in ${installed[@]}; do
  if [[ ${master[@]} != *"$i"* ]]; then
    code --uninstall-extension $i
  fi
done

# Install missing extensions found in the extension file.
for i in ${master[@]}; do
  if [[ ${installed[@]} != *"$i"* ]]; then
    code --install-extension $i
  fi
done

settingsPath=$HOME/Library/Application\ Support/Code/User
if [[ $(uname) == 'Linux' ]]; then
  settingsPath=~/.config/Code/User/settings.json
fi

# Copy settings files.
cp ./settings.json "$settingsPath"
cp ./keybindings.json "$settingsPath"

if [[ $? == 0 ]]; then
  printf "\n✅ Installed Visual Studio Code configuration successfully.\n"
fi
