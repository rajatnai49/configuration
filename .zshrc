export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="edvardm"

plugins=(git zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

export PATH=$PATH:/usr/local/go/bin

alias zshconfig="nvim ~/.zshrc"
alias szsh="source ~/.zshrc"
alias ohmyzsh="nvim ~/.oh-my-zsh"
alias tmux="tmux -u"
alias zed='/usr/bin/zeditor'

alias sim-sim='. sim-sim'

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

export JAVA_HOME='/usr/lib/jvm/java-11-openjdk'
export PATH=$JAVA_HOME/bin:$PATH
# export HADOOP_HOME=~/hadoop
# export PATH=$PATH:$HADOOP_HOME/bin
# export HADOOP_CONF_DIR=$HADOOP_HOME/etc/hadoop

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
export PATH=$(go env GOPATH)/bin:$PATH


# Load Angular CLI autocompletion.
source <(ng completion script)
