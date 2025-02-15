#!/bin/bash

set -eu -o pipefail

DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

ln -sf ${DIR}/bash/dot.bashrc ${HOME}/.bashrc

ln -sf ${DIR}/zsh/dot.zshrc ${HOME}/.zshrc
ln -sf ${DIR}/zsh/dot.zlogout ${HOME}/.zlogout

ln -sf ${DIR}/vim/dot.vimrc ${HOME}/.vimrc
ln -sf ${DIR}/vim/dot.vim ${HOME}/.vim

ln -sf ${DIR}/tmux/dot.tmux.conf ${HOME}/.tmux.conf

ln -sf ${DIR}/git/dot.gitconfig ${HOME}/.gitconfig
ln -sf ${DIR}/git/dot.gitignore ${HOME}/.gitignore
