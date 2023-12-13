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

    # ##? Official Hyprland Flake
    # ##? Requires "hyprland.nixosModules.default" to be added the host modules
    # hyprland = {
    #   url = "github:hyprwm/Hyprland";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };

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

        };

      };

      nixosConfigurations = {

        # Flake for the test VM
        nixos-wsl = lib.nixosSystem {
          inherit system;
          modules = [
            ./hosts/wsl/configuration.nix
            ./hosts/defaults.nix
            sops-nix.nixosModules.sops
            vscode-server.nixosModules.default
            ({ config, pkgs, ... }: { services.vscode-server.enable = true; })
          ];

        };

        # Flake for the test VM
        nixos-vm = lib.nixosSystem {
          inherit system;
          modules = [
            ./hosts/vm/configuration.nix
            ./hosts/defaults.nix
            sops-nix.nixosModules.sops
            vscode-server.nixosModules.default
            ({ config, pkgs, ... }: { services.vscode-server.enable = true; })
          ];

        };
      };
    };
}
