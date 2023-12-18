{ config, pkgs, ... }:

{
    # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs;
    [

      ## Development tools
      docker                #? (Container virtualization)
      docker-compose        #? (Container virtualization configuration) 
    
    ];
}