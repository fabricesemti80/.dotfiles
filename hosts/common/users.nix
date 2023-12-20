{ config, pkgs, ... }:

{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.fabrice = {
    isNormalUser = true;
    description = "Fabrice Semti";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      curl
      firefox
      nano
      nixpkgs-fmt
      tailscale
      vscode-extensions.b4dm4n.vscode-nixpkgs-fmt
    ];
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBJpVWYmXPpqVmlHdixDR//vdfD+sryvYmpH2Dj1/Otx fabrice@fabricesemti.com"
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDl0ivGFV8D/M53/qvRRkfxkKgY3635xDiiLQwFgrWon fabrice@fabricesemti.com"
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIX2Y3nmVHNxNCNV+WXHeBEcXFS0XYDnNWxzm9oAIyFa fabrice@fabricesemti.com"

    ];
  };

}
