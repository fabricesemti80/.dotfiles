# packages and settings exclusie for systems with desktop/GUI

{ config, pkgs, ... }:

{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.fabrice = { packages = with pkgs; [ gparted gimp firefox ]; };

}
