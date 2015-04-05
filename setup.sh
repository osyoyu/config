#!/bin/bash

DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

if [ -z "$HOME" ]; then
  echo "!!! DANGER !!!"
  echo "Your \$HOME is empty. Aborting."

  exit 1
fi

ln -sf ${DIR}/bash/dot.bashrc ${HOME}/.bashrc
ln -sf ${DIR}/zsh/dot.zshrc ${HOME}/.zshrc
ln -sf ${DIR}/vim/dot.vimrc ${HOME}/.vimrc
ln -sf ${DIR}/vim/dot.vim ${HOME}/.vim
ln -sf ${DIR}/dot.tmux.conf ${HOME}/.tmux.conf
ln -sf ${DIR}/git/dot.gitconfig ${HOME}/.gitconfig
ln -sf ${DIR}/git/dot.gitignore ${HOME}/.gitignore
