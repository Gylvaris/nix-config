{pkgs, ...}: {
  # AMD igpu configuration for my laptop
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

  services.xserver.videoDrivers = ["amdgpu"];
}
