{ lib, ... }:
let
in {
  programs.bash = {
    enable = true;
    initExtra = ''
      eval "$(direnv hook bash)"   # enable `direnv`
    '';
    shellAliases = {
      cat = "bat";
      l = "eza";
      ll = "eza-alh";
    };
  };
}
