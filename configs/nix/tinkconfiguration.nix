{ config, pkgs, ... }:

let
nixowos = import (builtins.fetchGit {
    url = "https://github.com/yunfachi/nixowos";
    });
in


{
  imports =
    [
    ./hardware-configuration.nix
      nixowos.nixosModules.default
    ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

#modules and stuff
  nixowos.enable = true;

  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";
  boot.loader.grub.useOSProber = true;

  networking.networkmanager.enable = true;
  time.timeZone = "Europe/Oslo";
  i18n.defaultLocale = "nb_NO.UTF-8";
  networking.hostName = "alice";
  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;

  console.keyMap = "no";
  users.users.alice = {
    isNormalUser = true;
    description = "alice";
    extraGroups = [ "networkmanager" "wheel" ];
  };

  environment.systemPackages = with pkgs; [

#editor and it's dependencies
    neovim

##lsp stuff and languages
      lua
      lua-language-server
      bash-language-server
      nil

#terminal tools
      tmux
      fzf
      fd
      ripgrep

      git
      curl
      wget

      fbcat
      ffmpeg

#testing

#communication
      scli
      irssi

      ];

  environment.etc."issue".text = ''
    Welcome to the Alice machine with NixOS
    Date: \d
    Kernel: \r (\l)
    __________________________________________
    '';

# fonts.packages = with pkgs; [ terminus_font ];
# console = {
# font = "${pkgs.terminus_font}/share/consolefonts/ter-112n.psf.gz";
# };

# overlays

  nixpkgs.overlays = [
    (import (builtins.fetchTarball {
             url = "https://github.com/nix-community/neovim-nightly-overlay/archive/master.tar.gz";
             }))
  ];

  system.stateVersion = "25.05";
}
