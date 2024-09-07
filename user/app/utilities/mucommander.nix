{ pkgs, ... }:

{
  home.packages = with pkgs; [
    mucommander
  ];
}
