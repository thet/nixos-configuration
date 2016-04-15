# Help: configuration.nix(5) man page, NixOS manual (‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Use the gummiboot efi boot loader.
  boot.loader.grub.enable = false;
  boot.loader.gummiboot.enable = true;
  boot.loader.gummiboot.timeout = 2;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "luft"; # Define your hostname.
  networking.connman.enable = true;  # Enables wireless.

  # Select internationalisation properties.
  # i18n = {
  #   consoleFont = "lat9w-16";
  #   consoleKeyMap = "us";
  #   defaultLocale = "en_US.UTF-8";
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable the X11 windowing system.
  services = {
    xserver = {
      enable = true;
      #layout = 'us';
      synaptics.enable = true;
      windowManager.awesome.enable = true;
      displayManager.slim.enable = true;		
      desktopManager.xfce.enable = true;
    };
  };
  hardware.opengl.videoDrivers = [ "intel" ];
  # services.xserver.xkbOptions = "eurosign:e";

  nixpkgs.config.allowUnfree = true;

  environment = {
    interactiveShellInit = ''
        export EDITOR="vim"
        export EMAIL=johannes@raggam.co.at
        export FULLNAME="Johannes Raggam"
        export PIP_DOWNLOAD_CACHE=$HOME/.pip_download_cache
        export NODE_PATH=$HOME/.node_modules
    '';
    systemPackages = with pkgs; [

      "vimHugeX"
      "connmanui"
      "xlibs.xmodmap"
      "pavucontrol"
      "xbacklight"
      "python2.7-ranger"
      "python2.7-arandr"

      "alsa-lib"
      "alsa-utils"
      "alsa-plugins"
        

      # uncategorized
      #redshift
      #msmtp
      #notmuch
      #offlineimap
      #pythonPackages.alot
      #pythonPackages.afew
      #dunst
      #libnotify
      #i3lock
      #i3status
      #dmenu
      #scrot
      #vifm
      #rxvt_unicode
      #xsel
      #pa_applet
      #gnome.gnome_keyring
      #stdenv
      #virtmanager

      # nix related tools
      #nixops

      # cmd line tools
      "which"
      "wget"
      "htop"
      "unrar"
      "unzip"
      # "pythonPackages.ipython"
      "mosh"

      # console programs
      #weechat
      #cmus

      # version control
      # "subversion"
      # "mercurialFull"
      # "bazaar"
      # "bazaarTools"
      "gitFull"
      "gitAndTools.tig"

      # editor and their tools
      #emacs24
      #emacs24Packages.org
      #emacs24Packages.offlineimap
      #emacs24Packages.notmuch
      # needed for vim's syntastic
      #phantomjs
      # "pythonPackages.flake8"
      #pythonPackages.docutils
      #htmlTidy
      #csslint
      #xmllint
      #zptlint
      "ctags"

      # browsers
      "chromiumWrapper"
      "firefoxWrapper"
      # "opera"

      # programs
      #gitAndTools.gitAnnex
      #zathura
      # "skype"
      "mplayer2"
      #dropbox
      #gftp
      #calibre
      #gnucash
      #gimp_2_8
      #inkscape
      #libreoffice

      # hacking tools
      #wireshark
      #aircrackng


    ];
  };

  #fonts = {
  #  enableFontDir = true;
  #  enableGhostscriptFonts = true;
  #  extraFonts = [
  #     pkgs.terminus_font
  #     pkgs.anonymousPro
  #     pkgs.corefonts
  #     pkgs.freefont_ttf
  #     pkgs.ttf_bitstream_vera
  #     pkgs.ttf_bitstream_vera_for_powerline
  #  ];
  #};

}
