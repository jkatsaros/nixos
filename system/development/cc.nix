{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    gcc
    gnumake
    cmake
    autoconf
    automake
    libtool
  ];
}
