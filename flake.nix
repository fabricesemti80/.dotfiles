{
  description = "My Awesome System Config of Doom";

  inputs = {
    nixpkgs.url = "nixpgks/nixos-23.05";
    home-manager.url = "github:nix-community/home-manager/release-23.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, ... }:
    let
    system = "x86"
    in {

    };
}
