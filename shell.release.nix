{ sources ? import ./nix {} }:
let
  inherit (sources)
    toyboxpkgs
    nixpkgs
  ;
in
nixpkgs.mkShell rec {
  name = "release.casa";
  env = nixpkgs.buildEnv { name = name; paths = buildInputs; };
  buildInputs = [
    # <toyboxpkgs>
    toyboxpkgs.jq_1_6
    toyboxpkgs.nodejs_12_18_3
    toyboxpkgs.python_3_7
    # <nixpkgs>
    # ...
  ];
}