{
  description = "";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
    home-manager.url = "github:nix-community/home-manager/release-24.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, ... }:
    let
      lib = nixpkgs.lib;
      system = "x86_64-linux";
      user = "katsa";
      pkgs = nixpkgs.legacyPackages.${system};
      allowed-unfree-packages = [
        "steam"
        "steam-original"
        "steam-run"
        "discord"
      ];
    in {
      nixosConfigurations = {
        nixos = lib.nixosSystem {
          inherit system;
          modules = [
            ./configuration.nix
            home-manager.nixosModules.home-manager {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.extraSpecialArgs = {
                inherit allowed-unfree-packages user;
              };
            }
          ];

          specialArgs = {
            inherit allowed-unfree-packages user;
          };
        };
      };

      homeConfigurations = {
        katsa = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          extraSpecialArgs = {
            inherit allowed-unfree-packages user;
          };
          modules = [ ./home.nix ];
        };
      };
    };
}
