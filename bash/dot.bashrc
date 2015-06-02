if [ "$(expr substr $(uname -s) 1 5)" == 'Linux' ]; then
  alias ls='ls -l --color=auto'
elif [ "$(uname)" == 'Darwin' ]; then
  alias ls='ls -lG'
fi

export PATH="$HOME/.rbenv/shims:$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
