# nvm
export NVM_DIR="$HOME/.nvm"
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# prompt
export PS1="\n| \u:\h \w \n| $ "

# autocompletion
bind "set completion-ignore-case on"
bind "set show-all-if-ambiguous on"

# git autocompletion
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

# functions
ll() {
  ls -FGlAhp
}

# variables
CONFIRM_REGEX='^([yY][eE][sS]|[yY])+$'

# examples
example() {
  read -r -p "Example? [y/N] " response
  if [[ "$response" =~ $CONFIRM_REGEX ]]
  then
    echo "YES"
  fi
}
