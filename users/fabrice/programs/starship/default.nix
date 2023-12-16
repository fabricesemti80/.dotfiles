{ lib, ... }:

let
  lang = icon: color: {
    symbol = icon;
    format = "[$symbol ](${color})";
  };
in { programs.starship = { enable = true; }; }
