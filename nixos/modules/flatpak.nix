{ config, pkgs, lib, inputs, ... }:

{
    services.flatpak.enable = true;
    services.flatpak.packages = [
    ];
    services.flatpak.overrides.settings = {
        global = {
            Environment.GTK_THEME = "Adwaita:dark";
        };
    };
}

