#!/bin/sh
nix build .#homeManagerConfigurations.fabrice.activationPackage
./result/activate

