#! /bin/sh

sudo rsync -av --relative /etc/X11/xinit/xinitrc .
sudo rsync -av --relative /home/z/.config/i3/ .
sudo rsync -av --relative /home/z/.config/fastfetch/ .
sudo rsync -av --relative /home/z/.config/nvim/ .
sudo rsync -av --relative /home/z/.config/picom/ .
sudo rsync -av --relative /home/z/.config/polybar/ .
sudo rsync -av --relative /home/z/.zshrc .
sudo rsync -av --relative /home/z/.config/starship.toml .
sudo rsync -av --relative /home/z/.config/betterlockscreen/betterlockscreenrc .
sudo rsync -av --relative /home/z/.config/dunst/dunstrc .
sudo rsync -av --relative /home/z/.config/nvim/init.lua .
sudo rsync -av --relative /home/z/.config/nvim/lua .
sudo rsync -av --relative /home/z/.config/starship.toml .
sudo rsync -av --relative /home/z/.config/xborders .


echo "arch dotfile updated on " $(date) >> log.txt

