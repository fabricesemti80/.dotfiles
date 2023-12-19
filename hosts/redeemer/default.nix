{ config, pkgs, ... }:

{
  imports = [

    ./services

    ./configuration.nix
    ./bootloader.nix

    ./packages.nix

    ./hardware-configuration.nix
    ./networking.nix

  ];
}
