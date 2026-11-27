{
    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";
        nixpkgs_unstable.url = "github:nixos/nixpkgs/nixos-unstable";

        nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=latest";
        areofyl-fetch.url = "github:areofyl/fetch";
            
        home-manager.url = "github:nix-community/home-manager/release-26.05";

    };

    outputs = { self, nixpkgs, home-manager, ... } @ inputs: 
    let
        system = "x86_64-linux";
        pkgs = nixpkgs.legacyPackages.${system};
        pkgs_unstable = inputs.nixpkgs_unstable.legacyPackages.${system};
    in {
        nixosConfigurations.pc = nixpkgs.lib.nixosSystem {
            inherit system;
            modules = [ 
            ./nixos/configuration.nix 
            inputs.nix-flatpak.nixosModules.nix-flatpak
            ];
            specialArgs = {
                inherit inputs pkgs_unstable;
            };
        };

        homeConfigurations.user = home-manager.lib.homeManagerConfiguration {
            inherit pkgs;
            modules = [ ./home-manager/home.nix ];
            extraSpecialArgs = {
                inherit inputs pkgs_unstable;
            };
        };

    };
}
