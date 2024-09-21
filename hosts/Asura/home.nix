{ inputs, pkgs, ... }:

{
  imports = [
    inputs.nvf.homeManagerModules.default
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
      right_format = "$cmd_duration";
      directory = {
        truncation_length = 3;
        truncate_to_repo = false;
        truncation_symbol = "…/";
      };
      directory.read_only = " 󰌾";
      git_branch.symbol = " ";
      hostname.ssh_symbol = " ";
      nix_shell.symbol = " ";
      package.symbol = "󰏗 ";
    };
  };
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    enableCompletion = true;
    dotDir = ".config/zsh";
    syntaxHighlighting.enable = true;
  };

  programs.nvf = {
    enable = true;
    settings.vim = {
      tabWidth = 3;

      syntaxHighlighting = true;

      autocomplete = {
        enable = true;
        alwaysComplete = true;
      };

      filetree.neo-tree = {
        enable = true;
      };

      lsp = {
        enable = true;
        lspSignature.enable = true;
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

      visuals = {
        enable = true;
        fidget-nvim.enable = true;
        smoothScroll.enable = true;
      };

      utility = {
        preview.markdownPreview.enable = true;
      };

      statusline.lualine = {
        enable = true;
        theme = "catppuccin";
      };

      languages = {
        enableDAP = true;
        enableExtraDiagnostics = true;
        enableFormat = true;
        enableLSP = true;
        enableTreesitter = true;
        
        bash.enable = true;
        nix.enable = true;
        markdown.enable = true;
        ts.enable = true;
      };

      telescope = {
        enable = true;
      };

      presence.neocord = {
        enable = true;
        setupOpts = {
          enable_line_number = true;
          line_number_text = "Working on line %s of %s";
          logo_tooltip = "Why i'm doing this?";
        };
      };
    };
  };

  programs.foot = {
    enable = true;
    settings = {
      main = {
        font = "JetBrains Mono Nerd Font:size=8";
        line-height = 10;
        letter-spacing = 0;
        horizontal-letter-offset = 0;
        vertical-letter-offset = 0;
        box-drawings-uses-font-glyphs = "no";
        dpi-aware = "yes";
        #initial-window-size-chars = "";
        initial-window-mode = "windowed";
        pad = "0x0";
        resize-delay-ms = 100;
        bold-text-in-bright = "no";
        word-delimiters = ",│`|:\"'()[]{}<>";
        selection-target = "primary";
      };

      cursor = {
        style = "block";
        blink = "no";
      };

      mouse = {
        hide-when-typing = "yes";
        alternate-scroll-mode = "yes";
      };

      colors = {
        alpha = 0.8;
      };
    };   
  };

  home.stateVersion = "24.05";

  programs.home-manager.enable = true;
}
