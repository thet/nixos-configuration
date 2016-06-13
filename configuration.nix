# Help: configuration.nix(5) man page, NixOS manual (‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Use the gummiboot efi boot loader.
  boot.loader.gummiboot.enable = true;
  boot.loader.gummiboot.timeout = 2;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "thetair";     # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Select internationalisation properties.
  # i18n = {
  #   consoleFont = "lat9w-16";
  #   consoleKeyMap = "us";
  #   defaultLocale = "en_US.UTF-8";
  # };

  # Set your time zone.
  time.timeZone = "Europe/Vienna";

  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  # environment.systemPackages = with pkgs; [
  #   wget
  # ];

  # List services that you want to enable:

  # Enable the X11 windowing system.
  services = {
    # openssh.enable = true;
    printing.enable = true;
    xserver = {
      enable = true;
      layout = "us";
      xkbOptions = "eurosign:e";
      synaptics = {
        enable = true;
        palmDetect = true;
        tapButtons = false;
        twoFingerScroll = true;
      };
      # libinput = {
      #   enable = false;
      #   disableWhileTyping = true;
      #   naturalScrolling = true;
      #   tapping = false;
      #  # scrollMethod = 'twofinger';
      #   horizontalScrolling = true;
      # };
      windowManager.awesome.enable = true;
      displayManager.slim.enable = true;
      displayManager.slim.defaultUser = "thet";
      desktopManager.gnome3.enable = true;
    };
  };
  hardware.opengl.videoDrivers = [ "intel" ];
  nixpkgs.config.allowUnfree = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.extraUsers.thet = {
    isNormalUser = true;
    uid = 1000;
  };

  # The NixOS release to be compatible with for stateful data such as databases.
  system.stateVersion = "16.03";

  environment = {
    interactiveShellInit = ''
        export EDITOR="vim"
        export EMAIL=johannes@raggam.at
        export FULLNAME="Johannes Raggam"
        export PIP_DOWNLOAD_CACHE=$HOME/.pip_download_cache
        export NODE_PATH=$HOME/node_modules
    '';
  };

  # environment.gnome3.packageSet = pkgs.gnome3_20;

  environment.systemPackages = with pkgs; [

    # apps
    firefox
    chromium
    vlc
    skype
    redshift
    ranger
    arandr

    # vim
    vimHugeX
    qvim
    neovim
    neovim-pygui
    neovim-qt

    # system
    acpitool
    alsaLib
    alsaPlugins
    alsaUtils
    ant
    autoconf
    automake
    bazaar
    bazaarTools
    bc
    cmake
    colordiff
    cpufrequtils
    ctags
    ddrescue
    file
    gcc
    gdb
    gimp
    gitAndTools.gitFull
    gitAndTools.svn2git
    gitAndTools.tig
    gnumake
    gnupg
    graphviz
    gv
    hdparm
    htop
    imagemagick
    io
    lsof
    lua
    mercurial
    netcat
    networkmanager
    networkmanagerapplet
    nmap
    openvpn
    p7zip
    parted
    pavucontrol
    powertop
    python
    ruby
    screen
    sdparm
    subversion
    tcpdump
    telnet
    texLiveFull
    unetbootin
    unzip
    vlc
    wget
    which
    wpa_supplicant_gui
    xfontsel
    xorg.xbacklight
    xorg.xev
    xorg.xinput
    xorg.xkill
    xorg.xmessage
    xorg.xmodmap
    zip
    zsh

  ];

  fonts = {
    enableFontDir = true;
    enableGhostscriptFonts = true;
    extraFonts = [
       pkgs.ubuntu_font_family
       pkgs.terminus_font
       pkgs.anonymousPro
       pkgs.corefonts
       pkgs.freefont_ttf
       pkgs.ttf_bitstream_vera
       # pkgs.ttf_bitstream_vera_for_powerline
       pkgs.cantarell_fonts
       pkgs.dejavu_fonts
       pkgs.dosemu_fonts
       pkgs.liberation_ttf
       # pkgs.unifont
    ];
  };

}
