{ config, pkgs, inputs, ... }:

{
  imports = [

    ../common/global

    ../common/users/fabrice

    ../common/optional/docker.nix

    ./configuration.nix
    ./hardware-configuration.nix
  ];
}
