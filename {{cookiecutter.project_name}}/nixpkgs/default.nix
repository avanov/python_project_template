{}:

let

common-src = builtins.fetchTarball {
    name = "common-2024-11-10";
    url = https://github.com/avanov/nix-common/archive/494054da0259f925e1bcbd3cf6c276295c1b70a9.tar.gz;
    # Hash obtained using `nix-prefetch-url --unpack <url>`
    sha256 = "sha256:0pv79w1qh95cfi4jbspdshcs4kc9nyciscv6rq514xkkwdxmb6hs";
};

overlays = import ./overlays.nix {};
pkgs     = (import common-src { projectOverlays = [ overlays.globalPackageOverlay ]; }).pkgs;

in

{
    inherit pkgs;
}
