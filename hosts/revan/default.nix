{ config, pkgs, inputs, ... }:

{
  imports = [

    ../common/global
    ../common/users/fabrice
    ../common/optional/docker.nix

    ./configuration.nix
    ./additionalConfiguration.nix
    ./bootloader.nix
    ./hardware-configuration.nix
  ];
}
