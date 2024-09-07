{ pkgs, ... }:

{
  home.packages = with pkgs; [
    git
    lazygit
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
        "/home/katsa/.config/nvim"
        "/home/katsa/.config/nvim/.git"
        "/home/katsa/Repositories/*"
        "/home/katsa/Repositories/*/.git"
      ];
    };
  };
}
