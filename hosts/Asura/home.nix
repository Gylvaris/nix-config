{ config, pkgs, ... }:

{
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
    cowsay
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
    libreoffice-fresh
    prismlauncher
    lshw
    #easyeffects
    gimp
    foot
    kitty
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

  home.stateVersion = "24.05";

  programs.home-manager.enable = true;
}
