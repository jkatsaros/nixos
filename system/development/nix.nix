{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    alejandra
    deadnix
    statix
  ];
}
