{ pkgs, config, ... }:
let
  ifTheyExist = groups:
    builtins.filter (group: builtins.hasAttr group config.users.groups) groups;
in {

  users.mutableUsers = false;
  users.users.fabrice = {
    isNormalUser = true;
    # shell = pkgs.fish;
    description = "Fabrice Semti";
    extraGroups = [ "networkmanager" "wheel" ] ++ ifTheyExist [
      "minecraft"
      "network"
      "wireshark"
      "i2c"
      "mysql"
      "docker"
      "podman"
      "git"
      "libvirtd"
      "deluge"
    ];

    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBJpVWYmXPpqVmlHdixDR//vdfD+sryvYmpH2Dj1/Otx fabrice@fabricesemti.com" # content of authorized_keys file
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDl0ivGFV8D/M53/qvRRkfxkKgY3635xDiiLQwFgrWon fabrice@fabricesemti.com"
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIX2Y3nmVHNxNCNV+WXHeBEcXFS0XYDnNWxzm9oAIyFa fabrice@fabricesemti.com"
      # note: ssh-copy-id will add user@your-machine after the public key
      # but we can remove the "@your-machine" part
    ];

    packages = with pkgs; [
      curl
      firefox
      nano
      nixpkgs-fmt
      tailscale
      vscode-extensions.b4dm4n.vscode-nixpkgs-fmt
      home-manager
    ];
  };

  # users.mutableUsers = false;
  # users.users.misterio = {
  #   isNormalUser = true;

  #   extraGroups = [ "wheel" "video" "audio" ] ++ ifTheyExist [
  #     "minecraft"
  #     "network"
  #     "wireshark"
  #     "i2c"
  #     "mysql"
  #     "docker"
  #     "podman"
  #     "git"
  #     "libvirtd"
  #     "deluge"
  #   ];

  #   openssh.authorizedKeys.keys =
  #     [ (builtins.readFile ../../../../home/misterio/ssh.pub) ];
  #   hashedPasswordFile = config.sops.secrets.misterio-password.path;
  #   packages = [ pkgs.home-manager ];
  # };

  # sops.secrets.fabrice_password = {
  #   sopsFile = "../../secrets/super_secrets.yaml";
  #   neededForUsers = true;
  # };

  # home-manager.users.misterio =
  #   import ../../../../home/misterio/${config.networking.hostName}.nix;

  # services.geoclue2.enable = true;
  # security.pam.services = { swaylock = { }; };
}
