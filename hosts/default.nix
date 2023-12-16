{ config, pkgs, ... }:

{
  imports = [ 
    ./fonts.nix
  ];

  #? Passwordless sudo
  security.sudo.extraRules = [{
    users = [ "fabrice" ];
    commands = [{
      command = "ALL";
      options =
        [ "NOPASSWD" ]; # "SETENV" # Adding the following could be a good idea
    }];
  }];

}
