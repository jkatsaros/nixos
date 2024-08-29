{ pkgs, ... }:

{
  home.packages = with pkgs; [
    pkgs.discord
  ];
}
