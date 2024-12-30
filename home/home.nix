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

  programs.gnome-terminal = {
    enable = true;
    profile.cfc932a7-9b84-427b-ba0a-3d3c0059622f = {
      default = true;
      visibleName = "Default";

      audibleBell = false;

      # Colors are from dracula/gnome-terminal
      colors = {
        backgroundColor = "#282A36";
        foregroundColor = "#F8F8F2";
        boldColor = "#6E46A4";
        palette = [ "#262626" "#E356A7" "#42E66C" "#E4F34A"
                    "#9B6BDF" "#E64747" "#75D7EC" "#EFA554"
                    "#7A7A7A" "#FF79C6" "#50FA7B" "#F1FA8C"
                    "#BD93F9" "#FF5555" "#8BE9FD" "#FFB86C" ];

      };
    };
  };

  programs.zsh = {
    enable = true;

    enableCompletion = false;

    shellAliases = {
      # eza
      ls = "eza";
      ll = "ls -alF";
      tree = "ls --tree";

      # nixos
      update = "sudo nixos-rebuild switch";
    };

    zplug = {
      enable = true;
      plugins = [
      	{ name = "zsh-users/zsh-syntax-highlighting"; }
      	{ name = "zsh-users/zsh-autosuggestions"; }
        { name = "chisui/zsh-nix-shell"; }
      ];
    };

    oh-my-zsh = {
      enable = true;
      plugins = [ "sudo" ];
    };
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };

  home.file = {
  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };
}
