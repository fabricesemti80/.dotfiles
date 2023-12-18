{ config, lib, pkgs, vars, ... }:

{
  imports = [

    ./packages.nix
    ./sops.nix
    ./i18n.nix
    ./ssh.nix
    ./tailscale.nix

  ];
}
