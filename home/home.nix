{ config, pkgs, ... }: {
  #nixpkgs = {
  #  config = {
  #    allowUnfree = true;
  #  };
  #};

  # Home Manager setup
  home.username = "dnorhoj";
  home.homeDirectory = "/home/dnorhoj";

  # Packages
  home.packages = with pkgs; [
    # Terminal utils
    neofetch
    eza
    htop
    strace
    ltrace
    neovim
    bat
    ripgrep
    fd
    glow
    rlwrap
    socat
    netcat-openbsd

    # Apps
    vscode
    discord
    spotify

    wireshark
    gnome-tweaks

    # Dev
    rustup
  ];


  # Program configurations
  programs.git = {
    enable = true;

    userName = "Daniel Norhøj";
    userEmail = "daniel@dnorhoj.me";

    signing = {
      key = "daniel@dnorhoj.me";
      signByDefault = true;
    };

    extraConfig = {
      init = {
        defaultBranch = "main";
      };
    };
  };

  xdg.userDirs = {
    enable = true;
    extraConfig = {
      XDG_DOTFILES_DIR = "${config.home.homeDirectory}/.dotfiles";
    };
  };

  home.file = {
  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  };
}
