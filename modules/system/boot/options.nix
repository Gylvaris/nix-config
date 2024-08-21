{ config, pkgs, ... }:
{
  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.initrd.kernelModules = ["amdgpu"];
  boot.extraModulePackages = [ config.boot.kernelPackages.zenpower ];
  boot.blacklistedKernelModules = ["k10temp"];
  boot.kernelModules = ["kvm-amd" "zenpower"];
  boot.kernelParams = ["amd_pstate=active"];
}
