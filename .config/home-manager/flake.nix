{
  description = "Cool Home Manager Configuration";

  inputs = {
    # Pin to 24.05 branch for macOS 12 stability
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-24.05-darwin";
    
    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    gruvbox-wallpapers.url = "github:AngelJumbo/gruvbox-wallpapers";
  };

  outputs = { nixpkgs, home-manager, gruvbox-wallpapers, ... }@inputs: {
    homeConfigurations."decompile" = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages.x86_64-darwin; # Targets your Intel processor

      extraSpecialArgs = { inherit inputs; };

      modules = [ ./home.nix ];
    };
  };
}