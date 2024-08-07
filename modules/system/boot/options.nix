{ config, pkgs, ... }:
{
  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.initrd.kernelModules = ["amdgpu"];
  boot.extraModulePackages = [ config.boot.kernelPackages.zenpower ];
  boot.blacklistedKernelModules = ["k10temp"];
  boot.kernelModules = ["kvm-amd" "zenpower"];
  boot.kernelParams = ["nvidia-drm.modeset=1" "nvidia-drm.fbdev=1" "amd_pstate=active" "nvidia.NVreg_EnableGpuFirmware=0"];
}
