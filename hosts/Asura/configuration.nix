{inputs, pkgs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
      ./../../aagl.nix
    ];

  swapDevices = [{
    device = "/swapfile";
    size = 16 * 1024; # 16GB
  }];

  services.fstrim.enable = true;
  services.xserver.enable = true;
  services.xserver.xkb.layout = "pl";

  services.desktopManager.plasma6.enable = true;

  users.users.gylvaris = {
    isNormalUser = true;
    extraGroups = ["networkmanager" "wheel" "gamemode"]; 
  };

  environment.systemPackages = with pkgs; [
    cmake
    wget
    curl
    vim
    ffmpeg_7-full
    gamemode
    mangohud
    egl-wayland
    inputs.prismlauncher.packages.${pkgs.system}.default
    inputs.zen-browser.packages."${system}".default
    libva-utils
    inputs.nixvim.packages.${pkgs.system}.default
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
