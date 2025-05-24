{
  description = "Bun + Svelte dev environment";

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
      in {
        devShells.default = pkgs.mkShell {
          buildInputs = [
            pkgs.bun
            pkgs.nodejs_20 # Needed for some tools
            pkgs.corepack   # Useful for pnpm/yarn
          ];

          shellHook = ''
          '';
        };
      });
}

