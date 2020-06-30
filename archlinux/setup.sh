#!/bin/bash
clear

yellowArrows()
{
    echo -e "\e[1;93m >>\e[0m \e[1m$1\e[0m"
}

## Updating System
################
yellowArrows "Updating the System"
pacman -Syu
echo

## Generating the Locale
################
yellowArrows "Generating the Locale"
sudo locale-gen
echo

## Ranking Mirrors
#######################
yellowArrows "Installing Reflector and Ranking Mirrors"
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
yellowArrows "Changing keyboard layout to PT-BR"
sudo echo "KEYMAP=br-abnt2" >> /etc/vconsole.conf
yellowArrows "Layout Configured"
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
yellowArrows "Installing vscode.."
yay -S --noconfirm visual-studio-code-bin
echo

## Installing Firefox in pt-br
##############################
yellowArrows "Installing firefox"
sudo pacman -S --noconfirm firefox
echo

## Installing Firefox
#######################
yellowArrows "Installing Firefox in Brazilian Portuguese.."
sudo pacman -S --noconfirm firefox-i18n-pt-br
echo

## Installing Chromium
##############################
yellowArrows "Installing Chromium"
sudo pacman -S --noconfirm chromium
echo

## Installing Fira Code
#######################
yellowArrows "Installing Fira Code"
sudo pacman -S --noconfirm ttf-fira-code 
echo

## Installing qBitorrent
########################
yellowArrows "Installing qBittorrent.."
sudo pacman -S --noconfirm qbittorrent
echo

## Install VLC
##############
yellowArrows "Installing VLC.."
sudo pacman -S --noconfirm vlc
echo

## Installing Ferdi
#######################
yellowArrows "Installing Ferdi"
yay -S --noconfirm ferdi-bin
echo

## Installing Ruby
#######################
yellowArrows "Installing Ruby"
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
exec $SHELL

git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bashrc
exec $SHELL

rbenv install 2.7.1
rbenv global 2.7.1
echo

## Installing NodeJS LTS
#######################
yellowArrows "Installing NVM and NodeJS LTS"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
nvm install --lts
echo

## Installing Yarn
#######################
yellowArrows "Installing Yarn"
sudo pacman -S --noconfirm yarn
echo

## Installing 7Zip
#######################
yellowArrows "Installing 7Zip"
yay -S --noconfirm p7zip-gui
echo

## Installing Discord
#######################
yellowArrows "Installing Discord"
sudo pacman -S --noconfirm discord
echo

## Installing Insomnia
#######################
yellowArrows "Installing Insomnia"
yay -S --noconfirm insomnia
echo

## Installing PostgreSQL
yellowArrows "Installing PostgreSQL"
sudo pacman -S --noconfirm postgresql
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

yellowArrows "Setting Zsh as default.."
chsh -l /usr/bin/zsh
echo

## Installing Dracula Theme on Kitty
yellowArrows "Installing Dracula Theme on Kitty"
wget https://raw.githubusercontent.com/dracula/kitty/master/dracula.conf
cp dracula.conf ~/.config/kitty/
echo "include dracula.conf" >> ~/.config/kitty/kitty.conf
echo

## Installing Oh My ZSH
yellowArrows "Installing Oh My ZSH"
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

yellowArrows "That's It :)"