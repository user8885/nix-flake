{ config, pkgs, ... }: 

{
    imports = [
        ../wayland-wm-pkgs.nix
        ../themes/dracula.nix
    ];

    home.packages = with pkgs; [
        hyprland
        xdg-desktop-portal-hyprland
    ];
}
