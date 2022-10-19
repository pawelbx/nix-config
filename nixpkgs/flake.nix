{
  description = "Home Manager flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/release-22.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-22.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @ { self, nixpkgs, home-manager }:
    let
      system = "aarch64-darwin";

      pkgs = import nixpkgs {
        inherit system;
        config =
          {
            allowUnfree = true;
          };
      };

    in {
      homeConfigurations = {
          home = inputs.home-manager.lib.homeManagerConfiguration {
            system = "aarch64-darwin";
            homeDirectory = "/Users/pawel";
            username = "pawel";
            configuration.imports = [
              ./home-manager.nix
            ];
          };
        };
      };
}
