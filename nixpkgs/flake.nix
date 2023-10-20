{
  description = "Home Manager flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/release-23.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-23.05";
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
          pkgs = pkgs;
          modules = [
            ./home-manager.nix
            {
              home = {
                username = "pawel";
                homeDirectory = "/Users/pawel";
                stateVersion = "23.05";
              };
            }
          ];
        };
      };
    };
}
