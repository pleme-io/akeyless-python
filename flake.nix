{
  description = "Akeyless Python SDK - auto-generated Python client for the Akeyless API";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    substrate = { url = "github:pleme-io/substrate"; inputs.nixpkgs.follows = "nixpkgs"; };
    flake-utils.url = "github:numtide/flake-utils";
  };
  outputs = inputs: (import "${inputs.substrate}/lib/repo-flake.nix" {
    inherit (inputs) nixpkgs flake-utils;
  }) {
    self = inputs.self;
    language = "python";
    builder = "package";
    pname = "akeyless";
    propagatedBuildInputs = [ "urllib3" "python-dateutil" "pem" "certifi" "six" "psutil" ];
    pythonImportsCheck = [ "akeyless" ];
    description = "Akeyless Python SDK - auto-generated Python client for the Akeyless API";
  };
}
