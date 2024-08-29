{ pkgs, ... }:

{
  home.packages = with pkgs; [
    git
  ];

  programs.git = {
    enable = true;
    userName = "Jason Katsaros";
    userEmail = "katsarjp@tutanota.com";
    extraConfig = {
      init.defaultBranch = "main";
      safe.directory = [
        "/home/katsa/.dotfiles"
        "/home/katsa/.dotfiles/.git"
        "/home/katsa/Repositories/*"
        "/home/katsa/Repositories/*/.git"
      ];
    };
  };
}
