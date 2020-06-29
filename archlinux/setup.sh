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

## Preprocessing
################
purpleDots "General Instalations"
yellowArrows "Instaling base-devel and Git.."
sudo pacman -S --noconfirm base-devel git
echo

## Changing keyboard layout to pt-br
#######################
purpleDots "Changing keyboard layout to PT-BR"
echo "KEYMAP=br-abnt2" >> /etc/vconsole.conf
yellowArrows "Layout Configured"
echo

## Instaling Kitty
#######################
yellowArrows "Instaling Kitty"
sudo pacman -S --noconfirm kitty
echo

## Instaling ZSH and setting up ZSH
###################################
yellowArrows "Instaling Zsh"
sudo pacman -S --noconfirm zsh
echo

yellowArrows "Copying .zshrc to ~/.zshrc.."
cp $DOTFILES/archlinux/zsh/.zshrc ~/.zshrc
echo

purpleDots "Setting Zsh as default.."
chsh -l /usr/bin/zsh
echo

## Instaling Dracula Theme on Kitty
yellowArrows "Instaling Dracula Theme on Kitty"
git clone https://github.com/dracula/kitty/archive/master.zip
cp dracula.conf ~/.config/kitty/
echo "include dracula.conf" >> ~/.config/kitty/kitty.conf
echo

## Instaling Spaceship on Oh My ZSH
purpleDots "Instaling Spaceship on Oh My ZSH"
git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt"
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"
echo

## Instaling ZInit
yellowArrows "Instaling ZInit"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zinit/master/doc/install.sh)"
echo

## Aditional Configuration
purpleDots "Additional Configuration"
echo ~/.zshrc >> 'SPACESHIP_PROMPT_ORDER=('
echo ~/.zshrc >> 'user          # Username section'
echo ~/.zshrc >> 'dir           # Current directory section'
echo ~/.zshrc >> 'host          # Hostname section'
echo ~/.zshrc >> 'git           # Git section (git_branch + git_status)'
echo ~/.zshrc >> 'hg            # Mercurial section (hg_branch  + hg_status)'
echo ~/.zshrc >> 'exec_time     # Execution time'
echo ~/.zshrc >> 'line_sep      # Line break'
echo ~/.zshrc >> 'vi_mode       # Vi-mode indicator'
echo ~/.zshrc >> 'jobs          # Background jobs indicator'
echo ~/.zshrc >> 'exit_code     # Exit code section'
echo ~/.zshrc >> 'char          # Prompt character'
echo ~/.zshrc >> ')'
echo ~/.zshrc >> 'SPACESHIP_USER_SHOW=always'
echo ~/.zshrc >> 'SPACESHIP_PROMPT_ADD_NEWLINE=false'
echo ~/.zshrc >> 'SPACESHIP_CHAR_SYMBOL="❯"'
echo ~/.zshrc >> 'SPACESHIP_CHAR_SUFFIX=" "'
sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zinit/master/doc/install.sh)"
echo ~/.zshrc >> 'zinit light zdharma/fast-syntax-highlighting'
echo ~/.zshrc >> 'zinit light zsh-users/zsh-autosuggestions'
echo ~/.zshrc >> 'zinit light zsh-users/zsh-completions'

## Intalling yay
################
purpleDots "Yay"
git clone https://aur.archlinux.org/yay.git ~/.yay
cd ~/.yay
makepkg -si 
cd ~/
echo

## Instaling vscode
####################
purpleDots "Instaling vscode.."
yay -S --noconfirm visual-studio-code-bin
echo

## Instaling Firefox in pt-br
##############################
yellowArrows "Instaling firefox"
sudo pacman -S --noconfirm firefox
echo

## Instaling Firefox
#######################
purpleDots "Instaling Firefox in Brazilian Portuguese.."
sudo pacman -S --noconfirm firefox-i18n-pt-br
echo

## Instaling Chromium
##############################
yellowArrows "Instaling Chromium"
sudo pacman -S --noconfirm chromium
echo

## Instaling Fira Code
#######################
purpleDots "Instaling Fira Code"
sudo pacman -S --noconfirm ttf-fira-code 
echo

## Instaling qBitorrent
########################
yellowArrows "Instaling qBittorrent.."
sudo pacman -S --noconfirm qbittorrent
echo

## Install VLC
##############
purpleDots "Instaling VLC.."
sudo pacman -S --noconfirm vlc
echo

## Instaling Ferdi
#######################
yellowArrows "Instaling Ferdi"
yay -S --noconfirm ferdi-bin
echo

## Instaling Ruby
#######################
purpleDots "Instaling Ruby"
sudo pacman -S --noconfirm ruby
echo "PATH="$PATH:$(ruby -e 'puts Gem.user_dir')/bin"" >> ~/.profile
echo

## Instaling NodeJS LTS
#######################
yellowArrows "Instaling NodeJS LTS"
sudo pacman -S --noconfirm nodejs-lts-dubnium
echo

## Instaling Rails
#######################
purpleDots "Instaling Rails"
gem install rails
echo

## Instaling Yarn
#######################
yellowArrows "Instaling Yarn"
sudo pacman -S --noconfirm yarn
echo

## Instaling 7Zip
#######################
purpleDots "Instaling 7Zip"
yay -S --noconfirm p7zip-gui
echo

## Instaling 7Zip
#######################
yellowArrows "Instaling Discord"
sudo pacman -S --noconfirm discord
echo

## Instaling Insomnia
#######################
purpleDots "Instaling Insomnia"
yay -S --noconfirm insomnia
echo

## Instaling PostgreSQL
yellowArrows "Instaling PostgreSQL"
sudo pacman -S --noconfirm postgresql