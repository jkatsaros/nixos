{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    (writeScriptBin "sudo" ''exec doas "$@"'')
  ];

  security.doas.enable = true;
  security.sudo.enable = false;

  security.doas.extraRules = [{
    users = [
      "katsa"
    ];

    keepEnv = true;
    persist = true;
  }];
}
