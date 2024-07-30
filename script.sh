#! /bin/sh

sudo rsync -av --relative /etc/X11/xinit/xinitrc .
sudo rsync -av --relative $HOME/.config/kitty/ .
sudo rsync -av --relative $HOME/.config/i3/ .
sudo rsync -av --relative $HOME/.config/fastfetch/ .
sudo rsync -av --relative $HOME/.config/picom/ .
sudo rsync -av --relative $HOME/.config/polybar/ .
sudo rsync -av --relative $HOME/.zshrc .
sudo rsync -av --relative $HOME/.config/betterlockscreen/betterlockscreenrc .
sudo rsync -av --relative $HOME/.config/dunst/dunstrc .
sudo rsync -av --relative $HOME/.config/nvim/init.lua .
sudo rsync -av --relative $HOME/.config/nvim/lua .
sudo rsync -av --relative $HOME/.config/starship*.toml .
sudo rsync -av --relative $HOME/.config/xborders .
sudo rsync -av --relative $HOME/.config/hypr/ .


echo "arch dotfile updated on " $(date) >> log.txt

