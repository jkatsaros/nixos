{ allowed-unfree-packages, config, lib, pkgs, ... }:

{
  imports = [
    ./user/fonts/fonts.nix
    ./user/app/git/git.nix
    ./user/lang/zig/zig.nix
    ./user/lang/rust/rust.nix
    ./user/lang/cc/cc.nix
    ./user/lang/lua/lua.nix 
    ./user/lang/go/go.nix
    ./user/app/social/social.nix
    ./user/app/media/media.nix
    ./user/app/utilities/utilities.nix
    ./user/app/terminal/terminal.nix
    ./user/app/nvim/nvim.nix
    ./user/app/browsers/librewolf.nix
    ./user/app/utilities/mucommander.nix
  ];

  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "katsa";
  home.homeDirectory = "/home/katsa";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.05"; # Please read the comment before changing.

  nixpkgs.config = {
    allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) allowed-unfree-packages;
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
