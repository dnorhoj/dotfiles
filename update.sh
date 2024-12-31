#/usr/bin/env bash

cd $(xdg-user-dir DOTFILES)
sudo nixos-rebuild switch --flake .