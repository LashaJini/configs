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
#
# git config --global core.editor nvim
#
# if i3 dmenu does not show all the newly installed binaries delete cache:
# rm ~/.cache/dmenu_run

#alsa-utils \
#alsa-firwmare-loaders \

mkdir ~/ws

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
  ripgrep \
  snapd \
  curl

## nvim
# you may need to run :TSUpdate when copying the config
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

# https://github.com/ryanoasis/nerd-fonts/releases/tag/v3.2.1
curl -OL https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip
sudo unzip ./JetBrainsMono.zip -d /usr/share/fonts/JetBrainsMono
fc-cache -f -v
rm JetBrainsMono.zip
# fc-list

## starship

curl -sS https://starship.rs/install.sh | sh

curl https://raw.githubusercontent.com/LashaJini/configs/master/starship/starship2.toml >~/.config/starship.toml

## fish

sudo chsh -s /usr/bin/fish

## tmux

curl https://raw.githubusercontent.com/LashaJini/configs/master/tmux/.tmux.conf >~/.tmux.conf

## scripts

mkdir ~/ws/scripts -p

### tmux_session.sh

git clone git@github.com-lashajini:LashaJini/scripts.git ~/ws/scripts

sudo ln -sf /home/$USER/ws/scripts/tmux_session.sh /usr/local/bin/tmux_session.sh

### i3lock

sudo ln -sf /home/$USER/ws/scripts/i3lock.sh /usr/local/bin/lock.sh

### scrn

sudo ln -sf /home/$USER/ws/scripts/scrn.sh /usr/local/bin/scrn.sh

### jq_curl

sudo ln -sf /home/$USER/ws/scripts/jq_curl.sh /usr/local/bin/jq_curl

## poetry

curl -sSL https://install.python-poetry.org | python3 -
poetry completions fish >~/.config/fish/completions/poetry.fish

## go & gvm
sudo apt-get install curl git mercurial make binutils bison gcc build-essential
curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish

# bash
# bash < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)
# source $HOME/.gvm/scripts/gvm
# gvm install go1.4
# gvm use go1.4

omf install https://github.com/JGAntunes/fish-gvm
omf install https://github.com/edc/bass

gvm install go1.4 -B
gvm use go1.4
export GOROOT_BOOTSTRAP=$GOROOT
gvm install go1.17.13
gvm use go1.17.13
export GOROOT_BOOTSTRAP=$GOROOT
gvm install go1.20
gvm use go1.20

## nvm
omf install nvm
# nvm alias default <version>
# nvm use default

## lazygit
go install github.com/jesseduffield/lazygit@latest

## docker
### Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

### Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" |
  sudo tee /etc/apt/sources.list.d/docker.list >/dev/null
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

sudo groupadd docker
# relog
sudo usermod -aG docker $USER
