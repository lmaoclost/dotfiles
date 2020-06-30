#!/bin/bash
clear

purpleDots()
{
    echo -e "\e[1;35m::\e[0m \e[1m$1\e[0m"
}

yellowArrows()
{
    echo -e "\e[1;93m >>\e[0m \e[1m$1\e[0m"
}

## Ranking Mirrors
#######################
purpleDots "Installing Reflector and Ranking Mirrors"
sudo pacman -S --noconfirm reflector
reflector --verbose --latest 5 --sort rate --save /etc/pacman.d/mirrorlist
echo

## Preprocessing
################
yellowArrows "Installing base-devel and Git"
sudo pacman -S --noconfirm base-devel git
echo

## Changing keyboard layout to pt-br
#######################
purpleDots "Changing keyboard layout to PT-BR"
sudo echo "KEYMAP=br-abnt2" >> /etc/vconsole.conf
yellowArrows "Layout Configured"
echo

## Installing Kitty
#######################
yellowArrows "Installing Kitty"
sudo pacman -S --noconfirm kitty
echo

## Installing ZSH and setting up ZSH
###################################
yellowArrows "Installing Zsh"
sudo pacman -S --noconfirm zsh
echo

purpleDots "Setting Zsh as default.."
chsh -l /usr/bin/zsh
echo

## Installing Dracula Theme on Kitty
yellowArrows "Installing Dracula Theme on Kitty"
git clone https://github.com/dracula/kitty/archive/master.zip
cp dracula.conf ~/.config/kitty/
echo "include dracula.conf" >> ~/.config/kitty/kitty.conf
echo

## Installing Oh My ZSH
purpleDots "Installing Oh My ZSH"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
echo

## Installing Spaceship on Oh My ZSH
yellowArrows "Installing Spaceship on Oh My ZSH"
git clone https://github.com/denysdovhan/spaceship-prompt.git '$ZSH_CUSTOM/themes/spaceship-prompt'
ln -s '$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme' '$ZSH_CUSTOM/themes/spaceship.zsh-theme'
echo

## Installing ZInit
yellowArrows "Installing ZInit"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zinit/master/doc/install.sh)"
echo

## Setting the ~/.zshrc
yellowArrows "Copying .zshrc to ~/.zshrc.."
cp $DOTFILES/archlinux/zsh/.zshrc ~/.zshrc
echo

## Installing Go
purpleDots "Installing Go / Yay Pre Requisite"
sudo pacman -S --noconfirm go
echo

## Installing yay
################
yellowArrows "Yay"
git clone https://aur.archlinux.org/yay.git ~/.yay
cd ~/.yay
makepkg -si
cd ~/
echo

## Installing vscode
####################
purpleDots "Installing vscode.."
yay -S --noconfirm visual-studio-code-bin
echo

## Installing Firefox in pt-br
##############################
yellowArrows "Installing firefox"
sudo pacman -S --noconfirm firefox
echo

## Installing Firefox
#######################
purpleDots "Installing Firefox in Brazilian Portuguese.."
sudo pacman -S --noconfirm firefox-i18n-pt-br
echo

## Installing Chromium
##############################
yellowArrows "Installing Chromium"
sudo pacman -S --noconfirm chromium
echo

## Installing Fira Code
#######################
purpleDots "Installing Fira Code"
sudo pacman -S --noconfirm ttf-fira-code 
echo

## Installing qBitorrent
########################
yellowArrows "Installing qBittorrent.."
sudo pacman -S --noconfirm qbittorrent
echo

## Install VLC
##############
purpleDots "Installing VLC.."
sudo pacman -S --noconfirm vlc
echo

## Installing Ferdi
#######################
yellowArrows "Installing Ferdi"
yay -S --noconfirm ferdi-bin
echo

## Installing Ruby
#######################
purpleDots "Installing Ruby"
sudo pacman -S --noconfirm ruby
PATH="$PATH:$(ruby -e 'puts Gem.user_dir')/bin"
echo

## Installing NodeJS LTS
#######################
yellowArrows "Installing NodeJS LTS"
sudo pacman -S --noconfirm nodejs-lts-dubnium
echo

## Installing Rails
#######################
purpleDots "Installing Rails"
gem install rails
echo

## Installing Yarn
#######################
yellowArrows "Installing Yarn"
sudo pacman -S --noconfirm yarn
echo

## Installing 7Zip
#######################
purpleDots "Installing 7Zip"
yay -S --noconfirm p7zip-gui
echo

## Installing Discord
#######################
yellowArrows "Installing Discord"
sudo pacman -S --noconfirm discord
echo

## Installing Insomnia
#######################
purpleDots "Installing Insomnia"
yay -S --noconfirm insomnia
echo

## Installing PostgreSQL
yellowArrows "Installing PostgreSQL"
sudo pacman -S --noconfirm postgresql
echo

purpleDots "That's It :)"