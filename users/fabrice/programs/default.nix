{ config, lib, pkgs, vars, ... }:

{
  imports = [ ./bash.nix ./git.nix ./starship ];
}
