export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="edvardm"

plugins=(git zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

export PATH=$PATH:/usr/local/go/bin
OBSIDIAN_VAULT="$HOME/Vaults/obsidian-vault"

alias zshconfig="nvim ~/.zshrc"
alias szsh="source ~/.zshrc"
alias ohmyzsh="nvim ~/.oh-my-zsh"
alias tmux="tmux -u"
alias zed='/usr/bin/zeditor'
alias notes="nvim $OBSIDIAN_VAULT/znotes/"
alias todaynote="nvim $OBSIDIAN_VAULT/znotes/$(date +%d%m%Y).md"

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
export PATH="$HOME/.cargo/bin:$PATH"

fastfetch

# pnpm
export PNPM_HOME="/home/rajatnai49/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

export OLLAMA_MAX_LOADED_MODELS=1
export OLLAMA_NUM_PARALLEL=1

sync_notes() {
  msg="updated vault at $(date +%d%m%Y) $(date +%H:%M)"
  git -C "$OBSIDIAN_VAULT" add .
  git -C "$VAULT" diff --cached --quiet && echo "No changes to commit" && return
  git -C "$VAULT" commit -m "$msg"
  git -C "$VAULT" push origin master
}
