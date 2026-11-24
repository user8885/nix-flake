{ config, pkgs, ... }:

{
  # programs.virt-manager.enable = true;
  # users.groups.libvirtd.members = ["user"];
  # virtualisation.libvirtd.enable = true;
  # virtualisation.spiceUSBRedirection.enable = true;

  # services.searx = {
  #   enable = true;
  #   redisCreateLocally = true;
  #   settings.server = {
  #     bind_address = "192.168.5.197";
  #     port = 8091;
  #     # WARNING: setting secret_key here might expose it to the nix cache
  #     # see below for the sops or environment file instructions to prevent this
  #     secret_key = "fuckYouDotGovSlashYaMama"; 
  #   };
  # };
  

  # Enable the X11 windowing system.
  services.xserver.enable = true;
  # Enable/Disable display manager DISABLE TO BOOT TO TTY MUST BE LIGHTDM WTH??
  services.xserver.displayManager.lightdm.enable = false;

  # Enable automatic login for the user.
  #services.displayManager.autoLogin.enable = true;
  #services.displayManager.autoLogin.user = "user";

  services.udev.extraRules = ''
    ACTION=="add", SUBSYSTEM=="usb", DRIVERS=="usb", ATTRS{idVendor}=="046d", ATTRS{idProduct}=="c548", ATTR{power/wakeup}="disabled"
  '';

  services.gvfs.enable = true; # Mount, trash, and other functionalities
  services.tumbler.enable = true; # Thumbnail support for images

  # bluetooth 
  hardware.bluetooth.enable = true; # enables support for Bluetooth
  hardware.bluetooth.powerOnBoot = true; # powers up the default Bluetooth controller on boot
  services.blueman.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    options = "caps:swapescape";
    variant = "";
  };


  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;
}
