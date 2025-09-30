# Automatos (Daedalus)

Custom image based on Fedora Silverblue. Includes dotfiles, repos, and software for laptop.

## Installation

1. Install Fedora Silverblue.
1. Execute `rpm-ostree rebase --reboot --bypass-driver ostree-unverified-registry:ghcr.io/cubt85iz/automatos-daedalus:latest` to rebase to the latest image.
1. Execute `chezmoi init --apply https://github.com/cubt85iz/dotfiles.git` to download and install dotfiles.
1. Execute `just setup` to configure GNOME, apply settings, install fonts, and more.
1. Reboot & Enjoy!

| :memo: **NOTE** |
|--|
| The `automatos` repo provides shell scripts for installing flatpaks and appimages (experimental). The `dotfiles` repo contains systemd unit files that can be used to trigger installation on startup or when the files change. |
