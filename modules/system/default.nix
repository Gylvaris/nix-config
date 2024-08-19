{
  imports = [
    ./boot/default.nix
    ./cpu/amd.nix
    ./gpu/default.nix
    ./services/default.nix
    ./binary-caches.nix
    ./fonts.nix
    ./locales.nix
    ./networking.nix
    ./nix.nix
    ./wayland.nix
    ./opentabletdriver.nix
  ];
}
