#!/usr/bin/env bash

# install things to setup additional packages sources
sudo apt-get install apt-transport-https ca-certificates gnupg

# gcloud sdk
echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -

# update with new package sources
sudo apt-get update

# useful things
sudo apt-get install -y \
  silversearcher-ag \
  golang-go \
  jq \
  fzf \
  google-cloud-sdk

# antigen
curl -L git.io/antigen > .antigen.zsh

# nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
npm i -g pnpm

# jenv
git clone https://github.com/jenv/jenv.git ~/.jenv

# rbenv
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
cd ~/.rbenv && src/configure && make -C src