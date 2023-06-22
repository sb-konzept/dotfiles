#!/usr/bin/env bash

# Prerequisites:
# - Xcode

cd $HOME

# Install Homebrew
mkdir homebrew && curl -L https://github.com/Homebrew/brew/tarball/master | tar xz --strip 1 -C homebrew

# nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
nvm install "lts/*"
npm i -g npm
npm i -g pnpm

curl -L git.io/antigen > .antigen.zsh

brew tap homebrew/cask-fonts
brew install the_silver_searcher fzf jenv rbenv pyenv pyenv-virtualenv graphicsmagick jq git-lfs neovim font-fira-mono-nerd-font