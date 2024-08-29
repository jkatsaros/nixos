{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    cups-filters
  ];

  services.printing.enable = true;
  
  services.avahi.enable = true;
  services.avahi.nssmdns4 = true;
  services.avahi.openFirewall = true;
}
