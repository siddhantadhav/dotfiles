#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'

# starship
eval "$(starship init bash)"

alias vim='nvim'
PS1='[\u@\h \W]\$ '
. "$HOME/.cargo/env"

cx() {
  if [ -z "$1" ]; then
    echo "Usage: cx <file.cpp> [g++ options]"
    return 1
  fi
  src="$1"
  out="${src%.cpp}"
  g++ "$src" -o "$out" "${@:2}" || return 1
  ./"$out"
  rm "$out"
}
