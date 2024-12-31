{ config, pkgs, ... }: {
  imports = [
    ./hardware-configuration.nix
  ];

  # Bootloader.
  boot = {
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;
    loader.timeout = 0;

    consoleLogLevel = 0;
    initrd.verbose = false;
    kernelParams = [
      "quiet"
      "splash"
      "boot.shell_on_fail"
      "loglevel=3"
      "rd.system.show_status=false"
      "rd.udev.log_level=3"
      "udev.log_priority=3"
    ];

    plymouth = {
      enable = true;
      themePackages = with pkgs; [ (adi1090x-plymouth-themes.override {selected_themes = [ "abstract_ring" ]; }) ];
      theme = "abstract_ring";
    };

    # Makes plymouth encryption password work??? idk.
    initrd.systemd.enable = true;
  };

  # Networking
  networking.hostName = "fr4m3w0rk"; # Define your hostname.
  networking.networkmanager.enable = true;

  # Region/time
  time.timeZone = "Europe/Copenhagen";
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8"; 
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Enable the X11 windowing system.
  services.xserver = {
    enable = true;

    # Enable the GNOME Desktop Environment.
    displayManager.gdm.enable = true;
    desktopManager.gnome = {
      enable = true;
      extraGSettingsOverridePackages = [ pkgs.mutter ];
      extraGSettingsOverrides = ''
        [org.gnome.mutter]
        experimental-features=['scale-monitor-framebuffer']
      '';
    };

    xkb = {
      layout = "custom";

      extraLayouts = {
        custom = {
          description = "English (US intl., with AltGr dead keys, danish)";
          languages = [ "eng" "dan" ];
          symbolsFile = ../xkb/custom;
        };
      };
    };
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # gnome keyring
  services.gnome = {
    gnome-keyring.enable = true;
  };

  # Enable sound with pipewire.
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default, no need to redefine it in your 
    # config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager). services.xserver.libinput.enable = true;

  # ZSH
  programs.zsh.enable = true;

  programs.zsh.ohMyZsh = {
    enable = true;
    plugins = [];
    theme = "agnoster";
  };

  # Users
  users.defaultUserShell = pkgs.zsh;

  users.users.dnorhoj = {
    isNormalUser = true;
    description = "Daniel Norhøj";
    extraGroups = [ "networkmanager" "wheel" "docker" ];
    packages = with pkgs; [
    ];
  };

  # Enable automatic login for the user.
  services.displayManager.autoLogin = {
    enable = true;
    user = "dnorhoj";
  };

  # Workaround for GNOME autologin: https://github.com/NixOS/nixpkgs/issues/103746#issuecomment-945091229
  systemd.services."getty@tty1".enable = false;
  systemd.services."autovt@tty1".enable = false;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run: $ nix search wget
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  environment.systemPackages = with pkgs; [
    neovim
    vim
    wget
    curl
    tmux
    git
    gcc
    python3
  ];

  # Packages
  programs.firefox.enable = true;

  # Docker
  virtualisation.docker.enable = true;

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  # List services that you want to enable:

  system.stateVersion = "24.11";
}
