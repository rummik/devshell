{ buildGoModule }:
let
  # Small src cleaner.
  source = import ../nix/source.nix;
in
buildGoModule {
  pname = "devshell";
  version = "0+git";
  src = source.filter {
    path = ./.;
    allow = [
      ./go.mod
      ./go.sum
      ./cmd
      ./config
      (source.matchExt "go")
    ];
  };
  vendorSha256 = "sha256-NFsQoPDXEeOmyLR2bCgKuRHw2sjhGQbUmHV8bMJzANw=";
}
