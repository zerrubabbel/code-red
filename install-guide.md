# Official Install Guide
- https://wiki.archlinux.org/title/Installation_guide

# Code-Red Install Recommendations

## Code-Red Assumptions

Code-Red assumes that you have already created install media, have verified the hash, and know how to boot from your install media.

## Getting Started

Code-Red will guide you through the *archisntall* script, but familiarity with the CLI install as outlined in the official Install Guide is highly encouraged and recommended.

**Initial Steps**
1. Boot from your Arch Linux Install Media
2. Verify connection to internet - *ping google.com*
3. If you need to establish a connection via wifi, use *iwctl*
- https://wiki.archlinux.org/title/Iwd
4. Update the pacman database - *pacman -Syy*
5. Verify your disc and partition scheme - *lsblk*
6. Adjust if necessary - *fdisk /dev/TARGET-DISC*
7. Proceed to *archinstall* when ready

## *archinstall*

Here are the Code-Red recommended configurations, as proceeding down the *archinstall* menu

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

**Enable pacman Parallel Downloads**
- edit pacman.conf: *nano /etc/pacman.conf*
- find: *#ParallelDownloads = 5*
- change it to: *ParallelDownloads = X* where X is the number of threads available to your CPU (often 12, 16, 20, or 24)
- save and exit (CTL + X), save buffer (yes), write file? (ENTER)

**Optimize pacman mirrors**
- *cp /etc/pacman.d/mirrorlist.bak /etc/pacman.d/mirrorlist*
(select one of the following commands, or edit syntax as needed)
- USA: *reflector --verbose --sort rate -l 50 -c 'United States' -p https --save /etc/pacman.d/mirrorlist*
- Germany: *reflector --verbose --sort rate -l 50 -c 'Germany' -p https --save /etc/pacman.d/mirrorlist*
- Japan: *reflector --verbose --sort rate -l 12 -c 'Japan' -p https --save /etc/pacman.d/mirrorlist*
- Brazil: *reflector --verbose --sort rate -l 10 -c 'Brazil' -p https --save /etc/pacman.d/mirrorlist*

**Install and set up Code-Red Packages**
- *pacman -S ufw btop fastfetch kitty*
- *systemctl enable ufw.service*

### Install your Desktop Environment
*select either KDE Plasma, Gnome, or both if desired*

KDE Plasma and Gnome are primary choices for easy Arch Linux setups, because installing either one makes many necessary configurations on your behalf.
You may choose other environments as stand alone options, but this will leave you with extra configurations to navigate on your own.
It's advisable to have backup desktop environments anyway, and for many reasons (bugs, bad updates, redundancy, context based workflow, etc),
so starting with either Plasma or Gnome stands to simply cut down on work.

#### KDE Plasma

KDE Plasma is a feature rich, and highly versatile desktop environment that has a Windows-familiar feel by default,
though it's highly capable of mimicing other familiar environments, or synthesizing a unique workflow.
Plasma can be prone to quirks or bugs. In the case that these are experienced, It's advisable to have a backup DE on hand.

- *pacman -S plasma*

Optional Plasma Software
- Dolphin: Plasma (qt) friendly file manager - *pacman -S dolphin*
- Spectacle: qt screenshot utility - *pacman -S spectacle*

#### Gnome

Gnome is a highly cohesive desktop environment which is partially alike to Mac OS, and partially unique. It focuses on encouraging effective workflow.
Gnome can be modified with 'extensions' to further customize workflow. Beware that extensions are prone to breakage following Gnome version updates.

- *pacman -S gnome*

Optional Gnome Software
- Gnome Tweaks: expanded Gnome settings - *pacman -S gnome-tweaks*
- Extension Manager: manages Gnome extensions easily - *flatpak install flathub com.mattjakeman.ExtensionManager*
File Managers
- Gnome comes with the 'nautilus' file manager.
- Nemo is a Gnome friendly (gtk) file manager - *pacman -S nemo*
- the Dolphin file manager mentioned above will work, but will pull several qt packages, and break Gnome cohesion - *pacman -S dolphin*

### Enable your Display Manager (login screen)

**If you installed KDE Plasma**
- *systemctl enable sddm.service*

**If you installed Gnome**
- *systemctl enable gdm.service*

**If you installed both KDE Plasma and Gnome**
- Use one of the above commands to enable gdm or sddm, but not both.
- Enable gdm if you want cohesion with Gnome.

### Install Backup Desktop Environments (optional)
*optional, but recommended to select and install at least one*

#### Cinnamon
Cinnamon is a relatively lightweight DE, and has a 'Windows 10' familiar feel by default, though is quite customizable.
