{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
    roc.url = "github:roc-lang/roc?rev=bf5b13e237fc5cf49773e6b71d10ee2455b1ae5f";
  };

  nixConfig = {
    extra-trusted-public-keys = "roc-lang.cachix.org-1:6lZeqLP9SadjmUbskJAvcdGR2T5ViR57pDVkxJQb8R4=";
    extra-trusted-substituters = "https://roc-lang.cachix.org";
  };

  outputs =
    inputs@{
      self,
      nixpkgs,
      flake-parts,
      roc,
      ...
    }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [
        "aarch64-darwin"
        "aarch64-linux"
        "x86_64-darwin"
        "x86_64-linux"
      ];
      perSystem =
        {
          inputs',
          pkgs,
          system,
          ...
        }:
        {
          devShells.default = pkgs.mkShell {
            name = "roc-units";
            packages = [
              inputs'.roc.packages.cli
              pkgs.just
              # Pre-commit
              pkgs.check-jsonschema
              pkgs.nixfmt-rfc-style
              pkgs.nodePackages.prettier
              pkgs.pre-commit
              pkgs.python312Packages.pre-commit-hooks
            ];
            shellHook = "pre-commit install --overwrite";
          };
          formatter = pkgs.nixfmt-rfc-style;
        };
    };
}
