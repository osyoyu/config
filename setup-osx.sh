#!/bin/bash

# Screenshots
defaults write com.apple.screencapture name "Screenshot"
defaults write com.apple.screencapture location ${HOME}/Dropbox/Screenshots/`hostname | sed -e 's/\.local//g'`
defaults write com.apple.screencapture disable-shadow -bool true
killall SystemUIServer
