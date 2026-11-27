{ config, pkgs, ... }:
{
    home.packages = with pkgs; [
        rofi
        waybar
        networkmanagerapplet
        swaynotificationcenter
        swayosd
        swaylock
        swaybg
        wlsunset
        grim
        slurp
        imv
        kdePackages.qt6ct
        libsForQt5.qtstyleplugin-kvantum
    ];
}
