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
- Swap: enabled (zram)
- Bootloader: Grub
- Unified kernel images: default setting
- Root password: user specified
- User account: user specified
- Profile: X11 / Wayland
- Audio: Pipewire
- Kernels: defualt linux kernel
- Network configuration: NetworkManager enabled
- Additional packages: nano reflector
- Optional repositories: enable Multilib
- Timezone: user specified
- Automatic time sync (NTP): recommended

Double and triple check configurations

Proceed with installation

When the install script finishes, it will ask you if you want to chroot into your new install. This is recommended.

## chroot steps

