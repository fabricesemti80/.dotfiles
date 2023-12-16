{ config, pkgs, ... }:

{
  imports = [ # Include the results of the hardware scan.
    ./configuration.nix
    ./packages.nix  
    ./hardware-configuration.nix
  ];
}