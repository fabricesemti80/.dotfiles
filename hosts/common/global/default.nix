{ config, lib, pkgs, vars, ... }:

{
  imports = [

    ./packages.nix
    ./sops.nix

  ];
}
