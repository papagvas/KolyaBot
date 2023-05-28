{nixpkgs ? import <unstable> { }}:
with nixpkgs;
haskell.lib.buildStackProject {
  name = "KolyaBot";
  ghc = haskell.compiler.ghc902;
}
