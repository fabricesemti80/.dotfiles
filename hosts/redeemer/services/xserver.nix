{ config, pkgs, ... }:

{

  # Configure keymap in X11
  services.xserver = {
    enable = true;
    layout = "us";
    xkbVariant = "";
    # GNOME
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;

    # Enable automatic login for the user.
    displayManager.autoLogin.enable = true;
    displayManager.autoLogin.user = "fabrice";
  };

}
