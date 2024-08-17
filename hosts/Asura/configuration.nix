{inputs, pkgs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
      ./../../aagl.nix
    ];

  swapDevices = [{
    device = "/swapfile";
    size = 32 * 1024; # 32GB
  }];

  services.fstrim.enable = true;

  services.xserver.enable = true;
  
  programs.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
  };

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
    ];
  };

  services.xserver.xkb.layout = "pl";

  users.users.gylvaris = {
    isNormalUser = true;
    extraGroups = ["networkmanager" "wheel"]; 
    packages = with pkgs; [
      firefox
      chromium
    ];
  };

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    cmake
    wget
    curl
    vim
    ffmpeg_6-full
    inputs.nixvim.packages.${pkgs.system}.default
    gamemode
    mangohud
    dunst
    wofi
    egl-wayland
    libnotify
    dunst
    inputs.prismlauncher.packages.${pkgs.system}.prismlauncher
    wl-clipboard
  ];

  environment.variables.EDITOR = "nvim";
  
  systemd.extraConfig = "DefaultTimeoutStopSec=10s";

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;
  };
  
  programs.gamemode.enable = true;

  programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  services.openssh.enable = true;

  system.activationScripts.diff = ''
    if [[ -e /run/current-system ]]; then
      echo
      ${pkgs.nushell}/bin/nu -c "let diff_closure = ${pkgs.nix}/bin/nix store diff-closures /run/current-system '$systemConfig'; if \$diff_closure != \"\" {
        let table = \$diff_closure
        | lines
        | where \$it =~ KiB
        | where \$it =~ →
        | parse -r '^(?<Package>\S+): (?<Old_Version>[^,]+)(?:.*) → (?<New_Version>[^,]+)(?:.*, )(?<DiffBin>.*)$'
        | insert Diff {
          get DiffBin
          | ansi strip
          | str trim -l -c '+'
          | into filesize
        }
        | reject DiffBin
        | sort-by -r Diff; print \$table; \$table
        | math sum
      }"
    fi
  '';

  system.stateVersion = "24.05";
}
