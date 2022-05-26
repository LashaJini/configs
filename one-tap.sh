#!/bin/bash

# We want
# vi keybindings in browser
# nvm

sudo usermod -aG sudo $USER

sudo apt-get install -y \
	terminator \
	i3 \
	screenfetch \
	htop \
	neovim \
	tmux \
	compton \
	feh \
	git \
	fzf \
	fd-find \
	jq \
	rbenv \
	curl

# CLONE IT SILLY

## i3

mkdir ~/.config/i3 -p

curl https://raw.githubusercontent.com/LashaJini/configs/master/i3/i3.config > ~/.config/i3/i3.config
curl https://raw.githubusercontent.com/LashaJini/configs/master/i3/i3status.conf > ~/.config/i3/i3status.conf

## nvim

mkdir ~/.config/nvim/plugged -p

curl https://raw.githubusercontent.com/LashaJini/configs/master/nvim/init.vim > ~/.config/nvim/init.vim

curl https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim > ~/.config/nvim/plugged/plug.vim

## fish

echo 'deb http://download.opensuse.org/repositories/shells:/fish:/release:/3/Debian_9.0/ /' | sudo tee /etc/apt/sources.list.d/shells:fish:release:3.list
curl -fsSL https://download.opensuse.org/repositories/shells:fish:release:3/Debian_9.0/Release.key | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/shells_fish_release_3.gpg > /dev/null
sudo apt update -y
sudo apt install fish -y

mkdir ~/.config/fish -p

rm -rf /home/$USER/.local/share/omf
curl https://raw.githubusercontent.com/LashaJini/configs/master/fish/config.fish > ~/.config/fish/config.fish

# curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish

# omf install nvm

## starship

curl -sS https://starship.rs/install.sh | sh

curl https://raw.githubusercontent.com/LashaJini/configs/master/starship/starship.toml > ~/.config/starship.yml

## tmux

curl https://raw.githubusercontent.com/LashaJini/configs/master/tmux/.tmux.conf > ~/.tmux.conf

## scripts

mkdir ~/ws/scripts -p

### tmux_sessoin.sh

curl https://raw.githubusercontent.com/LashaJini/scripts/master/tmux_session.sh > ~/ws/scripts/tmux_session.sh
chmod +x ~/ws/scripts/tmux_session.sh

sudo ln -sf /home/$USER/ws/scripts/tmux_session.sh /usr/local/bin/tmux_session.sh

### i3lock

curl https://raw.githubusercontent.com/LashaJini/scripts/master/i3lock.sh > ~/ws/scripts/i3lock.sh
chmod +x ~/ws/scripts/i3lock.sh

sudo ln -sf /home/$USER/ws/scripts/i3lock.sh /usr/local/bin/lock.sh

### scrn

curl https://raw.githubusercontent.com/LashaJini/scripts/master/scrn.sh > ~/ws/scripts/scrn.sh
chmod +x ~/ws/scripts/scrn.sh

sudo ln -sf /home/$USER/ws/scripts/scrn.sh /usr/local/bin/scrn.sh

### jq_curl

curl https://raw.githubusercontent.com/LashaJini/scripts/master/jq_curl.sh > ~/ws/scripts/jq_curl.sh
chmod +x ~/ws/scripts/jq_curl.sh

sudo ln -sf /home/$USER/ws/scripts/jq_curl.sh /usr/local/bin/jq_curl
