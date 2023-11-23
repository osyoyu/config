#----------------------------
# General
#----------------------------
export LANG=en_US.UTF-8

if type "nvim" > /dev/null; then
  export VISUAL=nvim
else
  export VISUAL=vim
fi
export EDITOR=$VISUAL
export GIT_EDITOR=$VISUAL

setopt correct
setopt interactivecomments

autoload -Uz add-zsh-hook

export REPORTTIME=10


#----------------------------
# History
#----------------------------
HISTFILE=~/.zsh_history
HISTSIZE=10000000
SAVEHIST=1000000000
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

setopt auto_pushd


#----------------------------
# Alias
#----------------------------
case ${OSTYPE} in
  linux*)
    alias ls="ls -lh --color=auto --show-control-chars"
    ;;
  darwin*)
    alias ls="ls -lhG"
    ;;
esac

# Other Aliases
if type "nvim" > /dev/null; then
  alias vim=nvim
fi
alias ssh-silent="ssh -fN"

# Things come in handy
alias cdgitroot='cd $(git rev-parse --show-toplevel)'
alias cdg='cdgitroot'
alias be="bundle exec"
alias history-all="history -E 1"
alias cls='printf "\033c"'
alias zsh-reload="source ~/.zshrc"
alias ds-store-delete="find . -name ".DS_Store" -depth -exec rm {} \;"
alias rot13="tr A-Za-z N-ZA-Mn-za-m"
alias fuckswp="find . -name '*.swp' -exec rm {} \;"


#----------------------------
# Pre/Post-commands
#----------------------------
preexec_functions=()

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

function say_command {
  osascript -e "set Volume 10"
  say -- $(fc -ln -1)
  osascript -e "set Volume 0"
}

if [ "$(echo ${SSH_CLIENT} | tr -d '\n')" != "" ]; then
  # preexec_functions=($preexec_functions set_title_to_command)
  # postexec_functions=($preexec_functions set_title_to_hostname)
  add-zsh-hook precmd set_title_to_hostname
fi

add-zsh-hook precmd set_title_to_pwd
# add-zsh-hook precmd say_command


#----------------------------
# Prompt
#----------------------------
autoload -Uz colors; colors

local name="%n"
if [ "$(whoami)" = "root" ]; then
  name="%{%K{red}%F{white}%}${name}%{%f%k%}"
fi

local host=""
if [ "$(echo ${SSH_CLIENT} | tr -d '\n')" != "" ]; then
  host="@%U%M%u"
fi

autoload -Uz vcs_info
zstyle ':vcs_info:*' formats '#%b'
zstyle ':vcs_info:*' actionformats '#%b|%a'

function _precmd_vcs_info {
  LANG=en_US.UTF-8 vcs_info
}
add-zsh-hook precmd _precmd_vcs_info

setopt prompt_subst
setopt transient_rprompt

if [[ -v ${VIRTUAL_ENV} ]]; then
  local PY_VENV_STRING="py: $(basename ${VIRTUAL_ENV})"
fi

# PROMPT='
# ${name}${host} %{%(?.$fg[blue].$fg[red])%}%~$fg[green]${vcs_info_msg_0_}%{$reset_color%} $(basename "${VIRTUAL_ENV} ")
# %# '
PROMPT='
${name}${host} %{%(?.$fg[blue].$fg[red])%}%~$fg[green]${vcs_info_msg_0_}%{$reset_color%}
%# '
RPROMPT="%T"


#----------------------------
# Key Bindings
# https://bbs.archlinux.org/viewtopic.php?pid=428669
#----------------------------
bindkey -e
bindkey "\e[1~" beginning-of-line
bindkey "\e[4~" end-of-line
bindkey "\e[3~" delete-char
bindkey "\^P" bck-i-search


#----------------------------
# PATH and Package Managers
#----------------------------
# Homebrew
export HOMEBREW_NO_AUTO_UPDATE=1  # don't run update on install

# Ruby (rbenv)
export PATH="$HOME/.rbenv/shims:$HOME/.rbenv/bin:$PATH"
if type "rbenv" > /dev/null; then
  eval "$(rbenv init -)"
fi

# Node (nodebrew, volta)
export PATH="$HOME/.nodebrew/current/bin:$PATH"
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

# Go
export GOPATH="$HOME/go"
export PATH="$HOME/go/bin:$PATH"

# Rust
export PATH="$HOME/.cargo/bin:$PATH"

# macOS
if [[ ${OSTYPE} =~ "^darwin" ]] then
  export PATH="/usr/local/bin:$PATH"
fi

# ~/.local/bin
export PATH="$PATH:$HOME/.local/bin"


#----------------------------
# Local config
#----------------------------
if [[ -f $HOME/.zshrc.local ]]; then
  source $HOME/.zshrc.local
fi
