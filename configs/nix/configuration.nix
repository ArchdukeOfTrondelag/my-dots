{config, pkgs, ... }:
{
  imports =
    [ # Include the results of the hardware scan.
    ./hardware-configuration.nix
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


  hardware.graphics = {
    enable = true;
  };
  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;
    open = false;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };

  hardware.nvidia.prime = {
    intelBusId = "PCI:00:02:0";
    nvidiaBusId = "PCI:01:0:0";
  };

  users.users.nix = {
    isNormalUser = true;
    description = "nix";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
    ];
  };

  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [

    openttd-jgrpp

      vieb
      brave
      gimp
      kitty
      nautilus

      gcc
      tree-sitter
      wget
      gnumake

      lua
      lua-language-server
      bash-language-server

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

      neovim
      fzf
      git
      tmux
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
    displayManager.gdm.enable = true;
    desktopManager = {
      xterm.enable = false;
      xfce= {
        enable = true;
        noDesktop = true;
      };
    };
    windowManager.i3.enable = true;
  };

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


