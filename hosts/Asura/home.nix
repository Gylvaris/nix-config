{ inputs, pkgs, ... }:

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
  
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      line_break.disabled = true;
      directory = {
        truncation_length = 3;
        truncate_to_repo = false;
        truncation_symbol = "…/";
      };
      directory.read_only = " 󰌾";
      git_branch.symbol = " ";
      haskell.symbol = " ";
      hostname.ssh_symbol = " ";
      meson.symbol = "󰔷 ";
      nix_shell.symbol = " ";
      package.symbol = "󰏗 ";
    };
  };
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    enableCompletion = true;
    dotDir = ".config/zsh";
  };

  programs.nvf = {
    enable = true;
    settings.vim = {
      tabWidth = 4;

      autocomplete = {
        enable = true;
        alwaysComplete = true;
      };

      filetree.neo-tree = {
        enable = true;
      };

      lsp = {
        enable = true;
      };

      git = {
        enable = true;
        gitsigns.enable = true;
      };

      theme = {
        enable = true;
        name = "catppuccin";
        style = "mocha";
      };

      languages = {
        enableDAP = true;
        enableExtraDiagnostics = true;
        enableFormat = true;
        enableLSP = true;
        enableTreesitter = true;
        
        bash.enable = true;
        nix.enable = true;
      };

      telescope = {
        enable = true;
      };

      presence.neocord = {
        enable = true;
      };
    };
  };

  home.stateVersion = "24.05";

  programs.home-manager.enable = true;
}
