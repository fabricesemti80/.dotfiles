{
  description = "My Awesome System Config of Doom";

  ##? References Used by Flake
  inputs = {

    nixpkgs.url =
      "github:nixos/nixpkgs/release-23.11"; # Unstable Nix Packages (Default)

    nixpkgs-unstable.url =
      "github:nixos/nixpkgs/nixos-unstable"; # Stable Nix Packages

    # nixpkgs-stable.url = "github:nixos/nixpkgs/release-23.05"; # Stable Nix Packages

    nur = { # NUR Community Packages
      url =
        "github:nix-community/NUR"; # Requires "nur.nixosModules.nur" to be added to the host modules
    };

    nixgl = {
      url = "github:guibou/nixGL";
      inputs.nixpkgs.follows = "nixpkgs"; # ? Fixes OpenGL With Other Distros.
    };

    nixvim = { # Neovim
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };

    # emacs-overlay = { # Emacs Overlays #TODO: activate if used
    #   url = "github:nix-community/emacs-overlay"; 
    #   flake = false;
    # };

    # doom-emacs = { # Nix-Community Doom Emacs #TODO: activate if used
    #   url = "github:nix-community/nix-doom-emacs";
    #   inputs.nixpkgs.follows = "nixpkgs";
    #   inputs.emacs-overlay.follows = "emacs-overlay";
    # };

    # hyprland = { # Official Hyprland Flake #TODO: activate if used
    #   url =
    #     "github:hyprwm/Hyprland"; # Requires "hyprland.nixosModules.default" to be added the host modules
    #   inputs.nixpkgs.follows = "nixpkgs-unstable";
    # };

    # plasma-manager = { # KDE Plasma User Settings Generator #TODO: activate if used
    #   url = "github:pjones/plasma-manager";
    #   inputs.nixpkgs.follows = "nixpkgs";
    #   inputs.home-manager.follows = "nixpkgs";
    # };

    home-manager = { # User Environment Manager
      url = "github:nix-community/home-manager/release-23.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    sops-nix.url =
      "github:Mic92/sops-nix"; # SOPS Secret managment - "https://github.com/Mic92/sops-nix"

    vscode-server.url =
      "github:nix-community/nixos-vscode-server"; # VSCode Server support - "https://github.com/nix-community/nixos-vscode-server"

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

      vars = { # Variables Used In Flake
        user = "fabrice";
        # location = "$HOME/.setup"; #TODO: Change when final
        terminal = "kitty";
        editor = "nvim";
      };

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
