#!/bin/bash
# This script is used to setup the environment for the nvim, tmux, and yabai


#mkdir -p ~/.config/nvim
#rm -rf  ~/.local/share/nvim
#git clone https://github.com/neovim/neovim.git
#cd neovim
#git checkout release-0.8
#make CMAKE_BUILD_TYPE=Releasea
#make install && nvim --version
#git clone https://github.com/RazaGR/dotfiles.git ~/.config/nvim


#brew install koekeishiya/formulae/yabai
#brew install koekeishiya/formulae/skhd
mkdir -p ~/.config/skhd 
mkdir -p ~/.config/yabai
# hardlink skhdrc from current directory to  ~/.config/skhd/skhdrc
ln -f skhdrc ~/.config/skhd/skhdrc
# hardlink yabairc from current directory to  ~/.config/yabai/yabairc
ln -f yabairc ~/.config/yabai/yabairc


brew services start yabai
brew services start skhd



brew install tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
ln -f tmux.conf ~/.tmux.conf
# hardlink skhdrc to  ~/.config/skhd/skhdrc 
# make sure folders exist if not create 





