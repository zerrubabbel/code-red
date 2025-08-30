# Official Install Guide
- https://wiki.archlinux.org/title/Installation_guide

# Code-Red Install Recommendations

## Code-Red Assumptions

Code-Red assumes that you have already created install media, have verified the hash, and know how to boot from your install media.

## Getting Started

Code-Red will guide you through the `archisntall` script, but familiarity with the CLI install as outlined in the official Install Guide is highly encouraged and recommended.

### Initial Steps

1. Boot from your Arch Linux Install Media
2. Verify connection to internet - `ping google.com`
3. If you need to establish a connection via wifi, use `iwctl`
- https://wiki.archlinux.org/title/Iwd
4. Update the pacman database - `pacman -Syy`
5. Verify your disc and partition scheme - `lsblk`
- Navigate this step carefully to avoid accidentally harming other hard drives and their contents
6. Adjust if necessary - `fdisk /dev/TARGET-DISC`
7. Proceed to `archinstall` when ready

### `archinstall`

Here are the Code-Red recommended configurations, as proceeding down the `archinstall` menu

- Archinstall language: user preference
- Locales: user specified
- Mirrors: default setting
- Disc configuration: 'Best Effort' partitioning on desired target drive
- Disc encryption: enable if on a laptop. use unique password.
- Filesystem: ext4
- Bootloader: Grub
- Unified kernel images: default setting
- Swap: enabled (zram)
- Hostname: 'archlinux' or user specified
- Root password: user specified
- User account: user specified
- Profile: Xorg
- Graphics drivers: 'All open-source' unless using an Nvidia graphics card, in which case select 'Nvidia (proprietary)'
- Audio: Pipewire
- Kernels: defualt linux kernel
- Network configuration: NetworkManager enabled
- Additional packages: nano reflector
- Optional repositories: enable Multilib
- Timezone: user specified
- Automatic time sync (NTP): recommended

Double and triple check configurations

Proceed with installation

When the install script finishes, it will ask you if you want to chroot into your new install. Select 'Yes'.

## chroot steps

### Optimize pacman

**Enable pacman Parallel Downloads**
- edit pacman.conf: `nano /etc/pacman.conf`
- find: `#ParallelDownloads = 5`
- change it to: `ParallelDownloads = X` where X is the number of threads available to your CPU (often 12, 16, 20, or 24)
- save and exit (CTL + X), save buffer (yes), write file? (ENTER)

**Optimize pacman mirrors**
- `cp /etc/pacman.d/mirrorlist.bak /etc/pacman.d/mirrorlist`

(select one of the following commands, or edit syntax as needed)
- USA: `reflector --verbose --sort rate -l 50 -c 'United States' -p https --save /etc/pacman.d/mirrorlist`
- Germany: `reflector --verbose --sort rate -l 50 -c 'Germany' -p https --save /etc/pacman.d/mirrorlist`
- Japan: `reflector --verbose --sort rate -l 12 -c 'Japan' -p https --save /etc/pacman.d/mirrorlist`
- Brazil: `reflector --verbose --sort rate -l 10 -c 'Brazil' -p https --save /etc/pacman.d/mirrorlist`

**Install and set up Code-Red Packages**
- `pacman -S ufw btop fastfetch kitty`
- `systemctl enable ufw.service`

### Install your Desktop Environment
*select either KDE Plasma, Gnome. Or select both if desired*

KDE Plasma and Gnome are primary choices for easy Arch Linux setups, because installing either one makes many necessary configurations on your behalf.
You may choose other environments as stand alone options, but this will leave you with extra configurations to navigate on your own.
It's advisable to have backup desktop environments anyway, and for many reasons (bugs, bad updates, redundancy, context based workflow, etc),
so starting with either Plasma or Gnome stands to simply cut down on work.

#### KDE Plasma

KDE Plasma is a feature rich, and highly versatile desktop environment that has a Windows-familiar feel by default,
though it's highly capable of mimicing other familiar environments, or synthesizing a unique workflow.
Plasma can be prone to quirks or bugs. In the case that these are experienced, It's advisable to have a backup DE on hand.

- `pacman -S plasma`

Optional Plasma Software
- Dolphin: Plasma (qt) friendly file manager - `pacman -S dolphin`
- Spectacle: qt screenshot utility - `pacman -S spectacle`

#### Gnome

Gnome is a highly cohesive desktop environment which partially resembles a Mac OS workflow, but also offers many of its own unique philosophies. It focuses on encouraging effective workflow.
Gnome can be modified with 'extensions' to further customize workflow. Beware that extensions are prone to breakage following Gnome version updates.

