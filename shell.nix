{ sources ? import ./nix {} }:
let
  inherit (sources)
    talismanpkgs
    nixpkgs
  ;
in
nixpkgs.mkShell rec {
  name = "casa";
  env = nixpkgs.buildEnv { name = name; paths = buildInputs; };
  buildInputs = [
    # <talismanpkgs>
    talismanpkgs.jq_1_6
    talismanpkgs.nodejs_12_18_3
    talismanpkgs.python_3_7
    # <nixpkgs>
    # ...
  ];
}