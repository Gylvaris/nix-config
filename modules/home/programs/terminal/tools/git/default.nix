{config, ...}: {
  programs.git = {
    enable = true;
    userName = "Gylvaris";
    userEmail = "111581734+Gylvaris@users.noreply.github.com";

    signing = {
      key = "~/.ssh/id_ed25519";
      signByDefault = true;
    };

    extraConfig = {
      gpg.format = "ssh";
      commit.gpgsign = true;
    };
  };

  xdg.configFile."git/allowed_signers".text = ''
    ${config.programs.git.userEmail} namespaces="git" "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGTrQ4GAyRrgoSEa19NPoHTw92mhLEbLMZMH+sTGbVt6"
  '';
}
