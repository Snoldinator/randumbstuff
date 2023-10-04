#!/bin/bash

# Update packages
echo "########## Updating Packages ##########"
sudo apt update && sudo apt upgrade -y
echo "########## Packages Updated ##########"

# Install Tailscale
echo "########## Installing Tailscale ##########"
curl -fsSL https://pkgs.tailscale.com/stable/ubuntu/jammy.noarmor.gpg | sudo tee /usr/share/keyrings/tailscale-archive-keyring.gpg >/dev/null
curl -fsSL https://pkgs.tailscale.com/stable/ubuntu/jammy.tailscale-keyring.list | sudo tee /etc/apt/sources.list.d/tailscale.list
sudo apt update && sudo apt install tailscale -y
sudo tailscale up
echo "########## Tailscale Installed ##########"

# Install OhMyZsh
echo "########## Installing OhMyZsh ##########"
sudo apt update && sudo apt install zsh fonts-powerline -y
chsh -s /usr/bin/zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
exit
echo "########## OhMyZsh Installed ##########"

# Install Powerlevel10k
echo "########## Installing Powerlevel10k ##########"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="powerlevel10k\/powerlevel10k"/g' ~/.zshrc
git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
sed -i 's/plugins=(git)/plugins=(git zsh-autosuggestions zsh-syntax-highlighting)/g' ~/.zshrc
source ~/.zshrc
echo "########## Powerlevel10k Installed ##########"
