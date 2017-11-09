# Initialize git code completion per install of `homebrew bash-completion`
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

export GOPATH=/usr/local/Cellar/go/1.8.3/

# Put homewbrew directories before system
PATH=/usr/local/bin:$PATH

# Add sbin to path
PATH=/usr/local/sbin:$PATH

# Include home bin direcotory
PATH=$HOME/bin:$PATH

# Include rbenv stuff
PATH=$HOME/.rbenv/bin:$PATH

# Include local bin and binstubs directories
PATH=./bin:./.bundle/bin:$PATH

# Include npm directory
PATH=/usr/local/share/npm/bin:$PATH

# Added by the Heroku Toolbelt
PATH="/usr/local/heroku/bin:$PATH"

export PATH

# Code for rbenv
eval "$(rbenv init -)"

# Some bundle sugar
alias be="bundle exec"
alias b='bundle'

# Git aliases
alias gd="git diff | vim"
alias ga="git add"
alias gbd="git branch -d"
alias gst="git status"
alias gca="git commit -a -m"
alias gm="git merge --no-ff"
alias gp="git push"
alias grh="git reset --hard"
alias gb="git branch"
alias gcob="git checkout -b"
alias gco="git checkout"
alias gba="git branch -a"
alias gcp="git cherry-pick"
alias gl="git log --pretty='format:%Cgreen%h%Creset %an - %s' --graph"
alias gpom="git pull origin master"
alias grbc="git rebase --continue"

# More aliases

# Work around cli bug with gitx
alias gx="gitx --git-dir=."

alias v="mvim ."
alias es="ember serve"
alias es!="killall ember && ember serve"
alias et="ember test --server --launch=none"

# Editor aliases

alias tag="ctags -Rw ."

### Rails Aliases ###

alias migrate="be rake db:migrate db:test:prepare"

### Prompt Stuff ###

# function _update_ps1()
# {
#   export PS1="$(~/.bash_plugins/powerline-bash/powerline-bash.py $?)"
# }
# export PROMPT_COMMAND="_update_ps1"
# powerline-daemon -q
# POWERLINE_BASH_CONTINUATION=1
# POWERLINE_BASH_SELECT=1
# . /usr/local/lib/python2.7/site-packages/powerline/bindings/bash/powerline.sh

export EDITOR="mvim"

function _update_ps1() {
  export PS1="$(~/bin/powerline-shell.py $? 2> /dev/null)"
}

export PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"

export NVM_DIR=~/.nvm
. $(brew --prefix nvm)/nvm.sh
