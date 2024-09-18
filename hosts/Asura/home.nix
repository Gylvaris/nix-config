{ config, inputs, pkgs, ... }:

{
  imports = [
    inputs.nvf.homeManagerModules.nvf
  ];

  home.username = "gylvaris";
  home.homeDirectory = "/home/gylvaris";

  home.packages = with pkgs; [
    fastfetch
    yazi
    zip
    unzip
    p7zip
    ripgrep 
    jq 
    yq-go
    eza
    fzf 
    file
    which
    tree
    gnused
    gnutar
    gawk
    zstd
    gnupg
    btop
    vesktop
    nvtopPackages.full
    obsidian
    obs-studio
    heroic
    lshw
    easyeffects
    gimp
    foot
    kitty
    protonplus
    osu-lazer-bin
    krita
    discord-ptb
    spotify
    satty
    grim
    slurp
    swww
    wf-recorder
  ];

  programs.git = {
    enable = true;
    userName = "Gylvaris";
    userEmail = "111581734+Gylvaris@users.noreply.github.com";
  };

  programs.bash = {
    enable = true;
    enableCompletion = true;
  };

  programs.nvf = {
    enable = true;
    settings.vim = {
      autocomplete = {
        enable = true;
        alwaysComplete = false;
      };

      git = {
        enable = true;
      };
    };
  };

  home.stateVersion = "24.05";

  programs.home-manager.enable = true;
}
