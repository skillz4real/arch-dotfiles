#! /bin/sh

sudo rsync -av --relative /etc/X11/xinit/xinitrc .
sudo rsync -av --relative /home/z/.config/alacritty/ .
sudo rsync -av --relative /home/z/.config/i3/ .
sudo rsync -av --relative /home/z/.config/neofetch/ .
sudo rsync -av --relative /home/z/.config/nvim/ .
sudo rsync -av --relative /home/z/.config/picom/ .
sudo rsync -av --relative /home/z/.config/polybar/ .
sudo rsync -av --relative /home/z/.zshrc .
sudo rsync -av --relative /home/z/.config/.starship.toml .

echo "arch dotfile updated on " $(date) >> log.txt

