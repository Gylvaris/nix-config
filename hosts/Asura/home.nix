{
  inputs,
  lib,
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
      add_newline = false;
      format = lib.concatStrings [
        """
$cmd_duration$directory $git_branch
$character
"""
      ];

      character = {
        success_symbol = "[• ](bold fg:green) ";
        error_symbol = "[• 󰅙](bold fg:red) ";
      };

      package.disabled = true;

      git_branch = {
        style = "bg: green";
        symbol = "󰘬";
        truncation_length = 6;
        truncation_symbol = "";
        format = "• [](bold fg:green)[$symbol $branch(:$remote_branch)](fg:black bg:green)[ ](bold fg:green)";
      };

      git_commit = {
        commit_hash_length = 4;
        tag_symbol = " ";
      };

      git_state = {
        format = "[\($state( $progress_current of $progress_total)\)]($style) ";
        cherry_pick = "[🍒 PICKING](bold red)";
      };

      git_status = {
        conflicted = " 🏳 ";
        ahead = " 🏎💨 ";
        behind = " 😰 ";
        diverged = " 😵 ";
        untracked = " 🤷 ‍";
        stashed = " 📦 ";
        modified = " 📝 ";
        staged = "[++\($count\)](green)";
        renamed = " ✍️ ";
        deleted = " 🗑 ";
      };

      hostname = {
        ssh_only = false;
        format = "[•$hostname](bg:cyan bold fg:black)[](bold fg:cyan )";
        trim_at = ".companyname.com";
        disabled = false;
      };

      line_break.disabled = false;

      memory_usage = {
        disabled = true;
        threshold = -1;
        symbol = " ";
        style = "bold dimmed green";
      };

      time = {
        disabled = true;
        format = "🕙[\[ $time \]]($style) ";
        time_format = "%T";
      };

      username = {
        style_user = "bold bg:cyan fg:black";
        style_root = "red bold";
        format = "[](bold fg:cyan)[$user]($style)";
        disabled = false;
        show_always = true;
      };

      directory = {
        home_symbol = "  ";
        read_only = "  ";
        style = "bg:green fg:black";
        truncation_length = 6;
        truncation_symbol = "••/";
        format = "[](bold fg:green)[$path ]($style)[](bold fg:green)";
      };

      directory.substitutions = {
        "Desktop" = "  ";
        "Documents" = "  ";
        "Downloads" = "  ";
        "Music" = " 󰎈 ";
        "Pictures" = "  ";
        "Videos" = "  ";
      };

      cmd_duration = {
        min_time = 0;
        format = "[](bold fg:yellow)[ $duration](bold bg:yellow fg:black)[](bold fg:yellow) •• ";
      };

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
        formatOnSave = false;
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
        term = "xterm-256color";
        title = "foot";
        font = "SpaceMono Nerd Font:size=11";
        line-height = 13;
        letter-spacing = 0;
        dpi-aware = "no";
        pad = "25x25";
        resize-delay-ms = 100;
        bold-text-in-bright = "no";
      };

      scrollback = {
        lines = 10000;
      };

      cursor = {
        style = "beam";
        blink = "no";
        beam-thickness = 1.3;
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
