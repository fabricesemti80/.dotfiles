#!/bin/sh
pushd ~/.dotfiles
sudo nixos-rebuild switch --flake .#nixos-wsl
popd
