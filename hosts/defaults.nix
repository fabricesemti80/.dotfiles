# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports = [ # Include the results of the hardware scan.

  ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/London";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_GB.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_GB.UTF-8";
    LC_IDENTIFICATION = "en_GB.UTF-8";
    LC_MEASUREMENT = "en_GB.UTF-8";
    LC_MONETARY = "en_GB.UTF-8";
    LC_NAME = "en_GB.UTF-8";
    LC_NUMERIC = "en_GB.UTF-8";
    LC_PAPER = "en_GB.UTF-8";
    LC_TELEPHONE = "en_GB.UTF-8";
    LC_TIME = "en_GB.UTF-8";
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.fabrice = {
    isNormalUser = true;
    description = "Fabrice Semti";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      # nix tools
      nix-info
      nixfmt
      nixpkgs-fmt
      vscode-extensions.b4dm4n.vscode-nixpkgs-fmt

      # Development Tools
      ansible
      age
      bat
      direnv
      git
      git-crypt
      gnupg
      go-task
      jq
      neovim
      pinentry-qt
      ripgrep
      sops
      vscode-extensions.b4dm4n.vscode-nixpkgs-fmt

      # Editors and Terminal
      alacritty
      nano
      tmux

      # Networking
      curl
      httpie
      tailscale
      wget

      # System Monitoring and Utilities
      btop
      cmatrix
      cowsay
      duf
      eza
      fzf
      tree

      # Customization
      cava

      # Miscellaneous
      figlet
      lolcat
      neofetch
      man-pages
      man-pages-posix

    ];
  };

  ## SSH Users
  users.users."fabrice".openssh.authorizedKeys.keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBJpVWYmXPpqVmlHdixDR//vdfD+sryvYmpH2Dj1/Otx fabrice@fabricesemti.com" # content of authorized_keys file
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDl0ivGFV8D/M53/qvRRkfxkKgY3635xDiiLQwFgrWon fabrice@fabricesemti.com"
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIX2Y3nmVHNxNCNV+WXHeBEcXFS0XYDnNWxzm9oAIyFa fabrice@fabricesemti.com"
    # note: ssh-copy-id will add user@your-machine after the public key
    # but we can remove the "@your-machine" part
  ];

  # Workaround for GNOME autologin: https://github.com/NixOS/nixpkgs/issues/103746#issuecomment-945091229
  systemd.services."getty@tty1".enable = false;
  systemd.services."autovt@tty1".enable = false;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs;
    [
      #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
      #  wget
    ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Enable Tailscale service
  services.tailscale.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  ## FONTS

  fonts = {
    enableDefaultPackages = true;
    packages = with pkgs;
      [ (nerdfonts.override { fonts = [ "FiraCode" "DroidSansMono" ]; }) ];

    fontconfig = {
      defaultFonts = {
        serif = [ "FiraCode" ];
        sansSerif = [ "DroidSans" ];
        monospace = [ "FiraCode" ];
      };
    };
  };

  ## Make ready for NixFlakes!
  nix.package = pkgs.nixFlakes;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  ## SOPS
  # path to the file containing secrets
  sops.defaultSopsFile = ../secrets/example.yaml;
  # path to an automatically generated (by the OS) SSH key; do this on ALL machine that needs the secrets!
  # run: nix-shell -p ssh-to-age --run 'cat /etc/ssh/ssh_host_ed25519_key.pub | ssh-to-age'
  # and add the key to the .sops.yaml
  # to activate this (has to be done BEFORE the encryption!)
  sops.age.sshKeyPaths = [ "/etc/ssh/ssh_host_ed25519_key" ];
  # Auto-generate
  sops.age.keyFile = "/var/lib/sops-nix/key.txt";
  # This will generate a new key if the key specified above does not exist
  sops.age.generateKey = true;

  # This is the actual specification of the secrets; 'example_key' MUST exist (replace if appropriate)
  sops.secrets.example_key = { };
  # sops.secrets."myservice/my_subdir/my_secret" = { };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # Did you read the comment?

}
