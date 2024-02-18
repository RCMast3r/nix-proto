{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/release-23.05";
    nix-std.url = "github:chessai/nix-std";
    nix-filter.url = "github:numtide/nix-filter";
  };
  outputs = {
    self,
    nixpkgs,
    nix-std,
    nix-filter,
    ...
  } @ inputs: let
    std = nix-std.lib;
    nix_lib = nixpkgs.lib;
    filter = nix-filter.lib;
  in
    (import ./.) {
      inherit nix_lib;
      inherit std;
      inherit filter;
    };
}
