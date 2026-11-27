{ config, pkgs, lib, inputs, ... }: 

{

  imports = [
    ./modules/term-shell/init.nix
    ./modules/de-wm/hyprland/init.nix
    ./modules/fetch.nix
    ./xdg-config.nix
  ];
  disabledModules = [
    ./modules/flatpak.nix
    ./modules/de-wm/gnome.nix
  ];

  nixpkgs.config.allowUnfree = true;

  programs.home-manager.enable = true;

  programs.git = {
    enable = true;
    settings.user.name = "User8885";
    settings.user.email = "takodajhorton@protonmail.com";
  };

  # dconf.settings = {
  #   "org/virt-manager/virt-manager/connections" = {
  #     autoconnect = ["qemu:///system"];
  #     uris = ["qemu:///system"];
  #   };

  # };  

	home = {
	  username = "user";
	  homeDirectory = "/home/user";
	  stateVersion = "25.05";

    sessionVariables = {
      EDITOR = "nvim";
      MY_TERM = "kitty";
      PATH = "$HOME/.local/bin:$HOME/nix-flake/scripts/dm-scripts:$PATH";

      XDG_DATA_DIRS = lib.mkForce "/var/lib/flatpak/exports/share:$HOME/.local/share/flatpak/exports/share:/run/current-system/sw/share:$HOME/.nix-profile/share";
      XDG_DATA_HOME = lib.mkForce "/home/user/.local/share/";
      XDG_STATE_HOME = lib.mkForce "/home/user/.local/state/";
      XDG_CONFIG_HOME = lib.mkForce "/home/user/.config/";
      XDG_CACHE_HOME = lib.mkForce "/home/user/.cache/";

      _JAVA_OPTIONS = "-Djava.util.prefs.userRoot='$XDG_CONFIG_HOME'/java";
      GNUPGHOME = "$XDG_DATA_HOME/gnupg";

      QT_QPA_PLATFORMTHEME = "qt6ct";
    };

    packages = with pkgs; [
        firefox
        mpv
        spotify
        keepassxc
        qbittorrent
        thunar

        playerctl
        pulsemixer
        btop
        neovim
        zoxide
        fastfetch
        eza
        dwt1-shell-color-scripts
        wl-clipboard
        xclip
        wget
        git
        unzip

        nerd-fonts.jetbrains-mono
        nerd-fonts.iosevka
        iosevka
        ];
    };

    services.home-manager.autoUpgrade = {
        enable = true;
        useFlake = true;
        flakeDir = "/home/user/nix-flake/";
        frequency = "weekly";
        preSwitchCommands = [ "nix flake update" ];
    };

    nix.gc = {
        automatic = true;
        dates = "weekly"; # Runs every week at 03:15 by default
            options = "--delete-older-than 10d"; # Keeps generations older than 30 days
            persistent = true; # Runs missed collections after system sleep/shutdown
    };

}
