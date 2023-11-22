{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "fabrice";
  home.homeDirectory = "/home/fabrice";
  
  ## IMPORTS
  imports = [
    ./imports/bash.nix 
    ./imports/git.nix
    ./imports/starship.nix
    "${fetchTarball "https://github.com/msteen/nixos-vscode-server/tarball/master"}/modules/vscode-server/home.nix"
  ];

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    alacritty
    bat
    btop
    cmatrix
    direnv
    duf
    exa
    git
    git-crypt
    go-task
    gnupg
    httpie
    neofetch
    nixpkgs-fmt
    pinentry_qt
    tree
    tmux
    vscode-extensions.b4dm4n.vscode-nixpkgs-fmt
    wget
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')

    # # Install Nerd Fonts (FiraCode in this example)
    # (pkgs.callPackage (pkgs.fetchFromGitHub {
    #   owner = "ryanoasis";
    #   repo = "nerd-fonts";
    #   rev = "v3.1.0"; # Replace with the desired version
    #   sha256 = "sha256-ODi4oND5sSrv7tEbUqwIKjGwpDs1eCl2GWmhUQSVENg=";
    # }) {}).FiraCode # Include FiraCode font
    # (pkgs.callPackage (pkgs.fetchFromGitHub {
    #   owner = "ryanoasis";
    #   repo = "nerd-fonts";
    #   rev = "v3.1.0";
    #   sha256 = "sha256-ODi4oND5sSrv7tEbUqwIKjGwpDs1eCl2GWmhUQSVENg=";
    # }) {}).JetBrainsMono # Include JetBrainsMono font
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. If you don't want to manage your shell through Home
  # Manager then you have to manually source 'hm-session-vars.sh' located at
  # either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/fabrice/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
  };
  
  ## SERVICES
  services.vscode-server.enable = true;

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
