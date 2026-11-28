{ config, pkgs, catp_pkg, inputs, ... }:

{
config = {
# keeps old behaviour ? i cant spell 
    gtk.gtk4.theme = config.gtk.theme;

    fonts.fontconfig = {
        enable = true;
        defaultFonts = {
            serif     = [ "JetBrainsMono Nerd Font" ];
            sansSerif = [ "JetBrainsMono Nerd Font" ];
            monospace = [ "JetBrainsMono Nerd Font" ];
        };
    };

    home.packages = [ catp_pkg ];

    home.sessionVariables.GTK_THEME = "catppuccin-mocha-flamingo-standard+default";

    gtk = {
        enable = true;

        theme = {
            name = "catppuccin-mocha-flamingo-standard+default";
        };

        font = {
            name = "JetBrainsMono Nerd Font";
            size = 11;
        };

        iconTheme = {
            name = "Papirus-Dark";
            package = pkgs.papirus-icon-theme;
        };

        cursorTheme = {
            name = "DMZ";
            package = pkgs.vanilla-dmz;
        };

        gtk3.extraConfig.gtk-application-prefer-dark-theme = true;
        gtk4.extraConfig.gtk-application-prefer-dark-theme = true;

    };

    home.file.".icons/default".source = "${pkgs.vanilla-dmz}/share/icons/DMZ-Black";

    home.file = {
# gets kvantum theme from the gtk theme package
# package = pkgs.catppuccin-mocha-flamingo-theme;
        ".config/Kvantum/kvantum.kvconfig".text = ''
            [General]
            theme=catppuccin-mocha-flamingo
                '';

        ".config/qt6ct/qt6ct.conf".text = ''
            [Appearance]
            custom_palette=false
                icon_theme=Papirus-Dark
                standard_dialogs=default
                style=kvantum-dark

                [Fonts]
                fixed="JetBrainsMono Nerd Font,11,-1,5,400,0,0,0,0,0,0,0,0,0,0,1,Regular"
                    general="JetBrainsMono Nerd Font,11,-1,5,400,0,0,0,0,0,0,0,0,0,0,1,Regular"

                    [Interface]
                    activate_item_on_single_click=1
                        buttonbox_layout=0
                        cursor_flash_time=1000
                        dialog_buttons_have_icons=1
                        double_click_interval=400
                        gui_effects=@Invalid()
                        keyboard_scheme=2
                        menus_have_icons=true
                        show_shortcuts_in_context_menus=true
                        stylesheets=@Invalid()
                        toolbutton_style=4
                        underline_shortcut=1
                        wheel_scroll_lines=3

                        [SettingsWindow]
                        geometry=@ByteArray(\x1\xd9\xd0\xcb\0\x3\0\0\0\0\0\0\0\0\0\0\0\0\x3\xa1\0\0\x3\xd0\0\0\0\0\0\0\0\0\0\0\x3\xa1\0\0\x3\xd0\0\0\0\0\x2\0\0\0\a\x80\0\0\0\0\0\0\0\0\0\0\x3\xa1\0\0\x3\xd0)

                            [Troubleshooting]
                            force_raster_widgets=1
                                ignored_applications=@Invalid()
                                '';
    };

    qt = {
        enable = true;
        platformTheme.name = "qt6ct";
        style.name = "kvantum";
    };
};
}
