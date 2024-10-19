{
  programs.nvf = {
    enable = true;
    settings.vim = {
      tabWidth = 4;

      syntaxHighlighting = true;

      autocomplete = {
        enable = true;
        alwaysComplete = true;
      };

      autopairs = {
        enable = true;
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
        nvimWebDevicons.enable = true;
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
        ts = {
          enable = true;
          lsp.enable = true;
          extensions.ts-error-translator.enable = true;
        };
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
}
