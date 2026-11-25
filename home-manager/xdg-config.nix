{ config, ... }:

let
flakeDir = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nix-flake";
configDir = "${flakeDir}/config/";
in {
        xdg.configFile = { 
            "hypr".source = "${flakeDir}/config/hypr";
            "fish".source = "${flakeDir}/config/fish";
            "kitty/Catppuccin-Mocha.conf".source = "${flakeDir}/config/kitty/Catppuccin-Mocha.conf";
            "cosmic".source = "${flakeDir}/config/cosmic";
            "niri".source = "${flakeDir}/config/niri";
            "waybar".source = "${flakeDir}/config/waybar";
            "swaync".source = "${flakeDir}/config/swaync";
            "yazi".source = "${flakeDir}/config/yazi";
            "rofi".source = "${flakeDir}/config/rofi";
            "fastfetch".source = "${flakeDir}/config/fastfetch";
            "nvim".source = "${flakeDir}/config/nvim";
            "btop".source = "${flakeDir}/config/btop";
            "bspwm".source = "${flakeDir}/config/bspwm";
            "awesome".source = "${flakeDir}/config/awesome";
            "dm-scripts".source = "${flakeDir}/config/dm-scripts";
            #picom".source = "${flakeDir}onfig/picom";
            "polybar".source = "${flakeDir}/config/polybar";
            "qtile".source = "${flakeDir}/config/qtile";
            "sway".source = "${flakeDir}/config/sway";
            "sxhkd".source = "${flakeDir}/config/sxhkd";
        };


    home.file = {
        ".local/bin".source = "${flakeDir}/scripts/bin";

    };

}
