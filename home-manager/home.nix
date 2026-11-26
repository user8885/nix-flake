{ config, pkgs, lib, ... }: 

{

  imports = [
    ./modules/term-shell/init.nix
    ./modules/fetch.nix
    ./modules/de-wm/hyprland.nix
    ./xdg-config.nix
  ];
  disabledModules = [
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

      XDG_DATA_DIRS = "/var/lib/flatpak/exports/share:$HOME/.local/share/flatpak/exports/share:$HOME/.nix-profile/share";
      XDG_DATA_HOME = "$HOME/.local/share/";
      XDG_STATE_HOME = "$HOME/.local/state/";
      XDG_CONFIG_HOME = "$HOME/.config/";
      XDG_CACHE_HOME = "$HOME/.cache";

      _JAVA_OPTIONS = "-Djava.util.prefs.userRoot='$XDG_CONFIG_HOME'/java";
      GNUPGHOME = "$XDG_DATA_HOME/gnupg";

      QT_QPA_PLATFORMTHEME = "qt6ct";
    };

    packages = with pkgs; [
        brave
            mpv
            spotify
            keepassxc
            qbittorrent

            pulsemixer
            btop
            yazi
            neovim
            zoxide
            fastfetch
            eza
            starship
            dwt1-shell-color-scripts
            wl-clipboard
            xclip
            wget
            git
            unzip

            nerd-fonts.jetbrains-mono
            ];
    };

    services.home-manager.autoUpgrade = {
        enable = true;
        useFlake = true;
        flakeDir = "/home/user/nix-flake/";
        frequency = "weekly";
        preSwitchCommands = [ "nix flake update" ];
    };
}
