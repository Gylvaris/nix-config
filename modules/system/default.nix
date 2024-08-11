{ lib, ... }:
{
  imports = [
    ./boot/default.nix
    ./cpu/amd.nix
    ./gpu/default.nix
    ./services/default.nix
    ./binary-caches.nix
    #./bluetooth.nix
    ./fonts.nix
    ./locales.nix
    ./networking.nix
    ./nix.nix
    #./preserve-system.nix
    ./wayland.nix
    ./opentabletdriver.nix
  ];
}
