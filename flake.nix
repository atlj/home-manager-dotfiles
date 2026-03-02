{
  description = "Home Manager configuration of burakguner";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, ... }:
    let
      system = "aarch64-darwin";
      pkgs = import nixpkgs {
            system = "aarch64-darwin";
            config.allowUnfree = true; 
            overlays = [
              (import ./nvim-overlay.nix)
            ];
          };
    in {
      homeConfigurations."burakguner" = home-manager.lib.homeManagerConfiguration {
        # allow unfree
        pkgs = pkgs;
        # Specify your home configuration modules here, for example,
        # the path to your home.nix.
        modules = [ ./home.nix ];

        # Optionally use extraSpecialArgs
        # to pass through arguments to home.nix
      };
    };
}
