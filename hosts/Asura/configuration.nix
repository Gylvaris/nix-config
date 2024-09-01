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
    extraGroups = ["networkmanager" "wheel" "gamemode"]; 
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
    ffmpeg_7-full
    gamemode
    mangohud
    dunst
    wofi
    egl-wayland
    libnotify
    dunst
    inputs.prismlauncher.packages.${pkgs.system}.prismlauncher
    wl-clipboard
    inputs.zen-browser.packages."${system}".default
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

  system.stateVersion = "24.05";
}
