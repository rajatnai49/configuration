export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="edvardm"
plugins=(git zsh-autosuggestions)
source $ZSH/oh-my-zsh.sh

export PATH="$HOME/.cargo/bin:/usr/local/go/bin:$PATH"
export PATH="$(go env GOPATH)/bin:$PATH"

export JAVA_HOME='/usr/lib/jvm/java-11-openjdk'
export PATH=$JAVA_HOME/bin:$PATH


export PNPM_HOME="$HOME/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"

corepack enable >/dev/null 2>&1

# source <(ng completion script)

export OLLAMA_MAX_LOADED_MODELS=1
export OLLAMA_NUM_PARALLEL=1

OBSIDIAN_VAULT="$HOME/Vaults/obsidian-vault"

alias zshconfig="nvim ~/.zshrc"
alias szsh="source ~/.zshrc"
alias tmux="tmux -u"
alias zed="/usr/bin/zeditor"

alias notes="nvim $OBSIDIAN_VAULT/znotes/"
alias dailynote="nvim $OBSIDIAN_VAULT/znotes/daily-notes/$(date +%d%m%Y).md"

sync_notes() {
  local msg="updated vault at $(date +%d%m%Y) $(date +%H:%M)"
  git -C "$OBSIDIAN_VAULT" add .
  git -C "$OBSIDIAN_VAULT" diff --cached --quiet && echo "No changes to commit" && return
  git -C "$OBSIDIAN_VAULT" commit -m "$msg"
  git -C "$OBSIDIAN_VAULT" push origin master
}

[[ $- == *i* ]] && fastfetch

# At the very END of .zshrc, after everything else
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"
