{
  inputs,
  pkgs,
  ...
}: {
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
      tabWidth = 4;

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
        formatOnSave = true;
      };

      git = {
        enable = true;
        gitsigns.enable = true;
      };

      theme = {
        enable = true;
        transparent = true;
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

      maps = {
        normal = {
          "<leader>v" = {
            action = "<CMD>Neotree toggle<CR>";
            silent = true;
          };
        };
      };

      languages = {
        enableDAP = true;
        enableExtraDiagnostics = true;
        enableFormat = true;
        enableLSP = true;
        enableTreesitter = true;

        bash.enable = true;
        nix = {
          enable = true;
          format.enable = true;
        };
        markdown.enable = true;
        ts.enable = true;
      };

      telescope = {
        enable = true;
      };

      presence.neocord = {
        enable = true;
        setupOpts = {
          logo_tooltip = "Why i'm doing this?";
        };
      };
    };
  };

  programs.foot = {
    enable = true;
    settings = {
      main = {
        shell = "zsh";
        term = "foot";
        title = "foot";
        font = "SpaceMono Nerd Font:size=11";
        line-height = 13;
        letter-spacing = 0.2;
        horizontal-letter-offset = 0;
        vertical-letter-offset = 0;
        box-drawings-uses-font-glyphs = "no";
        dpi-aware = "no";
        #initial-window-size-chars = "";
        initial-window-mode = "windowed";
        pad = "20x20";
        resize-delay-ms = 100;
        bold-text-in-bright = "no";
        word-delimiters = ",│`|:\"'()[]{}<>";
        selection-target = "primary";
      };

      scrollback = {
        lines = 10000;
      };

      cursor = {
        style = "beam";
        blink = "no";
        beam-thickness = 1.2;
      };

      mouse = {
        hide-when-typing = "yes";
        alternate-scroll-mode = "yes";
      };

      colors = {
        alpha = 0.95;
      };

      key-bindings = {
        scrollback-up-page = "Page_Up";
        scrollback-down-page = "Page_Down";
        clipboard-copy = "Control+c";
        clipboard-paste = "Control+v";
        search-start = "Control+f";
      };

      search-bindings = {
        cancel = "Escape";
        find-prev = "Shift+F3";
        find-next = "F3 Control+G";
      };
    };
  };

  home.stateVersion = "24.05";

  programs.home-manager.enable = true;
}
