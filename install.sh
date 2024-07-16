#! /usr/bin/bash

set -x 

check_distro_and_set_env_var(){ 
	echo "Checking current distro"
	export distro=$(cat /etc/os-release | grep -ie "^id_like=" | cut -d '=' -f 2 )
	if [[ "$distro" == "arch" ]]; then
		echo "You are running an arch based system"
		export install_cmd1="sudo pacman -S --no-confirm"
		export install_cmd2="paru -S --no-confirm"
		export dependencies="xorg-xinit xorg zsh zsh-autosuggestion zsh-syntax-highlighting kitty betterlockscreen i3 dunst fastfetch polybar picom zellij neovim nitrogen feh xborders"
		export extra_dependencies=" "
	elif [[ "$distro" == "debian" ]]; then 
		echo "You are running a debian based system"
		export install_cmd1="sudo apt install -y" 
		export install_cmd2="git clone"
		export dependencies="zsh zsh-autosuggestions zsh-syntax-highlighting kitty neofetch dunst neovim thefuck npm"
		export extra_dependencies=""
	else
		echo "Distro not supported yet"
	fi
}

installing_dependencies(){
	echo "Installing dependencies from main repo. Be ready to be prompt for sudo password"
	sleep 5
	`$install_cmd1 $dependencies`
	echo "Installing from secondary repo. If using debian we will be pulling source code from github and compiling it on the machine"
	sleep 5
	`$install_cmd2 $extra_dependencies`
	echo "downloading starship"
	curl -sS https://starship.rs/install.sh | sh
}

configuring(){
	echo "copying config files"
	sleep 5
	sudo cp -a ./etc/ /etc
	sudo cp -a ./home/z/.config $HOME
	sudo cp -a ./home/z/.zshrc $HOME
	ln -sf ./Wallpapers $HOME/Wallpapers
	if [[ $distro == 'debian' ]]; then
		echo "applying patches for debian"
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
	fi
}
echo "This installation may require your attention and input"
check_distro_and_set_env_var
installing_dependencies
configuring
zsh
echo "Installation done. You might need to update and upgrade your package to match the configuration files"
