{ pkgs, ... }: {
  imports = [
    ./home.nix # todo - split up
    ./config/default.nix
    ./dev/default.nix
  ];

  home.stateVersion = "24.05"; # Read documentation before changing
  programs.home-manager.enable = true;
}
