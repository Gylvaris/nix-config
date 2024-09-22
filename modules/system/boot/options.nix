{
  config,
  pkgs,
  ...
}: {
  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    initrd.kernelModules = ["nvidia" "amdgpu"];
    extraModulePackages = [config.boot.kernelPackages.zenpower];
    blacklistedKernelModules = ["nouveau" "k10temp"];
    kernelModules = ["kvm-amd" "zenpower"];
    kernelParams = ["nvidia-drm.modeset=1" "nvidia-drm.fbdev=1" "amd_pstate=active"];
  };
}
