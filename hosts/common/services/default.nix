{ config, lib, pkgs, vars, ... }:

{
  imports = [

    ./printing.nix
    ./openssh.nix

  ];
}
