# used for `nix-shell https://github.com/leanprover/lean4/archive/master.tar.gz -A nix`
# { nix = (import ./shell.nix {}).nix; } //
(import (
  let
    lock = builtins.fromJSON (builtins.readFile ./flake.lock);
  in fetchTarball {
    url = "https://github.com/edolstra/flake-compat/archive/${lock.nodes.flake-compat.locked.rev}.tar.gz";
    sha256 = lock.nodes.flake-compat.locked.narHash; }
) {
  src =  ./.;
}).defaultNix
