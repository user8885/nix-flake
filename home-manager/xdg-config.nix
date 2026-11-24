{ config, ... }:

{
    xdg.configFile = { 
        "fish".source = ../config/fish;
        "cosmic".source = ../config/cosmic;
        "niri".source = ../config/niri;
        "hypr".source = ../config/hypr;
        "waybar".source = ../config/waybar;
        "swaync".source = ../config/swaync;
        "yazi".source = ../config/yazi;
        "rofi".source = ../config/rofi;
        "fastfetch".source = ../config/fastfetch;
        "nvim".source = ../config/nvim;
        ".config/btop".source = ../config/btop;
        ".config/bspwm".source = ../config/bspwm;
        ".config/awesome".source = ../config/awesome;
        ".config/dm-scripts".source = ../config/dm-scripts;
        ".config/picom".source = ../config/picom;
        ".config/polybar".source = ../config/polybar;
        ".config/qtile".source = ../config/qtile;
        ".config/sway".source = ../config/sway;
        ".config/sxhkd".source = ../config/sxhkd;
    };


    home.file = {
        ".local/bin".source = ../scripts/bin;
    };

}
