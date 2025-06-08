{
  description = "Home Manager flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/release-24.11";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:nix-community/home-manager/release-24.11";
    };
  };

  outputs = inputs @ { self, nixpkgs, home-manager, nixpkgs-unstable }:
    let
      system = "aarch64-darwin";

      pkgs = import nixpkgs {
        inherit system;
        config =
          {
            allowUnfree = true;
          };
      };
      unstable = import nixpkgs-unstable {
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
          extraSpecialArgs = { nixpkgs-unstable = unstable; };
          modules = [
            ./home-manager.nix
            {
              home = {
                username = "pawel";
                homeDirectory = "/Users/pawel";
                stateVersion = "24.11";
              };
            }
          ];
        };
      };
    };
}
