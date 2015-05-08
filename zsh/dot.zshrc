#----------------------------
# General
#----------------------------
if [ -n "$TMUX" ]; then
  export TERM=screen-256color
else
  export TERM=xterm-256color
fi

export EDITOR=vim
export LANG=en_US.UTF-8
export KCODE=u

setopt correct
setopt magic_equal_subst


#----------------------------
# History
#----------------------------
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=50000
setopt extended_history
setopt share_history
setopt hist_ignore_space

autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end


#----------------------------
# Completion
#----------------------------
autoload -U compinit; compinit
setopt auto_menu
setopt list_types
setopt magic_equal_subst
setopt menu_complete
bindkey "^[[Z" reverse-menu-complete  # Shift-Tabで補完候補を逆順する("\e[Z"でも動作する)
zstyle ':completion:*:default' menu select=2
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' # 補完時に大文字小文字を区別しない
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z} r:|[-_.]=**' # /e/h/h 的省略

setopt auto_pushd


#----------------------------
# Alias
#----------------------------
alias cd=" cd"

case ${OSTYPE} in
  linux*)
    alias ls="ls -lh --color=auto --show-control-chars"
    ;;
  darwin*)
    alias ls="ls -lhG"

    alias gcc="gcc-4.9"
    alias g++="g++-4.9"
    ;;
esac

# Shortcuts
alias g="git"

# C++ compilers
alias g++11="g++ -std=c++11 -Wall -pedantic"
alias clang++11="clang++ -std=c++11 -Wall -pedantic -I/Users/osyoyu/Sprout"
alias clang++1y="clang++ -std=c++1y -Wall -pedantic -I/Users/osyoyu/Sprout"

# Other Aliases
alias ssh-silent="ssh -fN"

# Things come in handy
alias history-all="history -E 1"
alias cls='printf "\033c"'
alias zsh-reload=". ~/.zshrc"
alias ds-store-delete="find . -name ".DS_Store" -depth -exec rm {} \;"
alias rot13="tr A-Za-z N-ZA-Mn-za-m"


#----------------------------
# Pre/Post-commands
#----------------------------
preexec_functions=()
precmd_functions=()

function chpwd() {
  emulate -L zsh
  ls
}

local hostname=`hostname -s`

function set_title_to_command {
  # TODO: Show the 'real' command

  if [[ ! "$1" =~ "^tmux" ]]; then
    printf "\033k$(echo $1 | sed -e "s/ .*$//g")\033\\"
  fi
}

function set_title_to_hostname {
  if [ -z $TMUX ]; then
    printf "\033k${hostname}\033\\"
  else
    printf "\033k$0\033\\"
  fi
}

function set_title_to_pwd {
  printf "\033k$(basename $(pwd))\033\\"
}

if [ "$(echo ${SSH_CLIENT} | tr -d '\n')" != "" ]; then
  preexec_functions=($preexec_functions set_title_to_command)
  postexec_functions=($preexec_functions set_title_to_hostname)
  precmd_functions=($precmd_functions set_title_to_hostname)
fi

precmd_functions=($precmd_functions set_title_to_pwd)


#----------------------------
# Prompt
#----------------------------
autoload colors; colors

local name="%n"
if [ "$(whoami)" = "root" ]; then
  name="%{%K{red}%F{white}%}${name}%{%f%k%}"
fi

local host=""
if [ "$(echo ${SSH_CLIENT} | tr -d '\n')" != "" ]; then
  host="@%U%M%u"
fi

PROMPT="
${name}${host} %{%(?.$fg[blue].$fg[red])%}%~%{$reset_color%}
%# "
RPROMPT="%T"

setopt transient_rprompt


#----------------------------
# Key Bindings
# https://bbs.archlinux.org/viewtopic.php?pid=428669
#----------------------------
bindkey -e
bindkey "\e[1~" beginning-of-line
bindkey "\e[4~" end-of-line
bindkey "\e[5~" beginning-of-history
bindkey "\e[6~" end-of-history
bindkey "\e[3~" delete-char
bindkey "\e[2~" quoted-insert
bindkey "\e[5C" forward-word
bindkey "\eOc" emacs-forward-word
bindkey "\e[5D" backward-word
bindkey "\eOd" emacs-backward-word
bindkey "ee[C" forward-word
bindkey "ee[D" backward-word
bindkey "\^H" backward-delete-word
bindkey "\^P" bck-i-search


#----------------------------
# PATH and Package Managers
#----------------------------
# local
export PATH="$HOME/local/bin:$PATH"

# rbenv
export PATH="$HOME/.rbenv/shims:$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# nodebrew
export PATH="$HOME/.nodebrew/current/bin:$PATH"

# MacTeX
if [[ ${OSTYPE} =~ "^darwin" ]] then
  export PATH="/usr/texbin:$PATH"
fi

# Heroku
export PATH="/usr/local/heroku/bin:$PATH"

# OS X
if [[ ${OSTYPE} =~ "^darwin" ]] then
  export PATH="/usr/local/bin:$PATH"
fi
