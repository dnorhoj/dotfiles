#/usr/bin/env bash

cd $(xdg-user-dir DOTFILES)
nixos-rebuild switch --use-remote-sudo --flake .