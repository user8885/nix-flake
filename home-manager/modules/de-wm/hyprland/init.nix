{ ... }:
{
    imports = [
    ./hyprland.nix
    ../misc-wc-mods/pkgs.nix
    ];
    
    disabledModules = [
    ../misc-wc-mods/swayidle.nix
    ];
}
