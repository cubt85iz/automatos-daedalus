# Automatos (Daedalus)

Custom image based on Fedora Silverblue. Includes dotfiles, repos, and software for laptop.

## Installation

1. Install Fedora Silverblue.
1. Execute `rpm-ostree rebase --reboot --bypass-driver ostree-unverified-registry:ghcr.io/cubt85iz/automatos-daedalus:latest` to rebase to the latest image.

  | :memo: **NOTE** |
  | -- |
  | There are a few services that run on startup. I would wait until these have finished before proceeding with the next step. You can monitor their progress using `journalctl --user -xeu <service> -f`. Services: 1) download-dotfiles 2) appimage-manager 3) flatpak-manager |

3. Execute `just setup` to configure GNOME, apply settings, install fonts, and more.
3. Enjoy!
