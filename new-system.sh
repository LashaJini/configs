#!/bin/bash

# gen new ssh key
# ssh-keygen -t ed25519 -C "lasha.jini@gmail.com"
# add ssh key to ssh-agent
# eval "$(ssh-agent -s)"
# ssh-add ~/.ssh/<name>
#
# ~/.ssh/config
# Host github.com-lashajini
#         Hostname github.com
#         IdentityFile=/home/jini/.ssh/<name>
#
# Add `$USER    ALL=(ALL) NOPASSWD: ALL` at the end of the `/etc/sudoers`

#alsa-utils \
#alsa-firwmare-loaders \

sudo apt-get install -y \
  alacritty \
  i3 \
  screenfetch \
  htop \
  tmux \
  compton \
  picom \
  feh \
  git \
  fzf \
  fd-find \
  jq \
  pavucontrol \
  rsync \
  brightnessctl \
  nautilus \
  py3status \
  fonts-font-awesome \
  curl

## nvim
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage

sudo mkdir -p /opt/nvim
sudo mv nvim.appimage /opt/nvim/nvim

# don't forget to update $PATH
git clone https://github.com/LazyVim/starter ~/.config/nvim
rm -rf ~/.config/nvim/.git
cp -r nvim/* ~/.configs/nvim/

## i3wm

mkdir ~/.config/i3 -p

curl https://raw.githubusercontent.com/LashaJini/configs/master/i3/i3.config >~/.config/i3/config
curl https://raw.githubusercontent.com/LashaJini/configs/master/i3/i3status.conf >~/.config/i3/i3status.conf

## alacritty
mkdir ~/.config/alacritty
sudo apt-get install alacritty
cp ./alacritty.yml ~/.config/alacritty/
# run and choose alacritty
# sudo update-alternatives --config x-terminal-emulator
sudo apt-get install picom # for terminal transparency

wget https://download.jetbrains.com/fonts/JetBrainsMono-2.304.zip
sudo unzip ./JetBrainsMono-2.304.zip -d /usr/share/fonts/JetBrainsMono
fc-cache -f -v
rm JetBrainsMono-2.303.zip

## starship

curl -sS https://starship.rs/install.sh | sh

curl https://raw.githubusercontent.com/LashaJini/configs/master/starship/starship.toml >~/.config/starship.yml

## fish

sudo chsh -s /usr/bin/fish

## tmux

curl https://raw.githubusercontent.com/LashaJini/configs/master/tmux/.tmux.conf >~/.tmux.conf

## scripts

mkdir ~/ws/scripts -p

### tmux_sessoin.sh

curl https://raw.githubusercontent.com/LashaJini/scripts/master/tmux_session.sh >~/ws/scripts/tmux_session.sh
chmod +x ~/ws/scripts/tmux_session.sh

sudo ln -sf /home/$USER/ws/scripts/tmux_session.sh /usr/local/bin/tmux_session.sh

### i3lock

curl https://raw.githubusercontent.com/LashaJini/scripts/master/i3lock.sh >~/ws/scripts/i3lock.sh
chmod +x ~/ws/scripts/i3lock.sh

sudo ln -sf /home/$USER/ws/scripts/i3lock.sh /usr/local/bin/lock.sh

### scrn

curl https://raw.githubusercontent.com/LashaJini/scripts/master/scrn.sh >~/ws/scripts/scrn.sh
chmod +x ~/ws/scripts/scrn.sh

sudo ln -sf /home/$USER/ws/scripts/scrn.sh /usr/local/bin/scrn.sh

### jq_curl

curl https://raw.githubusercontent.com/LashaJini/scripts/master/jq_curl.sh >~/ws/scripts/jq_curl.sh
chmod +x ~/ws/scripts/jq_curl.sh

sudo ln -sf /home/$USER/ws/scripts/jq_curl.sh /usr/local/bin/jq_curl
