{}:

let

common-src = builtins.fetchTarball {
    name = "common-2023-10-23";
    url = https://github.com/avanov/nix-common/archive/fdedd6a87d37972ca62ccfbe4f98190ed712a7bf.tar.gz;
    # Hash obtained using `nix-prefetch-url --unpack <url>`
    sha256 = "sha256:1dimd334ay4jx4n81n5ms8p4i9kpyn0z7mm8xa0kcy2cpdlbq798";
};

overlays = import ./overlays.nix {};
pkgs     = (import common-src { projectOverlays = [ overlays.globalPackageOverlay ]; }).pkgs;

in

{
    inherit pkgs;
}
