{ config, lib, pkgs, vars, ... }:

{
  home.file = {
    ".config/i3/config".source = ./i3config;
    ".config/i3status/config".source = ./i3statusconfig;
  };

}
