{ config, pkgs, ... }: 

{
    imports = [
        ../themes/init.nix
    ];

    home.packages = with pkgs; [
        hyprland
        xdg-desktop-portal-hyprland
    ];
}
