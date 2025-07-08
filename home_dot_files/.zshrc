echo "LOADED: .zshrc"
echo "[zshrc] $PATH"
# Source aliases
[ -f ~/.aliases ] && source ~/.aliases

# PATH and tools
export PATH="$HOME/.asdf/shims:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/go/bin:$PATH"
export PATH="/usr/local/go/bin:$PATH"
export PATH="$HOME/.rd/bin:$PATH"  # Rancher Desktop
export PATH="$ANDROID_HOME/emulator:$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin:$ANDROID_HOME/platform-tools:$PATH"

# Android
export ANDROID_HOME="$HOME/Library/Android/sdk"

# Bun
export BUN_INSTALL="$HOME/.bun"


# Oh-My-Zsh Setup
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="candy"

DISABLE_MAGIC_FUNCTIONS=true
DISABLE_UPDATE_PROMPT="true"
ENABLE_CORRECTION="true"
HIST_STAMPS="mm/dd/yyyy"
export HISTTIMEFORMAT="%F %T "

plugins=(vi-mode git git-flow github npm svn history-substring-search)

# ZPlug was messing up the order of my path - This ensures consistency
# Save the correct PATH early in .zshrc
ORIGINAL_PATH="$PATH"

source $ZSH/oh-my-zsh.sh

# ZPlug Setup
#
export ZPLUG_HOME=$(brew --prefix)/opt/zplug

source $ZPLUG_HOME/init.zsh && zplug update > /dev/null
zplug "zsh-users/zsh-autosuggestions"
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-syntax-highlighting"

zplug load 

# Restore original PATH after zplug may have modified it
export PATH="$ORIGINAL_PATH"

# TODO: Oneday - get the terraform autocomplete to automatically be installed 
#
# Enable completion
autoload -Uz compinit
compinit

# Bun completion
[ -s "$BUN_INSTALL/_bun" ] && source "$BUN_INSTALL/_bun"

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Vi-mode + Keybindings
set -o vi
bindkey -v
bindkey "^[OA" up-line-or-beginning-search
bindkey "^[OB" down-line-or-beginning-search
bindkey -M vicmd "k" up-line-or-beginning-search
bindkey -M vicmd "j" down-line-or-beginning-search

# Shell behavior
setopt nocorrectall

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /Users/danielwalker/.asdf/installs/terraform/1.10.5/bin/terraform terraform


# De-duplicate PATH while keeping order
typeset -U path
