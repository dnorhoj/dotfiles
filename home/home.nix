{ config, pkgs, ... }: {
  # Home Manager setup
  home.username = "dnorhoj";
  home.homeDirectory = "/home/dnorhoj";

  # Packages
  home.packages = with pkgs; [
    # Terminal helpers
    neofetch
    eza
    htop
    neovim
    bat
    ripgrep
    fd
    glow
    rlwrap

    # Terminal tools
    strace
    ltrace
    netcat-openbsd
    socat
    binwalk
    exiftool
    pwndbg
    pandoc

    # Technical GUI tools
    ghidra-bin
    wireshark

    # Apps
    vscode
    discord
    spotify
    signal-desktop

    audacity
    gnome-tweaks

    # Dev
    nixpkgs-fmt
    rustup
    gh

    # GUI
    transmission_4
    obsidian
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

  # Enable syncthing for file synchronization
  services.syncthing = {
    enable = true;
    tray.enable = true;
  };
}
