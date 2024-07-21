{
  description = "Home Manager flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/release-24.05";
    home-manager = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:nix-community/home-manager/release-24.05";
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
                stateVersion = "24.05";
              };
            }
          ];
        };
      };
    };
}
