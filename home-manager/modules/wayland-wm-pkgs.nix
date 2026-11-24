{ config, pkgs, ... };
{
    home.packages = with pkgs; [
        rofi-wayland
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
        nwg-look
        kdePackages.qt6ct
        libsForQt5.qtstyleplugin-kvantum
    ];
}
