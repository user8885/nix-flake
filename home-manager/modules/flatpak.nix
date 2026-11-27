{ config, lib, pkgs, inputs, flatpak, ... }:

{
    imports = [ flatpak ];

    services.flatpak.enable = true;
    services.flatpak.packages = [
        "app.zen_browser.zen"
        "com.vysp3r.ProtonPlus"
    ];
}
