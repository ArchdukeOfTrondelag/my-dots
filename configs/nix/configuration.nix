{config, pkgs, ... }:
{
  imports =
    [ # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ];

  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";
  boot.loader.grub.useOSProber = true;

  networking.hostName = "nixos"; # Define your hostname.
    networking.networkmanager.enable = true;

  time.timeZone = "Europe/Oslo";
  i18n.defaultLocale = "nb_NO.UTF-8";

  services.xserver.xkb = {
    layout = "no";
    variant = "nodeadkeys";
  };

  programs.gnupg.agent = {
    enable = true;
    pinentryPackage = pkgs.pinentry-tty;
  };

  console.keyMap = "no";
  services.printing.enable = true;
  nix.settings.experimental-features = [ "nix-command" "flakes"];
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

  users.users.nix = {
    isNormalUser = true;
    description = "nix";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
    ];
  };

  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [

    xwayland-satellite

      fd
      zip
      unzip
      fbcat
      bat
      ripgrep
      pandoc
      gnumake

      cmatrix
      hyfetch
      fastfetch
      btop

      gcc
      lua
      rust-analyzer
      rustup
      cargo
      lua-language-server
      bash-language-server
      nil

      fzf
      neovim
      vim
      git
      tmux
      mpv

      cage
      mailutils
      openssl
      msmtp
      wf-recorder
      ffmpeg
      vieb
      qutebrowser
      foot
      fuzzel
      curl
      wget
      wl-clipboard
      swww
      ];

  programs.niri.enable = true;
  services.displayManager.ly.enable = true;
  nixpkgs.overlays = [
    (import (builtins.fetchTarball {
             url = "https://github.com/nix-community/neovim-nightly-overlay/archive/master.tar.gz";
             }))
  ];

  system.stateVersion = "25.05"; # Did you read the comment?

}
