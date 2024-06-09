#! /usr/bin/bash

#set -x 

distro=$(cat /etc/os-release | grep -ie "^id=" | cut -d '=' -f 2 )
if [[ "$distro" == "arch" ]]; then
  install_cmd1="pacman -S --no-confirm"
  install_cmd2="paru -S --no-confirm"
  dependencies="xorg-xinit xorg zsh zsh-autosuggestion zsh-syntax-highlighting kitty betterlockscreen i3 dunst fastfetch polybar picom zellij neovim nitrogen feh xborders"
  aur_dependencies=" "

  echo "Installing dependencies from Arch Repo "
  sleep 5

  `$install_cmd1 $dependencies`

  echo "copying config files"
  sleep 5

  cp -a ./etc/ /etc
  cp -a ./home/z/.config $HOME
  cp -a ./home/z/.zshrc $HOME
  ln -sf ./Wallpapers $HOME/Wallpapers
   
elif [[ "$distro" == "kali" ]]; then 
  install_cmd1="apt install -y" 
  dependencies="zsh zsh-autosuggestions zsh-syntax-highlighting kitty neofetch dunst neovim thefuck"
  echo "manually run sudo apt install -y $dependencies"
  sleep 5
  #`$install_cmd1 $dependencies`
  echo "copying config files"
  sleep 5
  cp -a ./home/z/.config $HOME
  ln -sf ./Wallpapers $HOME/Wallpapers
  echo "applying patches for kali"
  awk '{ if (NR == 4) { 
    print "neofetch" 
  } else if (NR == 5){
    print "source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" 
  } else if (NR == 6){
    print "source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh" 
  } else {
    print 
  }
  }' home/z/.zshrc > $HOME/.zshrc

  sleep 5

  echo "downloading starship"

  curl -sS https://starship.rs/install.sh | sh

  zsh

  else
  echo "Distro not supported yet"
fi
