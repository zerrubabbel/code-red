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

