{config, pkgs, ... }:
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

  nixowos.enable = true;
  services.xserver.videoDrivers = ["nvidia"];

  hardware = {
    graphics.enable = true;
    nvidia = {
      open = true;
      modesetting.enable = true;
      nvidiaSettings = true;
      powerManagement.enable = false;
      package = config.boot.kernelPackages.nvidiaPackages.stable; # Same as production
    };
  };
  hardware.nvidia.prime = {
    intelBusId = "PCI:00:02:0";
    nvidiaBusId = "PCI:01:0:0";
  };

  users.users.nix = {
    isNormalUser = true;
    description = "nix";
    extraGroups = [ "networkmanager" "wheel" ];
  };

  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [

    openttd-jgrpp
      wl-clipboard
      cowsay
      lolcat

      vieb
      firefox
      gimp
      foot
      nautilus

      gcc
      tree-sitter
      wget
      gnumake

      python3
      lua
      cargo
      rust-analyzer
      rustup
      lua-language-server
      bash-language-server
      nil

      xwayland-satellite
      polybar
      waybar
      rofi
      fuzzel
      picom
      arandr
      swaylock
      cmatrix
      feh
      swww

      wf-recorder
      ffmpeg
      simplescreenrecorder
      mpv
      pavucontrol
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
  services.xserver = {
    enable = true;
    desktopManager = {
      xterm.enable = false;
      xfce= {
        enable = true;
        noDesktop = true;
      };
    };
    windowManager.i3.enable = true;
  };
  services.displayManager.ly.enable = true;

  nixpkgs.overlays = [
    (import (builtins.fetchTarball {
             url = "https://github.com/nix-community/neovim-nightly-overlay/archive/master.tar.gz";
             }))
  ];

  programs.niri.enable = true;

  programs.virt-manager.enable = true;
  users.groups.libvirtd.members = ["nix"];
  virtualisation.libvirtd.enable = true;
  virtualisation.spiceUSBRedirection.enable = true;

  system.stateVersion = "25.05"; # Did you read the comment?
}


