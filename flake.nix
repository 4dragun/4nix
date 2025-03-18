{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    stylix.url = "github:danth/stylix?ref=83645322fd2214b06cf01623f1774fe58cfc3520";
    hyprpanel.url = "github:Jas-SinghFSU/HyprPanel";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nvchad4nix = {
      url = "github:nix-community/nix4nvchad";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, ...  }@inputs:
  {
    nixosConfigurations.nixy = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs; };
      modules = [
        ./configuration.nix
        inputs.stylix.nixosModules.stylix
	      {
          nixpkgs.overlays = [
            inputs.hyprpanel.overlay
            (final: prev: { nvchad = inputs.nvchad4nix.homeManagerModule; })
          ];
        }
        home-manager.nixosModules.home-manager {
	        home-manager = {
            extraSpecialArgs = { inherit inputs; };
	          useGlobalPkgs = true;
            useUserPackages = true;
            users.nixy = import ./home.nix;
          };
	      }
      ];
    };
  };
}
