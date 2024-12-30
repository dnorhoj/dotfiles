{ pkgs, ... }: {
  imports = [
    ./gnome.nix
    ./tmux.nix
    ./terminal.nix
  ];
}
