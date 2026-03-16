{
  description = "Akeyless Python SDK - auto-generated Python client for the Akeyless API";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    substrate = { url = "github:pleme-io/substrate"; inputs.nixpkgs.follows = "nixpkgs"; };
    flake-utils.url = "github:numtide/flake-utils";
  };
  outputs = { self, nixpkgs, substrate, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system: let
      pkgs = import nixpkgs { inherit system; };
      mkPythonPackage = (import "${substrate}/lib/python-package.nix").mkPythonPackage;
    in {
      packages.default = mkPythonPackage pkgs {
        pname = "akeyless";
        version = "0.0.0-dev";
        src = self;
        pythonImportsCheck = [ "akeyless" ];
        propagatedBuildInputs = with pkgs.python3Packages; [
          urllib3 python-dateutil pem certifi six psutil
        ];
        description = "Akeyless Python SDK - auto-generated Python client for the Akeyless API";
      };
      devShells.default = pkgs.mkShellNoCC {
        packages = with pkgs; [ python3 python3Packages.pip ];
      };
    });
}
