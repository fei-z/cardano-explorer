{ system, compiler, flags, pkgs, hsPkgs, pkgconfPkgs, ... }:
  {
    flags = { ipv6 = false; };
    package = {
      specVersion = "1.10";
      identifier = { name = "network-mux"; version = "0.1.0.0"; };
      license = "Apache-2.0";
      copyright = "2019 Input Output (Hong Kong) Ltd.";
      maintainer = "duncan@well-typed.com, marcin.szamotulski@iohk.io, marc.fontaine@iohk.io, karl.knutsson@iohk.io, alex@well-typed.com";
      author = "Duncan Coutts, Marc Fontaine, Karl Knutsson, Marcin Szamotulski, Alexander Vieth";
      homepage = "";
      url = "";
      synopsis = "Multiplexing library";
      description = "";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs.base)
          (hsPkgs.typed-protocols)
          (hsPkgs.io-sim-classes)
          (hsPkgs.contra-tracer)
          (hsPkgs.array)
          (hsPkgs.binary)
          (hsPkgs.bytestring)
          (hsPkgs.cborg)
          (hsPkgs.network)
          (hsPkgs.process)
          (hsPkgs.time)
          ];
        };
      tests = {
        "test-network-mux" = {
          depends = [
            (hsPkgs.base)
            (hsPkgs.typed-protocols)
            (hsPkgs.typed-protocols-cbor)
            (hsPkgs.io-sim-classes)
            (hsPkgs.io-sim)
            (hsPkgs.contra-tracer)
            (hsPkgs.array)
            (hsPkgs.binary)
            (hsPkgs.bytestring)
            (hsPkgs.cborg)
            (hsPkgs.containers)
            (hsPkgs.hashable)
            (hsPkgs.network)
            (hsPkgs.process)
            (hsPkgs.QuickCheck)
            (hsPkgs.splitmix)
            (hsPkgs.serialise)
            (hsPkgs.stm)
            (hsPkgs.tasty)
            (hsPkgs.tasty-quickcheck)
            (hsPkgs.tasty-hunit)
            (hsPkgs.time)
            ];
          };
        };
      };
    } // {
    src = (pkgs.lib).mkDefault (pkgs.fetchgit {
      url = "https://github.com/input-output-hk/ouroboros-network";
      rev = "da6da94d26e72551e591eabfce99b01c7c70933c";
      sha256 = "1p8759nrf06qb437drgg741vcg8rfav07m919h91g6kkq5rji306";
      });
    postUnpack = "sourceRoot+=/network-mux; echo source root reset to \$sourceRoot";
    }