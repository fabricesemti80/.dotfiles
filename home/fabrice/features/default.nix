{ config, lib, pkgs, vars, ... }:

{
  imports = [ ./bash ./git ./starship ./gpg ];
}
