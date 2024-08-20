{ allowed-unfree-packages, config, lib, pkgs, ... }:

{
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

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    pkgs.discord
    pkgs.tutanota-desktop
    pkgs.bitwarden-desktop
    pkgs.signal-desktop
    pkgs.kitty
    pkgs.jetbrains.clion
    pkgs.jetbrains.datagrip
    pkgs.jetbrains.dataspell
    pkgs.jetbrains.gateway
    pkgs.jetbrains.goland
    pkgs.jetbrains.idea-ultimate
    pkgs.jetbrains.phpstorm
    pkgs.jetbrains.pycharm-professional
    pkgs.jetbrains.rider
    pkgs.jetbrains.ruby-mine
    pkgs.jetbrains.rust-rover
    pkgs.jetbrains.webstorm
    pkgs.jetbrains.writerside
    pkgs.yt-dlp
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/katsa/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  programs.git = {
    enable = true;
    userName = "Jason Katsaros";
    userEmail = "katsarjp@tutanota.com";
    extraConfig = {
      init.defaultBranch = "main";
    };
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      ll = "ls -l";
      update = "sudo nixos-rebuild switch --flake ~/.dotfiles & home-manager switch --flake ~/.dotfiles & nix flake update ~/.dotfiles";
    };
    history = {
      size = 10000;
      path = "${config.xdg.dataHome}/zsh/history";
    };
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" ];
    };
  };
}
