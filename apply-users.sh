#!/bin/sh
pushd  ~/.dotfiles
nix build .#homeManagerConfigurations.fabrice.activationPackage
./result/activate
popd
