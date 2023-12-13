#!/bin/sh
pushd ~/.dotfiles
./apply-system.sh && ./apply-users.sh
nix-info -m | lolcat
popd
