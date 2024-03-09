# who the fuck designed this language
{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    rust-overlay.url = "github:oxalica/rust-overlay";
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    rust-overlay,
    ...
  }: let
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      config.allowUnfree = true;
    };
    lib = nixpkgs.lib;
  in {
    nixosConfigurations = {
      retard = lib.nixosSystem rec {
        inherit system;
        modules = [
          ./host/shittydesk
          ./nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager = {
              extraSpecialArgs = {rootPath = ./.;};
            };
            home-manager.users.retard = {imports = [./home/home.nix ./host/shittydesk/home.nix];};
          }
          # rust
          (
            {pkgs, ...}: let
              rust = pkgs.rust-bin.stable.latest.default.override {
                extensions = ["rust-src"];
                targets = ["x86_64-unknown-linux-gnu"];
              };
            in {
              nixpkgs.overlays = [rust-overlay.overlays.default];
              environment.systemPackages = [rust];
            }
          )
        ];
      };
    };
  };
}
