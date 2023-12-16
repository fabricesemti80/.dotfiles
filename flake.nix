{
  description = "My Awesome System Config of Doom";

  ##? References Used by Flake
  inputs = {

    ##? Unstable Nix Packages (Default)
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    ##? Stable Nix Packages
    nixpkgs-stable.url = "github:nixos/nixpkgs/release-23.05";

    # ##? NUR Community Packages
    # ##? Requires "nur.nixosModules.nur" to be added to the host modules
    # nur = { url = "github:nix-community/NUR"; };

    ##? Fixes OpenGL With Other Distros.
    nixgl = {
      url = "github:guibou/nixGL";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    ##? User Environment Manager
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    ##? SOPS Secret managment
    ##? ref:  https://github.com/Mic92/sops-nix
    sops-nix.url = "github:Mic92/sops-nix";

    ##? VSCode Server support
    ##? ref: https://github.com/nix-community/nixos-vscode-server
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

        # This is my main user account on all hosts
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
        };

        #TODO: Other users TBA

      };

      nixosConfigurations = {

        # Redeemer is a test VM on Proxmox
        redeemer = lib.nixosSystem {
          inherit system;
          modules = [
            ./hosts/default.nix # default configuration for ALL hosts
            ./hosts/common # default packages for ALL hosts
            ./hosts/redeemer # configuration specific to THIS host
            sops-nix.nixosModules.sops
            vscode-server.nixosModules.default
            ({ config, pkgs, ... }: { services.vscode-server.enable = true; })
          ];
        };

        #TODO: Other hosts TBA

      };
    };
}
