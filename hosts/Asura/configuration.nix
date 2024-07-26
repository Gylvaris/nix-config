{inputs, config, pkgs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
      ./../../aagl.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.systemd-boot.configurationLimit = 10;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.initrd.kernelModules = ["amdgpu"];
  boot.extraModulePackages = [ config.boot.kernelPackages.zenpower ];
  boot.blacklistedKernelModules = ["k10temp"];
  boot.kernelModules = ["kvm-amd" "zenpower"];
  boot.kernelParams = ["nvidia-drm.modeset=1" "nvidia-drm.fbdev=1" "amd_pstate=active"];

  networking.hostName = "Asura";
  networking.networkmanager = {
    enable = true;
  };

  swapDevices = [{
    device = "/swapfile";
    size = 10 * 1024; # 10GB
  }];

  time.timeZone = "Europe/Warsaw";

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  i18n.defaultLocale = "en_US.UTF-8";

  services.fstrim.enable = true;

  services.xserver.enable = true;
  
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
  };
  services.xserver.desktopManager.gnome.enable = true;

  services.xserver.xkb.layout = "pl";

  # services.printing.enable = true;

  hardware.graphics = {
    enable = true;
    enable32Bit = true;

    extraPackages = with pkgs; [
      mesa
      amdvlk
      rocm-opencl-icd
      rocm-opencl-runtime
      libva
      vaapiVdpau
      libvdpau-va-gl
    ];

    extraPackages32 = with pkgs; [
      driversi686Linux.mesa
      driversi686Linux.amdvlk
    ];
  };

  services.xserver.videoDrivers = ["nvidia" "amdgpu"];

  hardware.nvidia = {
    modesetting.enable = true;
    dynamicBoost.enable = true;
    powerManagement.enable = true;
    powerManagement.finegrained = false;
    open = false;
    nvidiaSettings = true;
    prime = {
      offload = {
        enable = true;
        enableOffloadCmd = true;
      };
      amdgpuBusId = "PCI:5:0:0";
      nvidiaBusId = "PCI:1:0:0";
    };
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };
  hardware.cpu.amd.updateMicrocode = true;  

  hardware.pulseaudio.enable = false;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.libinput.enable = true;

  #services.flatpak.enable = true;

  users.users.gylvaris = {
    isNormalUser = true;
    extraGroups = ["networkmanager" "wheel"]; 
    packages = with pkgs; [
      firefox
    ];
  };

  nixpkgs.config.allowUnfree = true;

  nix.settings.experimental-features = ["nix-command" "flakes"];
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 1w";
  };
  nix.package = pkgs.nixVersions.latest;
  nix.settings.auto-optimise-store = true;
  nix.settings = {
    substituters = [
      "https://ezkea.cachix.org"
      "https://nix-community.cachix.org"
    ];
    trusted-public-keys = [
      "ezkea.cachix.org-1:ioBmUbJTZIKsHmWWXPe1FSFbeVe+afhfgqgTSNd34eI="
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    ];
  };

  environment.systemPackages = with pkgs; [
    cmake
    wget
    curl
    vim
    ffmpeg_6-full
    inputs.nixvim.packages.${pkgs.system}.default
    gamemode
    mangohud
  ];

  fonts.packages = with pkgs; [
      material-design-icons
      (nerdfonts.override { fonts = [
      "JetBrainsMono"
      "Mononoki"
      ]; })
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
      noto-fonts-emoji
      corefonts
      vistafonts
      cascadia-code
      maple-mono-NF
      font-awesome
      twemoji-color-font
  ];

  environment.variables.EDITOR = "nvim";
  
  systemd.extraConfig = "DefaultTimeoutStopSec=10s";

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
