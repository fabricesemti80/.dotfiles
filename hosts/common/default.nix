{ config, lib, pkgs, vars, ... }:

{
  imports = [ ./packages.nix ./programs ./services ];
}
