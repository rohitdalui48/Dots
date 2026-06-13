#!/bin/bash

sudo pacman -S --needed --noconfirm figlet

declare -a packages=(
	"jq"
)
require_reboot=0

#Downlaoding basic packages
packages_installtion() {
	figlet "Packages"
	sudo pacman -S --needed --noconfirm base-devel "${packages[@]}"
}

# Setting up Yaymkdir -p ~/Downloads
yay_setup() {
	figlet "Yay"
	if pacman -Q yay &>/dev/null; then
		success "Yay is already installed"
	else 
		info "Installing Yay"
		cd ~/Downloads
		git clone https://aur.archlinux.org/yay.git
		cd yay
		makepkg -si
		rm -rf ~/Downloads/yay/
	fi
}

rust_setup(){
	figlet "cargo"
	if cargo --version >/dev/null; then
		success "Cargo is already installed"
	else
		info "Installing Cargo"
		curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -y
	fi
}

zsh_setup() {
	figlet "Zsh"
	if [[ $SHELL != "/usr/bin/zsh" ]]; then
		info "Installing Zsh"
		yay -S --noconfirm --needed zsh
		info "Installing Oh-my-zsh"
		sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
		chsh -s $(which zsh)
		require_reboot=1
	else
		success "Zsh is already installed"
	fi
}

update_command_setup() {
	info "Installting the Update Command"
	chmod +x update.sh 
	mkdir -p ~/.local/bin
	touch ~/.local/bin/update
	cp update.sh ~/.local/bin/update
	chmod +x ~/.local/bin/update
}

executables(){
	mapfile -t files < <(ls)
	figlet "Execuatbales"
	for file in "${files[@]}";do
		if [[ $file != "setup.sh" ]];then
			chmod +x $file
		fi
	done
}

packages_installtion
yay_setup
rust_setup
update_command_setup
zsh_setup
executables

if [ $require_reboot -eq 1 ];then
	section "Rebooting"
	sudo reboot 
fi
