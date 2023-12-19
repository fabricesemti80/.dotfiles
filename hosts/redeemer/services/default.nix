{ config, lib, pkgs, vars, ... }:

{
  imports = [

    ./xserver.nix
    ./sound.nix
    ./openssh.nix
    ./tailscale.nix

  ];
}
