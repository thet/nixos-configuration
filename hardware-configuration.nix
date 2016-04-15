# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, pkgs, ... }:

{
  imports =
    [ <nixpkgs/nixos/modules/installer/scan/not-detected.nix>
    ];

  boot.initrd.availableKernelModules = [ "uhci_hcd" "ehci_pci" "ahci" ];
  boot.kernelModules = [ "kvm-intel" "applesmc" ];
  boot.extraModulePackages = [ ];

  fileSystems = [
    { mountPoint = "/";
      device = "/dev/disk/by-uuid/bab25609-da00-4b21-87cf-b556feea441b";  # /dev/sda8
      fsType = "ext4";
      options = "rw,data=ordered,relatime";
    }
    { mountPoint = "/boot";
      device = "/dev/disk/by-uuid/5F97-2716";  # /dev/sda7
      fsType = "vfat";
      options = "rw,fmask=0022,dmask=0022,codepage=437,iocharset=iso8859-1,shortname=mixed,errors=remount-ro,relatime";
    }
    { mountPoint = "/home";
      device = "/dev/disk/by-uuid/18d29f42-62b1-490c-9327-2d73240dfc27";  # /dev/sda9
      options = "defaults,discard,noatime";
    }
    { mountPoint = "/tmp";
      device = "tmpfs";
      fsType = "tmpfs";
      options = "nosuid,nodev,relatime";
    }
  ];
  swapDevices = [
    { device = "/dev/disk/by-uuid/fd04895d-5c9d-4b88-8e34-2bd5d41cb698"; }  # /dev/sda11
  ];

  nix.maxJobs = 4;
}
