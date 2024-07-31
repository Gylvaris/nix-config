{ config,lib, ... }:
{
  networking = {
    hostName = "Asura";
    networkmanager = {
      enable = true;
      #plugins = mkForce [];
    }; 
  };

  #systemd = {
    #targets.network-online.wantedBy = mkForce [];
  #services.NetworkManager-wait-online.wantedBy = mkForce [];
  #};
}
