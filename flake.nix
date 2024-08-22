{
  description = "NixOs config for true Proxy! Or any anime lover";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    aagl = {
      url = "github:ezKEa/aagl-gtk-on-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:Rexcrazy804/nixvim-config";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland = {
      url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
    };

    prismlauncher = {
      url = "github:PrismLauncher/PrismLauncher";
    };

    zen-browser.url = "github:MarceColl/zen-browser-flake";
  };

  outputs = inputs@{ nixpkgs, home-manager, aagl, prismlauncher, ... }: {
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
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;

            home-manager.users.gylvaris = import ./hosts/Asura/home.nix;
            }
        ];
      };
    };
  };
}
