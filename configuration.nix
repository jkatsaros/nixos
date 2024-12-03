{ allowed-unfree-packages, config, lib, pkgs, ... }:

{
  imports = [
    ./system/hardware-configuration.nix
    ./system/hardware/network.nix
    ./system/hardware/time.nix
    ./system/hardware/printing.nix
    ./system/hardware/sound.nix
    ./system/hardware/bluetooth.nix
    ./system/security/firewall.nix
    ./system/security/automount.nix
    ./system/experimental.nix
    ./system/development/languages.nix
    ./system/games/games.nix
  ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Enable the X11 windowing system.
  # You can disable this if you're only using the Wayland session.
  services.xserver.enable = true;

  # Enable the KDE Plasma Desktop Environment.
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

  # Enable the KDE Plasma Remote Desktop Environment.
  services.xrdp.enable = true;
  services.xrdp.openFirewall = true;
  services.openssh.enable = true;

  environment.plasma6.excludePackages = [];

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  nixpkgs.config = {
    allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) allowed-unfree-packages;
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.katsa = {
    isNormalUser = true;
    description = "Jason Katsaros";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [ ];
    shell = pkgs.nushell;
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?
  system.autoUpgrade.enable = true;
  system.autoUpgrade.allowReboot = true;
}
