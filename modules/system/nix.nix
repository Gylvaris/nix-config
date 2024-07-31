{ pkgs, ...}:
{
  nix = {
    package = pkgs.nixVersions.latest;
    gc = {
      automatic = true;
      dates = "daily";
      options = "--delete-older-than 1w";
    };

    settings = {
      experimental-features = [
        "flakes"
        "nix-command"
      ];
      auto-optimise-store = true;
      keep-outputs = true;
      keep-dervations = true;
    };
  };
}
