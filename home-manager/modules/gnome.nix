{ config, pkgs, ... }: 

{
  home.packages = with pkgs; [
    # gnome
    gnome-tweaks
    gnomeExtensions.blur-my-shell
    gnomeExtensions.dash-to-dock
    gnomeExtensions.no-overview
    gnomeExtensions.launch-new-instance
    gnomeExtensions.arcmenu
  ];

  dconf.settings = {
    "org/gnome/desktop/peripherals/mouse" = {
      accel-profile = "flat";
      speed = 0.10000000000000001;
    };

    "org/gnome/desktop/interface" = {
      accent-color = "red";
      color-scheme  = "prefer-dark";
    };

    "org/gnome/desktop/input-sources" = {
      xkb-options = [ "caps:swapescape" ];
    };

    "org/gnome/desktop/wm/preferences" = {
      button-layout = "appmenu:minimize,maximize,close";
    };

    "org/gnome/shell" = {
      disable-user-extensions = false;
      enabled-extensions = [
        pkgs.gnomeExtensions.blur-my-shell.extensionUuid
        pkgs.gnomeExtensions.dash-to-dock.extensionUuid
        pkgs.gnomeExtensions.no-overview.extensionUuid
        pkgs.gnomeExtensions.launch-new-instance.extensionUuid
        pkgs.gnomeExtensions.arcmenu.extensionUuid
      ];
      favorite-apps = [
         "brave-browser.desktop" 
         "org.gnome.Nautilus.desktop" 
         "kitty.desktop" 
         "org.keepassxc.KeePassXC.desktop" 
         "spotify.desktop" 
         "steam.desktop" 
         "org.gnome.Settings.desktop"
      ];
    };

    "org/gnome/desktop/background" = {
      picture-uri = "file:///home/user/.config/wallpaper";
      picture-uri-dark = "file:///home/user/.config/wallpaper";
    };

    "org/gnome/settings-daemon/plugins/color" = {
      night-light-temperature = "uint32 3700";
      night-light-enabled = true;
    };


    "org/gnome/nautilus/icon-view" = {
      default-zoom-level = "small-plus";
    };
  };
}
