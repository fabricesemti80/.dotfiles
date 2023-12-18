{ config, pkgs, ... }:

{
  # Enable Tailscale service
  services.tailscale.enable = true;
}
