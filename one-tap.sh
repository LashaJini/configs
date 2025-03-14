#!/bin/bash

## OLD

# We want
# vi keybindings in browser
# nvm

sudo usermod -aG sudo $USER

sudo apt-get install -y \
	terminator \
	i3 \
	i3blocks \
	screenfetch \
	htop \
	tmux \
	compton \
	feh \
	git \
	fzf \
	fd-find \
	jq \
	rbenv \
	pavucontrol \
	alsa-utils \
	alsa-firwmare-loaders \
	rsync \
  brightnessctl \
  nautilus \
  py3status \
  fonts-font-awesome \
	curl

# CLONE IT SILLY

## i3

mkdir ~/.config/i3 -p

curl https://raw.githubusercontent.com/LashaJini/configs/master/i3/i3.config > ~/.config/i3/config
curl https://raw.githubusercontent.com/LashaJini/configs/master/i3/i3status.conf > ~/.config/i3/i3status.conf

## nvim

mkdir ~/.config/nvim/plugged -p

#curl https://raw.githubusercontent.com/LashaJini/configs/master/nvim/init.vim > ~/.config/nvim/init.vim
#
#curl https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim > ~/.config/nvim/plugged/plug.vim

## fish

#echo 'deb http://download.opensuse.org/repositories/shells:/fish:/release:/3/Debian_9.0/ /' | sudo tee /etc/apt/sources.list.d/shells:fish:release:3.list
#curl -fsSL https://download.opensuse.org/repositories/shells:fish:release:3/Debian_9.0/Release.key | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/shells_fish_release_3.gpg > /dev/null
#sudo apt update -y
#sudo apt install fish -y

mkdir ~/.config/fish -p

#rm -rf /home/$USER/.local/share/omf
curl https://raw.githubusercontent.com/LashaJini/configs/master/fish/config.fish > ~/.config/fish/config.fish

# requires logout/login
sudo chsh -s /usr/bin/fish

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

# Misc

#- https://www.kali.org/docs/general-use/enabling-root/
#- https://confluence.jaytaala.com/display/TKB/My+Manjaro+i3+setup
#- https://forums.gentoo.org/viewtopic-p-8667066.html?sid=7143695658a5406b75f89500bc3346e8
#- Add `$USER    ALL=(ALL) NOPASSWD: ALL` at the end of the `/etc/sudoers`
#
#- `dmesg`
#- `/var/log/messages`
#- sound problems. Look for: hda, sound, audio

## nvm

```
omf install nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash

nvm install <version>
nvm alias default <version>
nvm use default
```
