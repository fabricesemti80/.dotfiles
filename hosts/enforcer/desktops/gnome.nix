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

  # Workaround for GNOME autologin: https://github.com/NixOS/nixpkgs/issues/103746#issuecomment-945091229
  systemd.services."getty@tty1".enable = false;
  systemd.services."autovt@tty1".enable = false;

}
