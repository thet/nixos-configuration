

nix commands
------------
https://nixos.org/wiki/Install/remove_software#How_to_update_installed_software

install::
    nix-env -i links2

uninstall::
    nix-env -e links2

update::
    nix-env -u --keep-going  # update software
    nix-channel --update  # update channel
    nixos-rebuild switch
    nixos-rebuild switch --upgrade

rollback::
    nixos-rebuild switch --rollback
    nix-env -p /nix/var/nix/profiles/system --list-generations
    nix-env --switch-generation 3141 -p /nix/var/nix/profiles/system

garbage collection::
    nix-env --delete-generations old
    nix-collect-garbage
    nix-collect-garbage -d

list installed software::
    nix-env -q
    nix-store -q --references /var/run/current-system/sw

