{ config, pkgs, inputs, ... }:

{
  imports = [

    ../common/global

    ../common/optional/docker.nix

    ./configuration.nix
    ./hardware-configuration.nix
  ];
}
