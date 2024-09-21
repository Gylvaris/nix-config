{
  # https://github.com/Gylvaris/nix-config
  description = "My starting point of NixOs journey";

  inputs = {
    # Why would i use stable?
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # Just Home Manager
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    #Hyprland
    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";

    # Launchers for various anime games like Zenless Zone Zero 
    aagl = {
      url = "github:ezKEa/aagl-gtk-on-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Minecraft launcher 
    prismlauncher.url = "github:PrismLauncher/PrismLauncher";

    # Cool browser based on firefox
    zen-browser = {
      url = "github:ch4og/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Neovim config
    nvf.url = "github:notashelf/nvf";
  };

  outputs = { self, nixpkgs, home-manager, ... } @ inputs: {
    nixosConfigurations = {
        Asura = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {
          inherit inputs;
        };
        modules = [
          ./hosts/Asura/configuration.nix
          ./modules/system

          home-manager.nixosModules.home-manager
          {
            home-manager = {
              extraSpecialArgs = {
                inherit inputs;
              };
              useGlobalPkgs = true;
              useUserPackages = true;
              backupFileExtension = "backup";
              users.gylvaris = import ./hosts/Asura/home.nix;
            };
          }
        ];
      };
    };
  };
}
