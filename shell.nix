{ pkgs ? (import <nixpkgs> {}), haskellPackages ? pkgs.haskellPackages_ghc782
, hsDevTools ? pkgs.hsDevTools }:

let inherit (haskellPackages) cabal exceptions filepath resourcet transformers;
in
cabal.mkDerivation (self: {
  pname = "temporary-resourcet";
  version = "1.2.0.3";
  src = ./.;
  buildDepends = [ exceptions filepath resourcet transformers ];
  buildTools = hsDevTools haskellPackages;
  meta = {
    homepage = "http://www.github.com/ttuegel/temporary-resourcet";
    description = "Portable temporary files and directories with automatic deletion";
    license = self.stdenv.lib.licenses.bsd3;
    platforms = self.ghc.meta.platforms;
  };
})
