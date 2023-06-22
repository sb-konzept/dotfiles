export EDITOR="code -w"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# if yarn is installed, use yarn global bin
if [ -x "$(command -v yarn)" ]; then
  export PATH="`yarn global bin`:$PATH"
fi

# jenv
if [ -x "$(command -v jenv)" ]; then
  export PATH="$HOME/.jenv/bin:$PATH"
  eval "$(jenv init -)"
fi

# rbenv
if [ -x "$(command -v rbenv)" ]; then
  export PATH="$HOME/.rbenv/bin:$PATH"
  eval "$(rbenv init -)"
fi

# pyenv
if [ -x "$(command -v pyenv)" ]; then
  eval "$(pyenv init -)"
fi

# android
export ANDROID_SDK_ROOT="$HOME/Library/Android/sdk"
export ANDROID_HOME=$ANDROID_SDK_ROOT
export PATH="$ANDROID_SDK_ROOT/tools:$PATH"
export PATH="$ANDROID_SDK_ROOT/platform-tools:$PATH"

# Antigen stuff
source $HOME/.antigen.zsh
# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle cp
antigen bundle httpie
antigen bundle iwhois
antigen bundle lol
antigen bundle node
antigen bundle nvm
antigen bundle sudo
antigen bundle systemadmin
antigen bundle systemd
antigen bundle yarn
antigen bundle github
antigen bundle common-aliases
antigen bundle vi-mode
antigen bundle command-not-found
antigen bundle gcloud
antigen bundle docker
antigen bundle docker-compose
antigen bundle fzf
antigen bundle vscode
antigen bundle gcloud

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

# Load the theme.
antigen theme denysdovhan/spaceship-prompt

# completions
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-autosuggestions

# Tell Antigen that you're done.
antigen apply

# auto switch nvmrc
autoload -U add-zsh-hook
load-nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc

unalias tldr

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# pnpm
export PNPM_HOME="/Users/micha/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end