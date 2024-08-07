# If you come from bash you might have to change your $PATH.

export PATH=$HOME/go/bin:$PATH

export PATH=~/.asdf/shims:$PATH
# export PATH=~/.asdf/shims/codespell:$PATH
export PATH=~/.asdf/shims/pip:$PATH
export PATH=~/.asdf/shims/python3:$PATH
export PATH=~/.local/bin:$PATH


export EDITOR='lvim'

# export PATH="/usr/local/opt/python@3.10/bin:$PATH"
# export PATH="//usr/local/opt/python@3.10/bin/pip3:$PATH"
# export W3MIMGDISPLAY_PATH="/usr/local/bin/w3m"

export PYTHONPATH=~/.asdf/shims/python
export PYTHONPATH=~/Training/Python/Mini_Projects/spotify/src
export MYPYPATH=~/.asdf/shims/python


# Android SDK
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$ANDROID_HOME/emulator:$PATH
export PATH=$ANDROID_HOME/tools:$PATH
export PATH=$ANDROID_HOME/tools/bin:$PATH
export PATH=$ANDROID_HOME/platform-tools:$PATH

# TODO: ZSH: Figure out hot to make hidden files red
# TODO: ZSH: Reduce color mappings

export LS_COLORS='di=01;34:fi=00;36:ln=01;36:pi=01;33:so=01;35:bd=01;33:cd=01;33:or=01;31:mi=01;31:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.png=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.mpc=01;35:*.*=09;31'
# LS_COLORS='fi=34'
export LS_COLORS



# ------------------------------------------------------------
#
# ------------------------------------------------------------

# Check if oh-my-zsh is installed
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo "Installing oh-my-zsh..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  # The installer changes the default shell to zsh and creates a new .zshrc, so we need to re-run this script
  exec zsh
fi

# If oh-my-zsh is installed, continue with the rest of the .zshrc file


export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes

ZSH_THEME="candy"

# Sets fd as default for fzf instead of find
export FZF_DEFAULT_COMMAND="fd . $HOME"


# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.

# Histry Tirme Format
export HISTTIMEFORMAT="%F %T "

# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder
# TODO: Research ZSH_CUSTOM
# Should I move aliases here?

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
#
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions

# TODO: Shell Upgrade: Create script to replace
# If nvim does not exist, downloads and installs commander

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nvim'

else
  export EDITOR='vim'

fi


# Compilation flags
# export ARCHFLAGS="-arch x86_64"


# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Prep for Terrafomr on M1
autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/bin/terraform terraform


## ZPlug Section
export ZPLUG_HOME=$(brew --prefix)/opt/zplug
source $ZPLUG_HOME/init.zsh && zplug update > /dev/null

## Add Plugins

# zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-autosuggestions"

## END


# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load --verbose

## End ZPlug Section

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

set -o vi

bindkey -v

plugins=(vi-mode git git-flow github npm osx svn history-substring-search zsh-syntax-highlighting)
# Fixes odities with vim-mode to make it work as expected
bindkey "^[OA" up-line-or-beginning-search
bindkey "^[OB" down-line-or-beginning-search
bindkey -M vicmd "k" up-line-or-beginning-search
bindkey -M vicmd "j" down-line-or-beginning-search

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="$HOME/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)

# Disable features

## Disable CLI Corrections
setopt nocorrectall


# bun completions
[ -s "/Users/rant/.bun/_bun" ] && source "/Users/rant/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
