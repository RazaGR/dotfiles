# my dotfiles

```
rm -rf ~/.config/nvim && \
git clone https://github.com/RazaGR/dotfiles.git ~/.config/nvim
```
## install nvim
```
rm -rf  ~/.local/share/nvim && \
git clone https://github.com/neovim/neovim.git && \
cd neovim && \
git checkout release-0.8 && \
make CMAKE_BUILD_TYPE=Releasea && \
make install && nvim --version

```

## install yabai
```
brew install koekeishiya/formulae/yabai && \
brew install koekeishiya/formulae/skhd
```
setup config
```
cd ~/.config/nvim && \
ln -f skhdrc ~/.config/skhd/skhdrc && \
ln -f yabairc ~/.config/yabai/yabairc
```

## install tmux
```
brew install tmux && \
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm && \
cd ~/.config/nvim && \
ln -f tmux.conf ~/.tmux.conf && \
tmux source-file ~/.tmux.conf 
```
