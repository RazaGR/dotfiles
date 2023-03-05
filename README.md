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
make CMAKE_BUILD_TYPE=Release && \
make install && nvim --version

```

# other 
```
brew install lazygit
brew install fd
```



## install yabai
```
brew install koekeishiya/formulae/yabai && \
brew install koekeishiya/formulae/skhd
```
setup config
```
cd ~/.config/nvim && mkdir skhd && mkdir yabai && \
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
after installing tmuxh run `CTRL+i` in terminal to install themes and plugins for tmux

## nvim related
```
brew install jq # parse json in rest
```

## tmux shortcut
```
ln -f t.sh /usr/local/bin/t 
```
```
t l = tmux ls
t a 0/name = tmux attach -t {index||name}
t k = tmuxh kill -t {name}
t n name = tmuxh new -s {name}

```
##iterm 

```
install a nerdfont 
in Settings > Profiles > Text
   -> 
```

