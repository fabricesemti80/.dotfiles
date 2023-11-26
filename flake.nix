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

    # VSCode Server - https://github.com/nix-community/nixos-vscode-server
    vscode-server.url = "github:nix-community/nixos-vscode-server";

  };

  ##  >> START OUTPUTS
  outputs = { self, nixpkgs, home-manager, sops-nix, vscode-server, ... }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config = { allowUnfree = true; };
      };
      lib = nixpkgs.lib;
    in {

      homeManagerConfigurations = {

        # Flake for the Great Lord
        fabrice = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.${system};

          modules = [
            ./users/fabrice/home.nix
            {
              home = {
                username = "fabrice";
                homeDirectory = "/home/fabrice";
                stateVersion = "23.05";
              };
            }
          ];

          # # Flake for the Great Lord
          # fabrice = home-manager.lib.homeManagerConfiguration {
          #   inherit system pkgs;
          #   username = "fabrice";
          #   configuration = { imports = [ ./users/fabrice/home.nix ]; };
        };

      };

      nixosConfigurations = {

        # Flake for the test VM
        nixos-mk3 = lib.nixosSystem {
          inherit system;
          modules = [
            ./system/configuration.nix
            sops-nix.nixosModules.sops
            vscode-server.nixosModules.default
            ({ config, pkgs, ... }: { services.vscode-server.enable = true; })
          ];

        };
      };
    };
}
