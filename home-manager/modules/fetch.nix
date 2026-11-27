{ pkgs, inputs, ... }: 

{
  imports = [ inputs.areofyl-fetch.homeManagerModules.default ];
  
  programs.fetch = {
      enable = true;
      labelColor = "red";
      info = [
          "os"
              "host"
              "kernel"
              "uptime"
              "cpu"
              "gpu"
              "wm"
              "theme"
              "icons"
              "terminal"
              "shell"
      ];
      speed = 0.8;
      spin = "xy";
  };

}
