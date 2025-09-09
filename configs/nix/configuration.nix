{config, pkgs, lib, ... }:
# let
# home-manager = builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/release-25.05.tar.gz";
# in
let
nixowos = import (builtins.fetchGit {
    url = "https://github.com/yunfachi/nixowos";
    });
in
{
  imports =
    [ # Include the results of the hardware scan.
    ./hardware-configuration.nix
      nixowos.nixosModules.default
# (import "${home-manager}/nixos")
    ];

  boot.loader.systemd-boot.enable = true;
  services.displayManager.enable = true;
  networking.hostName = "nixos"; # Define your hostname.
    networking.networkmanager.enable = true;
  time.timeZone = "Europe/Oslo";
  i18n.defaultLocale = "nb_NO.UTF-8";

  services.xserver.xkb = {
    layout = "no";
    variant = "nodeadkeys";
  };
  console.keyMap = "no";
  services.printing.enable = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixowos.enable = true;

  programs.steam.enable = true;
  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;

  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };
  services.xserver = {
    enable = true;
    videoDrivers = [ "nvidia" ];
    displayManager.startx.enable = true;
  };
  hardware.nvidia = {
    open = true;
    modesetting.enable = true;
    nvidiaSettings = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
    prime = {
      intelBusId = "PCI:00:02:0";
      nvidiaBusId = "PCI:01:0:0";
    };
  };

  boot.kernelModules = [ "nvidia" "nvidia_modeset" "nvidia_uvm" "nvidia_drm" ];
  boot.extraModprobeConfig = ''
    options nvidia-drm modeset=1
    '';
  boot.blacklistedKernelModules = [ "nouveau" ];

  users.users.nix = {
    isNormalUser = true;
    description = "nix";
    extraGroups = [ "networkmanager" "wheel" ];
  };

  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [

    openttd-jgrpp
      wl-clipboard
      fbcat

      vieb
      irssi
      scli
      firefox
      gimp
      foot
      nautilus

      gcc
      tree-sitter
      wget
      gnumake

      lua
      cargo
      rust-analyzer
      rustup
      lua-language-server
      pandoc
      bash-language-server
      nil

      xwayland-satellite
      waybar
      fuzzel
      picom
      swaylock
      cmatrix
      swww

      wf-recorder
      ffmpeg
      mpv
      pulsemixer

      vim
      neovim
      fzf
      git
      tmux
      nix-output-monitor
      ripgrep
      fd
      cron
      at
      zip
      unzip
      hyfetch
      fastfetch
      btop
      bat
      ];
  services.displayManager.ly.enable = true;

  nixpkgs.overlays = [
    (import (builtins.fetchTarball {
             url = "https://github.com/nix-community/neovim-nightly-overlay/archive/master.tar.gz";
             }))
  ];
  fonts.packages = with pkgs; [
    nerd-fonts.iosevka
  ];
  environment.sessionVariables = {
    QT_FONT_DPI = "96";
    QT_QPA_PLATFORMTHEME = "gtk2";
    QT_STYLE_OVERRIDE = "gtk2";
    QT_FONT_NAME = "Iosevka Nerd Font 14";
    GTK_FONT_NAME = "Iosevka Nerd Font 14";
  };

  programs.niri.enable = true;

  programs.virt-manager.enable = true;
  users.groups.libvirtd.members = ["nix"];
  virtualisation.libvirtd.enable = true;
  virtualisation.spiceUSBRedirection.enable = true;

  system.stateVersion = "25.05"; # Did you read the comment?
}