- `pacman -S gnome`

Optional Gnome Software
- Gnome Tweaks: expanded Gnome settings - `pacman -S gnome-tweaks`
- Extension Manager: manages Gnome extensions easily - `flatpak install flathub com.mattjakeman.ExtensionManager`
File Managers
- Gnome comes with the 'nautilus' file manager.
- Nemo is a Gnome friendly (gtk) file manager - `pacman -S nemo`
- the Dolphin file manager mentioned above will work, but will pull several qt packages, and break Gnome cohesion - `pacman -S dolphin`

### Enable your Display Manager (login screen)

**If you installed KDE Plasma**
- `systemctl enable sddm.service`

**If you installed Gnome**
- `systemctl enable gdm.service`

**If you installed both KDE Plasma and Gnome**
- Use one of the above commands to enable gdm or sddm, but not both.
- Enable gdm if you want cohesion with Gnome.

### Install Backup Desktop Environments (optional)
*optional, but recommended to select and install at least one*

#### Cinnamon
Cinnamon is a relatively lightweight DE, and has a 'Windows 10' familiar feel by default, though is quite customizable.
- `pacman -S cinnamon`

#### COSMIC (alpha)
Cosmic is an alpha stage DE in development, but still shows high capability and high promise. It's default feel is alike to Mac OS, but is both customizable
and future facing. It features an integrated yet togglable tiling window manager.
- `pacman -S cosmic`

#### xfce
xfce is a very lightweight DE, but still has high potential for customization with a little work. Choose xfce if you want a simple, grounded, "Windows XP" or earlier feel.
- `pacman -S xfce4`

#### Other options

There are many other options for graphical environments. Though they fall outside the scope of Code-Red, many due to highly involved configuration, lesser gaming compatibility,
or for some, lower development support.

**Recommendations For Further Exploration**

This is a set of options meant to give a preview of what is available in the greater Linux ecosystem

Mate, Budgie, LXDE / LXQT, Openbox, AwesomeWM, Window Maker, Hyprland, BSPWM, i3, Qtile, Xmonad

### Install Remaining Initial Software

#### Protonup-QT

Protonup-QT offers expensions to the gaming compatibility layer 'Proton', including Proton-GE, which often offers smoother gaming experiences than Proton alone.

- `flatpak install flathub net.davidotek.pupgui2`

#### yay
*optional, but recommended*

yay is an Arch User Repository Helper (AUR - community maintained software library), and can give you easy access to a wider selection of software

- `sudo pacman -Syu`
- `sudo pacman -S --needed base-devel git`
- `git clone https://aur.archlinux.org/yay.git`
- `cd yay`
- `makepkg -si`
- `yay --version`
- `cd`

#### Miscellaneous 

Browser (Brave recommended)
- `flatpak install flathub com.brave.Browser`

Steam
- `pacman -S steam`

Bluez (bluetooth utility)
- `pacman -S bluez`
- `systemctl enable bluetooth.service`

ntfs-3g (Windows filesystem utility)
- `pacman -S ntfs-3g`

noto-fonts-cjk (expanded font support)
- `pacman -S noto-fonts-cjk`

vlc (media player)
- `pacman -S vlc`

Obsidian (markdown notes manager)
- `pacman -S obsidian`

## Complete the Installation

When your chroot setup, configurations, and installations are complete, exit the chroot environment
- `exit`

Then, reboot your computer
- `reboot`
- remove install media

**Congratulations! At this point, you should have a functional Arch Linux installation!**
- If necessary, stop at your BIOS and set your boot priorities.

# First Boot

Sometimes, not all software is quite oriented on first boot. It's recommended to run a system update, and proceed to 2nd boot

Open kitty
- `sudo pacman -Syu`
- `reboot`

## 2nd Boot

At this point, you're much more free to navigate as you wish... Here are a few things to consider

Verify that your firewall is working
- `sudo ufw status`

Open your web browser, configure, and populate your bookmarked websites

