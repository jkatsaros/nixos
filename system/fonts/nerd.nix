{ pkgs, lib, ... }:

{
  environment.systemPackages =  
    builtins.filter lib.attrsets.isDerivation (builtins.attrValues pkgs.nerd-fonts);
}
