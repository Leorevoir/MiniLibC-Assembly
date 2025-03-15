# /! auto-generated nix flake /!\
# do NOT edit !

{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };
  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
        };
      in
      with pkgs; {
        devShells.default = mkShell {
          buildInputs = [
            gnumake
            gcc
            nasm
          ];
          shellHook = ''
            export PKG_CONFIG_PATH=${pkgs.lib.makeLibraryPath [
            
            ]}:$PKG_CONFIG_PATH
            export LD_LIBRARY_PATH=${pkgs.lib.makeLibraryPath [
            
            ]}:$LD_LIBRARY_PATH
          '';
        };
      });
}
