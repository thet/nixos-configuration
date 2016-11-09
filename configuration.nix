# Help: configuration.nix(5) man page, NixOS manual (‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Use the systemd efi boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.timeout = 2;
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

  programs = {
    ssh.startAgent = true;
    ssh.forwardX11 = false;
    bash.enableCompletion = true;
  };

  # Enable the X11 windowing system.
  services = {
    # openssh.enable = true;
    xserver = {
      enable = true;
      layout = "us";
      xkbOptions = "eurosign:e";
      # synaptics = {
      #   enable = true;
      #   palmDetect = true;
      #   tapButtons = false;
      #   twoFingerScroll = true;
      # };
      libinput = {
        enable = true;
        disableWhileTyping = true;
        naturalScrolling = true;
        tapping = false;
        # scrollMethod = 'twofinger';
        horizontalScrolling = true;
      };
      windowManager.awesome.enable = true;
      # displayManager.gdm.enable = true;
      displayManager.slim.enable = true;
      desktopManager.gnome3.enable = true;
      videoDrivers = [ "intel" ];
    };
    gnome3 = {
        evolution-data-server.enable = true;
        gnome-documents.enable = true;
        gnome-keyring.enable = true;
        gnome-online-accounts.enable = true;
        gvfs.enable = true;
        sushi.enable = true;
    };
    locate.enable = true;
    printing.enable = true;
  };
  nixpkgs.config.allowUnfree = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.groups.thet = {
    name = "thet";
    gid = 1000;
  };
  users.users.thet = {
    isNormalUser = true;
    uid = 1000;
    group = "users";
    extraGroups = ["thet"];
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
    # gimp

    # vim
    vimHugeX
    qvim
    neovim
    neovim-pygui
    neovim-qt

    # system
    acpitool
    ag
    alsaLib
    alsaPlugins
    alsaUtils
    ant
    autoconf
    automake
    bazaar
    bazaarTools
    cmake
    colordiff
    cpufrequtils
    ctags
    file
    gcc
    gdb
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
    # texLiveFull
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

    gnome3.gnome_session
    gnome3.gnome-disk-utility
    paper-gtk-theme

    nodejs
    # python27Full
    # python27Packages.virtualenv
    # python27Packages.pip
    gparted
    nox
    pidgin
    pidginotr
    man
    stdmanpages
    efibootmgr

    # termit
    libvterm
    gnome3.gtk

  ];

  fonts = {
    enableFontDir = true;
    enableGhostscriptFonts = true;
    fonts = [
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
