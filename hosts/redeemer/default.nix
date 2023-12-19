{ config, pkgs, ... }:

{
  imports = [ # Include the results of the hardware scan.
    ./configuration.nix
    ./bootloader.nix

    ./packages.nix

    ./hardware-configuration.nix
    ./networking.nix

  ];
}
