#!/bin/bash
clear

export DOTFILES="$HOME/Github/dotfiles"

Menu ()
{
    echo -e "\e[1;35m#####################################################\e[0m"
    echo -e "\e[1;35m##              \e[0mConfig My OS \e[91mS2            \e[35m##"
    echo -e "#####################################################\e[0m"
    echo
    echo -e "\e[93m[1] -->\e[0m Arch Linux"
    # echo -e "\e[93m[2] -->\e[0m Ubuntu"
    echo
    echo -n "Let's go! Choose your distro: "
    read option

    case $option in
        1) ArchLinux ;;
        # 2) Ubuntu ;;
        0) echo; echo "Ok! Let's go D:"; sleep 1; exit ;;
        *) echo; echo "Not an avaliable option! Try again!!"; sleep 1; echo; Menu ;;
    esac
}

ArchLinux ()
{
    echo
    echo -e "\e[1mNice! Initializing ArchLinux setup.\e[0m"
    sleep 1
    source $DOTFILES/archlinux/setup.sh
}

Ubuntu ()
{
    echo
    echo -e "\e[1mNice! Initializing Ubuntu setup.\e[0m"
    sleep 1
    source $DOTFILES/ubuntu/setup.sh
}

Menu