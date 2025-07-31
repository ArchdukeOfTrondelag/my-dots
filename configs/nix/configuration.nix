{config, pkgs, ... }:
{
	imports =
		[ # Include the results of the hardware scan.
		./hardware-configuration.nix
		];
	programs.nh = {
		enable = true;
		clean.enable = true;
		clean.extraArgs = "--keep-since 4d --keep 3";
	};

	boot.loader.systemd-boot.enable = true;
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
		open = true;
		nvidiaSettings = true;
		package = config.boot.kernelPackages.nvidiaPackages.stable;
	};

	hardware.nvidia.prime = {
		intelBusId = "PCI:00:02:0";
		nvidiaBusId = "PCI:01:0:0";
	};


	users.users.pix = {
		isNormalUser = true;
		description = "pix";
		extraGroups = [ "networkmanager" "wheel" ];
		packages = with pkgs; [
		steam
		prismlauncher
		];
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

		fd
			zip
			unzip
			hyfetch
			fastfetch
			btop
			bat

			feh
			swww
			picom
			kitty
			cron
			at

			khal
			cmatrix
			gimp

			gcc
			vlang
			tree-sitter
			wget
			gnumake
			lua

			fzf
			neovim
			git
			tmux
			ripgrep

			vieb
			brave
			xwayland-satellite
			polybar
			waybar
			rofi
			fuzzel
			arandr
			swaylock

			wf-recorder
			simplescreenrecorder
			mpv

			openttd-jgrpp
			];

	services.xserver = {
		enable = true;
		displayManager.gdm.enable= true;
		desktopManager = {
			xterm.enable = false;
			xfce= {
				enable = true;
				noDesktop = true;
			};
		};
		windowManager.i3.enable = true;
	};

	programs.niri.enable = true;

	programs.virt-manager.enable = true;
	users.groups.libvirtd.members = ["nix"];
	virtualisation.libvirtd.enable = true;
	virtualisation.spiceUSBRedirection.enable = true;

	system.stateVersion = "25.05"; # Did you read the comment?

}


