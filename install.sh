#!/bin/bash

if [[ `which code` ]]; then
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
fi

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
cp ./settings.json "$settingsPath"
cp ./keybindings.json "$settingsPath"

if [[ -d $codeServerPath ]]; then
  systemctl --user restart code-server
fi

if [[ $? == 0 ]]; then
  printf "\n✅ Installed Visual Studio Code configuration successfully.\n"
fi
