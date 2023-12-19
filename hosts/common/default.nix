{ config, lib, pkgs, vars, ... }:

{
  imports = [

    ./locals.nix
    ./packages.nix

    ./programs
    ./services
  ];
}
