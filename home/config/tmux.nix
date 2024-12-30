{ pkgs, ... }: {
  programs.tmux = {
    enable = true;
    mouse = true;
    baseIndex = 1;
    plugins = with pkgs.tmuxPlugins; [
      sensible
      {
        plugin = dracula;
        extraConfig = ''
          set -g @dracula-plugins 'cpu-usage ram-usage'
          set -g @dracula-show-powerline true
          set -g @dracula-show-left-icon session
        '';
      }
    ];
  };
}
