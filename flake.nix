{
  description = "My Awesome System Config of Doom";

  ##  >>  START INPUTS
  inputs = {

    # Official Nix Packages repository.
    nixpkgs.url = "nixpkgs/nixos-unstable";

    # Management of user-level configuration.
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # SOPS Nix - https://github.com/Mic92/sops-nix
    sops-nix.url = "github:Mic92/sops-nix";
  };

  ##  >> START OUTPUTS
  outputs = { self, nixpkgs, home-manager, sops-nix, ... }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config = { allowUnfree = true; };
      };
      lib = nixpkgs.lib;
    in {
      nixosConfigurations = {

        # Flake for the test VM
        nixos-mk3 = lib.nixosSystem {
          inherit system;
          modules = [ ./system/configuration.nix sops-nix.nixosModules.sops ];

        };
      };
    };
}
