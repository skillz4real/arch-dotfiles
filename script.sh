#! /bin/sh

sudo rsync -av --relative /home/z/.config/polybar/* .
sudo rsync -av --relative /home/z/.config/neofetch/config.conf .
sudo rsync -av --relative /home/z/.config/i3/* .
sudo rsync -av --relative /home/z/.config/cava/config .
sudo rsync -av --relative /home/z/.config/alacritty/alacritty.yaml .
sudo rsync -av --relative /home/z/.config/kitty/* .
sudo rsync -av --relative /etc/X11/xinit/xinitrc .
sudo rsync -av --relative /home/z/.bashrc .

echo "arch dotfile updated on " $(date) >> log.txt
