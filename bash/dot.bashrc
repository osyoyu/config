# user@hostname relpath (bash-version)
export PS1="\[\n\u@\h \[\e[34m\]\w\[\e[m\] (\s-\v) \n\$ "

# show zsh-like completion candidates
bind 'set show-all-if-ambiguous on'
bind 'TAB:menu-complete'

# Aliases
if [[ "$(uname)" == 'Linux' ]]; then
  alias ls='ls -l --color=auto'
elif [ "$(uname)" == 'Darwin' ]; then
  alias ls='ls -lG'
fi

export PATH="$HOME/.rbenv/shims:$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
