{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    git
    lazygit
    soft-serve
    radicle-httpd
    radicle-node
    radicle-explorer
  ];
}
