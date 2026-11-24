{ config, pkgs, lib, ... }: 

{

  imports = [
    ./xdg-config.nix
  ];
  disabledModules = [
    ./modules/hyprland.nix
    ./modules/gnome.nix
  ];
  
  nixpkgs.config.allowUnfree = true;

  programs.home-manager.enable = true;

  programs.git = {
    enable = true;
    settings.user.name = "user8885";
    settings.user.email = "takodajhorton@protonmail.com";
  };
  
  #programs.bash = {
  #  enable = true;
  #  initExtra = ''
  #    if [ -f $HOME/.config/bash/bashrc ];
  #    then
  #      source $HOME/.config/bash/bashrc
  #    fi
  #  '';
  #};

  #programs.ghostty = {
  #  enable = true;
  #  enableBashIntegration = true;
  #  settings = {
  #    theme = "Dracula";
  #    font-size = 11;
  #    font-family = "JetBrainsMono Nerd Font";
  #    confirm-close-surface = false;
  #    background-opacity = 0.85;
  #    keybind = [
  #    ];
  #  };
  #};

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
      PATH = "$HOME/.local/bin:$HOME/nix/scripts/dm-scripts:$PATH";
    };

    packages = with pkgs; [
      # gui
      brave
      mpv
      spotify
      keepassxc
      qbittorrent

      # cli/tui
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

      # Other
      gcc
      nerd-fonts.jetbrains-mono
    ];
	};
}
