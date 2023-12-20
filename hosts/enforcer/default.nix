{ config, pkgs, ... }:

{
  imports = [

    # desktop environment
    ./desktops/gnome.nix

    # enabled services
    ./services/sound.nix
    ./services/tailscale.nix

    # system specifics
    ./system/bootloader.nix
    ./system/hardware-configuration.nix
    ./system/networking.nix

    # nix config
    ./configuration.nix

    # programs and apps
    ./programs/packages.nix

  ];
}
