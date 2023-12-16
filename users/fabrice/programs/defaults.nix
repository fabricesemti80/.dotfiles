{ config, lib, pkgs, vars, ... }:

{
  imports = [ ./bash.nix ./fonts.nix ./git.nix ./starship.nix ];
}
