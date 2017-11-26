#!/bin/sh

# Copy settings file.
cp ~/Library/Application\ Support/Code/User/settings.json ./settings.json

# Copy installed extensions to extensions file.
code --list-extensions > extensions.txt