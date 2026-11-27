{ config, pkgs, ... }: 

{
    imports = [
        ../wayland-wm-pkgs.nix
        ../themes/init.nix
    ];

    home.packages = with pkgs; [
        hyprland
        xdg-desktop-portal-hyprland
    ];
}
