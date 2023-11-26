#!/bin/sh
pushd ~/.dotfiles
# sudo nixos-rebuild switch -I nixos-config=./system/configuration.nix  ## ? if not using Flakes
sudo nixos-rebuild switch --flake .#
popd
