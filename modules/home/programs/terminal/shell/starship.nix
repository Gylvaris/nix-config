{lib, ...}: {
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      add_newline = false;
      format =
        lib.concatStrings [
          ""
          "
$cmd_duration$directory $git_branch $nodejs$nix_shell
$character
"
          ""
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
      nodejs = {
        symbol = " ";
      };
      package.symbol = "󰏗 ";
    };
  };
}
