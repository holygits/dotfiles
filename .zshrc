#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

DEFAULT_USER=$USER

# Customize to your needs...
# User configuration
eval "$(pyenv init -)"
alias clock='tty-clock -cC 4 -Ss'
alias sort-imports='isort -rc'
alias plugenv='source ~/Projects/venv/bin/activate'
alias testnet-down='kill $(ps aux | grep "plug run" | awk "{print $2}")'
alias plug-ls='ps aux | grep "plug run"'

function kube-switch_ () {
  echo "Tacking kubectl namespace to: '$1'"
  alias kubectl="kubectl --namespace $1"
}

function unplug_ {
  echo "Kill pl^g nodes..."
  kill $(ps aux | grep 'plug run' | awk '{print $2}')
}

function style-pipeline {
  echo "sorting imports"
  sort-imports $1
  echo "applying styles"
  yapf -p -r -i --style='{based_on_style: facebook, column_limit: 119}' $1/*.py
  echo "Add trailing commas"
  find $1 -name '*.py' | xargs add-trailing-comma
}
alias plug-dev-style='style-pipeline'

function prune_local {
  git fetch -p && for branch in `git branch -vv | grep ': gone]' | awk '{print $1}'`; do git branch -D $branch; done
}

function style-checks {
  ./.tox/style/bin/flake8 tests plug
}

# Do some useful wasm checks in aggregate
function wasmv {
  wasm-validate $1
  wasm-objdump -x $1
  twiggy paths $1
}

alias unplug='unplug_'
export PATH="/usr/local/opt/sqlite/bin:/Users/jordanbeauchamp/scripts/:~/Projects/wabt/bin:$PATH"
alias git-prune-local='prune_local'
alias kubectl-set-ns='kube-switch_'
alias cat='bat'
alias todo='todolist'

# Vi Mode Setup
bindkey -v
export KEYTIMEOUT=1

# Update local node package
function npm-update {
  npm i -g npm-check-updates
  ncu -u
  npm install
}

# Rust sccahce enabled
#export RUSTC_WRAPPER=sccache

# NVM
#export NVM_DIR="$HOME/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
#[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
