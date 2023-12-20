{ config, lib, pkgs, vars, ... }:

{
  imports = [
    ./locals.nix
    ./packages.nix
    ./users.nix
    ./fonts.nix
    ./programs
    ./services
  ];

  security.sudo.extraRules = [{
    users = [ "fabrice" ];
    commands = [{
      command = "ALL";
      options =
        [ "NOPASSWD" ]; # "SETENV" # Adding the following could be a good idea
    }];
  }];
}
