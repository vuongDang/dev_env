#!/bin/bash

set -x

mkdir -p ~/local/bin
mkdir -p ~/local/src
echo "export PATH=\"$HOME/local/bin:\$PATH\"" >> ~/.bashrc

# lazygit 
mkdir -p ~/local/src/lazygit
curl -sL https://github.com/jesseduffield/lazygit/releases/download/v0.40.2/lazygit_0.40.2_Linux_x86_64.tar.gz | tar xzf - -C ~/local/src/lazygit
ln -sf ~/local/src/lazygit/lazygit ~/local/bin

# Install neovim
mkdir -p ~/local/src/nvim
curl -sL https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.tar.gz | tar xzf - -C ~/local/src/nvim
ln -sf ~/local/src/nvim/nvim-linux64/bin/nvim ~/local/bin

# Configure neovim with AstroNvim and my config
rm -rf ~/.config/nvim
git clone --depth 1 https://github.com/AstroNvim/AstroNvim ~/.config/nvim
git clone https://github.com/vuongDang/astronvim-config.git ~/.config/nvim/lua/user

# Configure shell
echo 'export PS1="\n\[$(tput setaf 215)\]\t \[\033[32m\]\[$(tput setaf 39)\]\u\[$(tput setaf 81)\]@\[$(tput setaf 77)\]\h \[$(tput setaf 226)\]\w\[\033[00m\] $ "' >> ~/.bashrc
echo "alias ls='ls --color=auto'" >> ~/.bashrc

. ~/.bashrc

