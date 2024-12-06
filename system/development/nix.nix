{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    nil
    alejandra
    deadnix
    statix
  ];
}
