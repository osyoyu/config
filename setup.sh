#!/bin/bash

set -eu -o pipefail

DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

set -x

ln -sf ${DIR}/bash/dot.bashrc ${HOME}/.bashrc

ln -sf ${DIR}/zsh/dot.zshrc ${HOME}/.zshrc
ln -sf ${DIR}/zsh/dot.zlogout ${HOME}/.zlogout

ln -sf ${DIR}/vim/dot.vimrc ${HOME}/.vimrc
ln -sfn ${DIR}/vim/dot.vim ${HOME}/.vim

mkdir -p ${HOME}/.config/nvim
ln -sf ${DIR}/nvim/init.lua ${HOME}/.config/nvim/init.lua

ln -sf ${DIR}/tmux/dot.tmux.conf ${HOME}/.tmux.conf

ln -sf ${DIR}/git/dot.gitconfig ${HOME}/.gitconfig
ln -sf ${DIR}/git/dot.gitignore ${HOME}/.gitignore

mkdir -p ${HOME}/.config/ghostty
ln -sf ${DIR}/ghostty/config ${HOME}/.config/ghostty/config

ln -sf ${DIR}/zed/settings.json ${HOME}/.config/zed/settings.json
ln -sf ${DIR}/zed/keymap.json ${HOME}/.config/zed/keymap.json

ln -sf ${DIR}/claude/settings.json ${HOME}/.claude/settings.json
