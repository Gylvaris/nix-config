{ pkgs, ...}:
{
  nixpkgs.config.allowUnfree = true;
  nix = {
    package = pkgs.nixVersions.latest;
    
    settings = {
      experimental-features = [
        "flakes"
        "nix-command"
      ];
      max-jobs = 4;
      cores = 6;
      auto-optimise-store = true;
    }; 
    
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };
} 
