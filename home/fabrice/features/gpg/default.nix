{ config, lib, pkgs, vars, ... }:

{
  programs.gpg = { enable = true; };
  services.gpg-agent = {
    enable = true;
    pinentryFlavor = "qt";

  };
}
