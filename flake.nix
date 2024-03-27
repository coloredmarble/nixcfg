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
    };
    lib = nixpkgs.lib;
  in {
    nixosConfigurations = {
      retard = lib.nixosSystem rec {
        inherit system;
        modules = [
          ./host/shittydesk
          ./nix/nix.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager = {
              extraSpecialArgs = {rootPath = ./.;};
            };
            home-manager.users.retard = {imports = [./home/home.nix ./host/shittydesk/home.nix];}; 
          }
          ({ pkgs, ... }: let r = pkgs.rust-bin.selectLatestNightlyWith (toolchain: toolchain.default.override {extensions = [ "rust-src" "rust-analyzer" ];}); in {
            nixpkgs.overlays = [ rust-overlay.overlays.default ];
            environment.systemPackages = [r];
          })
        ];
      };
    };
  };
}
