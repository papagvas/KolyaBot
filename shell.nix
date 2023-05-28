{nixpkgs ? import <unstable> { }}:
with nixpkgs;
haskell.lib.buildStackProject {
  name = "KolyaBot";
  buildInputs = [ zlib ];
  ghc = haskell.compiler.ghc925;
}
