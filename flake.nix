{
  description = "nix-config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }:
  let
    system = "x86_64-linux";
    username = "alice";
  in
  {
    nixosConfigurations.vm = nixpkgs.lib.nixosSystem {
      inherit system;
      specialArgs = {inherit username;};

      modules = [
        ./hosts/vm/configuration.nix

        home-manager.nixosModules.home-manager

        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;

          home-manager.users.${username} = import ./home/${username}/home.nix;
        }
      ];
    };
  };
}
