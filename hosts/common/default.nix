{ config, lib, pkgs, vars, ... }:

{
  imports = [ ./comonpackages.nix ./programs ./services ];
}
