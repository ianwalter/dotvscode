#!/bin/sh

# Install all extensions from extension file.
read -d '' -a installed < extensions.txt
for i in ${installed[@]}; do
  code --install-extension $i
done

# Copy settings file.
cp ./settings.json ~/Library/Application\ Support/Code/User/settings.json