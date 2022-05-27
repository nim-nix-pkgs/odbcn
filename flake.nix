{
  description = ''ODBC abstraction for Nim'';

  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.ref   = "master";
  inputs.flakeNimbleLib.repo  = "nim-flakes-lib";
  inputs.flakeNimbleLib.type  = "github";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  
  inputs."odbcn-master".dir   = "master";
  inputs."odbcn-master".owner = "nim-nix-pkgs";
  inputs."odbcn-master".ref   = "master";
  inputs."odbcn-master".repo  = "odbcn";
  inputs."odbcn-master".type  = "github";
  inputs."odbcn-master".inputs.nixpkgs.follows = "nixpkgs";
  inputs."odbcn-master".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  inputs."odbcn-v0_1_1".dir   = "v0_1_1";
  inputs."odbcn-v0_1_1".owner = "nim-nix-pkgs";
  inputs."odbcn-v0_1_1".ref   = "master";
  inputs."odbcn-v0_1_1".repo  = "odbcn";
  inputs."odbcn-v0_1_1".type  = "github";
  inputs."odbcn-v0_1_1".inputs.nixpkgs.follows = "nixpkgs";
  inputs."odbcn-v0_1_1".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  inputs."odbcn-v0_1_2".dir   = "v0_1_2";
  inputs."odbcn-v0_1_2".owner = "nim-nix-pkgs";
  inputs."odbcn-v0_1_2".ref   = "master";
  inputs."odbcn-v0_1_2".repo  = "odbcn";
  inputs."odbcn-v0_1_2".type  = "github";
  inputs."odbcn-v0_1_2".inputs.nixpkgs.follows = "nixpkgs";
  inputs."odbcn-v0_1_2".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@inputs:
  let 
    lib  = flakeNimbleLib.lib;
    args = ["self" "nixpkgs" "flakeNimbleLib"];
  in lib.mkProjectOutput {
    inherit self nixpkgs;
    meta = builtins.fromJSON (builtins.readFile ./meta.json);
    refs = builtins.removeAttrs inputs args;
  };
}