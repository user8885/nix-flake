{ config, pkgs, ... }: 

{
    imports = [
        ./wayland-wm-pkgs.nix
        ./wm-gtk-theme.nix
    ];

    home.packages = with pkgs; [
        hyprland
        xdg-desktop-portal-hyprland
    ];
}
