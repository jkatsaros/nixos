{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    rustup
    rust-analyzer
    rustfmt
    rustlings
  ];
}
