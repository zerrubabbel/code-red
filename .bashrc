# ____    _    ____  _   _       ____   ____ 
#| __ )  / \  / ___|| | | |     |  _ \ / ___|
#|  _ \ / _ \ \___ \| |_| |_____| |_) | |    
#| |_) / ___ \ ___) |  _  |_____|  _ <| |___ 
#|____/_/   \_\____/|_| |_|     |_| \_\\____|

## ~/.bashrc
## For Arch Linux

[[ $- != *i* ]] && return

alias ls='ls -lah --color=auto'
alias grep='grep --color=auto -i'
PS1='[\u@\h \W]\$ '

## == SYSTEM BASICS ==

alias "arch-help"="cat ~/.help"
alias "cl"="clear && header"
#alias "nap"="shutdown +30"

## == PACMAN ==

alias "arch-update"="sudo pacman -Syu && echo 'TO UPDATE FLATPAKS, RUN: flatpak update' && echo 'TO UPDATE AUR PACKAGES RUN: yay'"
alias "arch-install"="sudo pacman -S"
alias "arch-remove"="sudo pacman -Rns"
alias "remove-orphans"="sudo pacman -Qdtq | sudo pacman -Rns -"

## Mirrors

alias "mirrors-bak"="sudo cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.bak"
alias "mirrors-restore"="sudo cp /etc/pacman.d/mirrorlist.bak /etc/pacman.d/mirrorlist"
alias "mirrors"="sudo reflector --verbose --sort rate -l 50 -c 'United States' -p https --save /etc/pacman.d/mirrorlist"

## File Management

alias "cp"="cp -i"
alias "mv"="mv -i"
alias "rm"='echo "Are you sure you want to remove files? If so use /bin/rm"'
alias "rmdir"='echo "Are you sure you want to remove this direcorty? If so use /bin/rmdir"'
alias "c"="clear"

## Navigation

alias ".."="cd .."
alias "..."="cd ../.."
alias "~"="cd ~"
alias "home"="cd ~"

## == SAFETY ==

alias "firewall-status"="sudo ufw status"
alias "firewall-on"="sudo ufw enable"
alias "firewall-off"="sudo ufw disable"
alias "firewall-default-on"="sudo systemctl enable ufw.service"
alias "firewall-default-off"="sudo systemctl disable ufw.service"

## == GRUB / MKINITCPIO ==

alias "grub-update"="sudo grub-mkconfig -o /boot/grub/grub.cfg"
alias "mkinit"="sudo mkinitcpio -P"

## == HEADER ==
alias "header"="fastfetch"
header
