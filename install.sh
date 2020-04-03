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

# Copy settings file.
SETTINGS_PATH=~/Library/Application\ Support/Code/User
if [[ $(uname) == 'Linux' ]]; then
  SETTINGS_PATH=~/.config/Code/User/settings.json
fi
cp ./settings.json "$SETTINGS_PATH"
cp ./keybindings.json "$SETTINGS_PATH"

if [[ $? == 0 ]]; then
  echo "Installed Visual Studio Code configuration successfully."
fi
