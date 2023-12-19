{ config, lib, pkgs, vars, ... }:

{
  imports = [

    ./locals.nix
    ./packages.nix
    ./users.nix

    ./programs
    ./services
  ];
}
