{ config, pkgs, inputs, ... }:

{
  imports = [ # Include the results of the hardware scan.
    ./configuration.nix
    ./packages.nix
    ./hardware-configuration.nix
  ];
}