Configure your Desktop Environment
- Set a desktop wallpaper: (100+ options at https://imgur.com/a/desktop-wallpeppers-HnHG38H)
- Explore your DEs settings menu to set custom icons, cursors, power settings, blue light protection, and more
- Arrange your taskbar, dock, or the widgets they contain

Download your games, and explore other gaming options
- Use Protonup-QT to download the latest version of Proton-GE (find 'compatibility' in steam game settings to set preferred proton version)
- Lutris (game and launcher compatibility and organization)
- ProtonDB (website which reports the Linux compatibility state of games)

**Download the config files found in this repository** (each file has a header with its name, and the path where that file should be stored)
- .bashrc (contains useful terminal shortcuts, terminal safety features)
- .help.md (as long as the provided .bashrc file is used, you can type 'arch-help' for useful tips when you get stuck)
- kitty.conf (Makes your terminal look good)
- fastfetch (provides a good looking fastfetch config, and a picture that can be used)

Consider backup and redundancy strategies
- Timeshift is a utility that can automatically create and manage system backups
- Consider installing a 2nd kernel: linux-lts kernel is recommended
- Consider storing important files on a separate hard drive

Visit the 'General Recommendations' Arch Wiki Page
- https://wiki.archlinux.org/title/General_recommendations

## Ongoing Maintenance

`sudo pacman -Syu` (or `arch-update` with the provided .bashrc file)
- Arch should be updated regularly. Once per week is optimal.
- Wednesday and Thursday are generally the safest days for avoiding bad package updates, as determined by most development cycles.
- `journalctl, dmesg, --verbose` commands, log files, and launching applications from the terminal are useful ways to get troubleshooting insight.
- To launch an application from the termainal, simply type its name as a command, and execute.

# Further Resources

- The Arch Wiki: https://wiki.archlinux.org/title/Main_page
- The official Arch Forums: https://bbs.archlinux.org/
- The Arch Linux Subreddit: https://www.reddit.com/r/archlinux/

It's helpful to spend time in Arch communities, or watching Arch channel hosts to acquaint yourself with what's possible, and what you may like.

## The system is now completely yours!

Take care of it, and it will take care of you! Please enjoy Arch Linux!

# Rationale for Code-Red configurations

## archinstall rationale

Mirrors as default: Reflector will optimize pacman mirrors after initial installation

Disc configuration as 'Best Effort': It's a simple, low effort, yet suitable for most partition scheme

Disc Encryption: Cold state encryption can keep your data safe, especially on a device as vulnerable and easy to steal as a laptop.

Filesystem as ext4: It's the current gold standard in terms of reliability and compatibility. 'btrfs' however is an excellent alternative that provides
potential for automatic backup images. ext4 however, saves trouble with FS kernel modules, and post update compatibility issue.

Bootloader as Grub: Common and well supported. Systemdboot is also an excellent bootloader, but the decision to encourage Grub is for parity with the included .bashrc file

Swap enabled on zram: Low effort that saves the need to setup a dedicated swap partition, and tax on hard drive health, but still provides swap benefits

Profile as Xorg: Saves potential install complications, and allows for finer configuration control where it counts

Kernel as linux: Saves potential install complications, and adding a kernel post hoc is relatively easy

NetworkManager enabled: Necessary for compatibility with Plasma or Gnome

Additional Packages (nano and reflector): Small workload on potentially slower mirrors, but sets up for a more streamlined chroot session

Optional repositories (multilib): Extra access to software, better for gaming

Why does Code-Red use the archinstall script?
- Current software politics create a sense of urgency around alternate OS availability. The classic CLI install is still highly respected and recommended, even if explored in free time, but archinstall provides more immediate accessibility

## chroot rationale

Parallel Downloads: Decreases time needed to complete an update

Why ufw, btop, fastfetch, and kitty?
- ufw: simple but powerful firewall utility
- btop: minimal yet powerful system monitor and task manager
- fastfetch: fast information at a glance, and looks good in the terminal
- kitty: powerful, modern, and GPU accelerated terminal emulator, easy to configure, synergizes with fastfetch

Why Plasma and Gnome?
- Both offer subtle but powerful extra configuration solutions that other graphical environments don't
- Plasma offers a workflow paradigm that Windows users would find familiar, but is powerful enough to be it's own workflow if desired
- Gnome offers a focus on effective work flow, and some people benefit from using a paradigm that contrasts from that of Windows

Why Install Extra DEs?
- Redundancy. Bad updates aren't frequent, but they do happen, and a backup can be a real life saver.
- Exploration. The Linux ecosystem has so much to offer, you may find something you really like, even if it's not obvious.

## Other rationales

Why not include other config files?
- Some config files may be added, though Code-Red aims to strike a balance between accessible and powerful.

What is the mission of Code-Red
- To provide a 'sensible decision' configuration guide for new users, particularly gamers, who might not yet have a more full view of the Linux ecosystem (and hence the rationale section)

Will Code-Red become a Linux Distribution?
- No. There are plenty of Distributions each with their own goals and purposes. Consider the goal of Code-Red to be a streamlined on-ramp for Arch Linux.
