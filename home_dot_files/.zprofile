
echo "LOADED: .zprofile"
echo "[zprofile] $PATH"
# Load Homebrew paths first (MUST come before any use of brew)
eval "$(/opt/homebrew/bin/brew shellenv)"

# Source aliases in login shells
[ -f ~/.aliases ] && source ~/.aliases

# Sensitive data
[ -f ~/.zsh_sensitive ] && source ~/.zsh_sensitive

# PATH and tools
export PATH="$HOME/.asdf/shims:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/go/bin:$PATH"
export PATH="/usr/local/go/bin:$PATH"
export PATH="$HOME/.rd/bin:$PATH"  # Rancher Desktop
export PATH="$ANDROID_HOME/emulator:$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin:$ANDROID_HOME/platform-tools:$PATH"

# ASDF
if [ -f "$HOME/.asdf/asdf.sh" ]; then
  . "$HOME/.asdf/asdf.sh"
elif command -v brew &>/dev/null; then
  . "$(brew --prefix asdf)/libexec/asdf.sh"
fi

export ASDF_GOLANG_MOD_VERSION_ENABLED=true

# Language/Tooling paths
export PYTHONPATH="$HOME/.asdf/shims/python:$HOME/Training/Python/Mini_Projects/spotify/src"
export MYPYPATH="$HOME/.asdf/shims/python"

# Editor & Locale
export EDITOR='lvim'
export LANG="en_US.UTF-8"

# FZF default
export FZF_DEFAULT_COMMAND="fd . $HOME"

# Colors
export LS_COLORS='di=01;34:fi=00;36:ln=01;36:pi=01;33:so=01;35:bd=01;33:cd=01;33:or=01;31:mi=01;31:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.png=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.mpc=01;35:*.*=09;31'

