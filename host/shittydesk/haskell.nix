{pkgs, ...}: let haskellPkg = pkgs.haskellPackages.ghcWithPackages (pkgs: with pkgs; [ cabal-install haskell-language-server ]); in {environment.systemPackages = [haskellPkg];} 
