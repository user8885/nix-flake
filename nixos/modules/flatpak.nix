{ config, pkgs, lib, inputs, ... }:
{

    services.flatpak.enable = true;
    services.flatpak.packages = [
        "app.zen_browser.zen"
    ];

    services.flatpak.overrides.settings = {
        global = {
            Environment.GTK_THEME = "Adwaita:dark";
        };
    };

}

