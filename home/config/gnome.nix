{ pkgs, ... }: 

let
  gtk-theme = {
    package = (pkgs.colloid-gtk-theme.override {
      themeVariants = [ "purple" ];
      colorVariants = [ "dark" ];
      tweaks = [ "dracula" ];
    });
    name = "Colloid-Purple-Dark-Dracula";
  };
in {
  dconf = {
    enable = true;
    settings = {
      "org/gnome/shell" = {
        disable-user-extensions = false;
        disabled-extensions = [];
        enabled-extensions = with pkgs.gnomeExtensions; [
          dash-to-dock.extensionUuid
          clipboard-indicator.extensionUuid
          steal-my-focus-window.extensionUuid
        ];
      };
      "org/gnome/desktop/input-sources" = {
        xkb-options = [ "caps:super" ];
      };
      "org/gnome/desktop/interface" = {
        clock-show-seconds = true;
        clock-show-weekday = true;
        color-scheme = "prefer-dark";
        enable-hot-corners = false;
        show-battery-percentage = true;
      };
      "org/gnome/desktop/wm/preferences" = {
        button-layout = "appmenu:minimize,maximize,close";
      };

      # Keybindings
      "org/gnome/desktop/wm/keybindings" = {
        switch-applications = [];
        switch-applications-backward = [];
        switch-windows = [ "<Alt>Tab" ];
        switch-windows-backward = [ "<Shift><Alt>Tab" ];
      };
      "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
        name = "Terminal";
        command = "gnome-terminal";
        binding = "<Control><Alt>t";
      };
      "org/gnome/settings-daemon/plugins/media-keys" = {
        custom-keybindings = [
          "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/"
        ];
      };

      # Extensions
      "org/gnome/shell/extensions/clipboard-indicator" = {
        toggle-menu = [ "<Super>y" ];
      };
      "org/gnome/shell/extensions/dash-to-dock" = {
        show-apps-at-top = true;
	show-trash = false;
      };
    };
  };

  gtk = {
    enable = true;

    theme = gtk-theme;

    iconTheme = {
      name = "Colloid-Purple-Dark";
      package = (pkgs.colloid-icon-theme.override {
        schemeVariants = [ "default" ];
        colorVariants = [ "purple" ];
      });
    };
  };

  programs.gnome-shell = {
    enable = true;

    extensions = with pkgs.gnomeExtensions; [
      { package = dash-to-dock; }
      { package = clipboard-indicator; }
      { package = steal-my-focus-window; }
    ];

    theme = gtk-theme;
  };
}
