{
  config,
  inputs,
  lib,
  pkgs,
  ...
}: {
  imports = [
    inputs.nvf.homeManagerModules.default
    ../../modules/home
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
    cliphist
  ];

  home.stateVersion = "24.05";

  programs.home-manager.enable = true;
}
