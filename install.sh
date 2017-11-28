#!/bin/bash

# Install all extensions from extension file.
read -d '' -a installed < extensions.txt
for i in ${installed[@]}; do
  code --install-extension $i
done

# Copy settings file.
SETTINGS_PATH=~/Library/Application\ Support/Code/User/settings.json
if [[ $(uname) == 'Linux' ]]; then
  SETTINGS_PATH=~/.config/Code/User/settings.json
fi
cp ./settings.json "$SETTINGS_PATH"
