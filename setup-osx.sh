#!/bin/bash

# Screenshots
defaults write com.apple.screencapture name "Screenshot"
defaults write com.apple.screencapture location ${HOME}/Dropbox/Screenshots/`hostname | sed -e 's/\.local//g'`
defaults write com.apple.screencapture disable-shadow -bool true
defaults write -g ApplePersistence -bool false

defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

defaults write -g CheckSpellingWhileTyping -bool false
defaults write -g NSAllowContinuousSpellChecking -bool false

killall SystemUIServer
