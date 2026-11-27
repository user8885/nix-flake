{ pkgs, lib, ...}:
{
  programs.kitty = {
      enable = true;
      shellIntegration.enableFishIntegration = true;
      font = {
          name = "JetBrainsMono Nerd Font";
          size = 12;
      };

      settings = {
          theme = "dracula";
          include = "Catppuccin-Mocha.conf";
          remember_window_size = "no";
          confirm_os_window_close = "0";
          background_opacity = "0.75";

      };

  };
}
