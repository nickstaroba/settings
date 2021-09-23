# nvm
# export NVM_DIR="$HOME/.nvm"
#   [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
#   [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# prompt
export PS1="\n| \u:\h \w \n| $ "

# no zsh please
export BASH_SILENCE_DEPRECATION_WARNING=1

# autocompletion
bind "set completion-ignore-case on"
bind "set show-all-if-ambiguous on"

# git autocompletion
# curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -o ~/.git-completion.bash
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

# aliases
alias ll='ls -FGlAhp'

# functions

gaa() {
  git add .
}

gb () {
  git branch $1 $2 $3
}

gcp() {
  echo "git cherry-pick -n $1"
  echo -n "Are you sure (y/n)? "
  read answer
  if [ "$answer" != "${answer#[Yy]}" ] ;then
    git cherry-pick -n $1
  fi
}

gco() {
  git checkout $1 $2 $3
}

gf() {
  git fetch
}

gp() {
  echo "git pull origin $1"
  echo -n "Are you sure (y/n)? "
  read answer
  if [ "$answer" != "${answer#[Yy]}" ] ;then
    git cherry-pick -n $1
  fi
}

gpsh() {
  if [ "$1" != "master" ] ;then
    echo "git push -u origin $1 $2"
    echo -n "Are you sure (y/n)? "
    read answer
    if [ "$answer" != "${answer#[Yy]}" ] ;then
      git push -u origin $1 $2
    fi
  fi
}

gs() {
 git status
}

gst() {
  git stash save $1
}

gsta() {
  echo "git stash apply"
  echo -n "Are you sure (y/n)? "
  read answer
  if [ "$answer" != "${answer#[Yy]}" ] ;then
    git stash apply
  fi
}

gur() {
  echo "Running 'git stash && git checkout master && git fetch && git pull' in all subdirectories."
  echo -n "Are you sure (y/n)? "
  read answer
  if [ "$answer" != "${answer#[Yy]}" ] ;then
    for d in ./*/
    do
      if [ "$d" != "./node_modules/" ]
        then (echo -e "\n\n$d" && cd "$d" && git stash && git checkout master && git fetch && git pull);
      fi
    done
  fi
}

ncleanup() {
  npm run format && npm run stylelint && npm run lint
}

ndev() {
  npm run dev
}

nstart() {
  npm run start
}

nformat() {
  npm run format
}

ntest() {
  npm run test -- --noStackTrace $1
}

ncoverage() {
  npm run test -- --noStackTrace --coverage $1
  # ; cp -r coverage somewhere
}

lint() {
  npm run lint
}

stylelint() {
  npm run stylelint
}

# variables
# CONFIRM_REGEX='^([yY][eE][sS]|[yY])+$'

# example() {
#   read -r -p "Example? [y/N] " response
#   if [[ "$response" =~ $CONFIRM_REGEX ]]
#   then
#     echo "YES"
#   fi
# }

git-make-push-all() {
  read -r -p "Primary Repository URL: " primaryRepoUrl
  read -r -p "Secondary Repository URL: " secondaryRepoUrl

  git remote remove origin
  git remote add origin $primaryRepoUrl
  git remote set-url --add --push origin $secondaryRepoUrl
  git remote set-url --add --push origin $primaryRepoUrl

  echo "Git remotes modified."
}
