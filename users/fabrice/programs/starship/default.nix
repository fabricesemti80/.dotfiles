{ lib, ... }:

let
  lang = icon: color: {
    symbol = icon;
    format = "[$symbol ](${color})";
  };
in {
  programs.starship = { enable = true; };
  home.file = {
    ".config/starship.toml".source = ./starship.toml;
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
}
