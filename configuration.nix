# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  nixpkgs.config.allowUnfree = true;

  # Use the GRUB 2 boot loader.
  boot.loader.grub.enable = true;
  boot.loader.grub.version = 2;
  # boot.loader.grub.efiSupport = true;
  # boot.loader.grub.efiInstallAsRemovable = true;
  # boot.loader.efi.efiSysMountPoint = "/boot/efi";
  # Define on which hard drive you want to install Grub.
  boot.loader.grub.device = "/dev/vda"; # or "nodev" for efi only

  # UEFI boot
  # boot.loader.systemd-boot.enable = true;

  # use ZFS
  boot.supportedFilesystems = [ "zfs" ];

  networking.networkmanager.enable = true;
  networking.hostName = "sean"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Set your time zone.
  time.timeZone = "Europe/Berlin";

  # The global useDHCP flag is deprecated, therefore explicitly set to false here.
  # Per-interface useDHCP will be mandatory in the future, so this generated config
  # replicates the default behaviour.
  networking.useDHCP = false;
  networking.interfaces.enp1s0.useDHCP = true;

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  i18n.defaultLocale = "de_DE.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "de";
  };

  # Enable the X11 windowing system.
  # services.xserver.enable = true;

  # Enable Awesom WM
  # services.xserver.windowManager.awesome.enable = true;

  services.xserver = {
    enable = true;
    windowManager.awesome.enable = true;
    displayManager.defaultSession = "none+awesome";
    desktopManager.xterm.enable = false;
    # disable automatic screen blanking and stuff, we'll do it manually instead
    # serverFlagsSection = ''
    #   Option "BlankTime" "0"
    #   Option "StandbyTime" "0"
    #   Option "SuspendTime" "0"
    #   Option "OffTime" "0"
    # '';
  };


  # Enable the GNOME 3 Desktop Environment.
  # services.xserver.displayManager.gdm.enable = true;
  # services.xserver.desktopManager.gnome3.enable = true;
  

  # Configure keymap in X11
  services.xserver.layout = "de";
  # services.xserver.xkbOptions = "eurosign:e";

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio.enable = true;
  hardware.pulseaudio.support32Bit = true;

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # docker for work stuff
  virtualisation.docker.enable = true;

  # Fonts
  fonts = {
    fonts = with pkgs; [
      #corefonts # Microsoft free fonts
      inconsolata # monospaced
      unifont # some international languages
      font-awesome-ttf
      freefont_ttf
      opensans-ttf
      liberation_ttf
      liberationsansnarrow
      ttf_bitstream_vera
      libertine
      ubuntu_font_family
      gentium
      # Good monospace fonts
      jetbrains-mono
      source-code-pro
      # all the nerdfonts
      # nerdfonts
    ];
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.sean = {
    isNormalUser = true;
    initialPassword = "asdf";
    home = "/home/sean";
    shell = pkgs.zsh;
    extraGroups = [ "wheel" "docker" "networkmanager" ]; # Enable ‘sudo’ for the user.
  };

  programs.vim.defaultEditor = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [

    # command line utilities
    ag
    bash
    bat
    broot
    coreutils
    ctags
    curl
    dmenu
    exa
    ffmpeg
    fzf
    git
    htop
    imagemagick
    killall
    lsof
    mc
    ncdu
    nix-index
    ranger
    ripgrep
    rsync
    sassc
    stow
    tmux
    tree
    unzip
    usbutils
    wget
    youtube-dl
    # z
    zip
    zsh

    # utilities
    arandr
    caffeine-ng
    calibre
    dropbox
    etcher
    feh
    flameshot
    font-manager
    gimp
    gnupg
    gparted
    handbrake
    libreoffice-fresh
    networkmanager
    networkmanager-openconnect
    networkmanager-openvpn
    # networkmanager-pptp
    networkmanager-vpnc
    nitrogen
    openvpn
    peek
    pptp
    rclone
    rclone-browser
    redshift
    remmina
    simplescreenrecorder
    # slack
    # spotify
    sstp
    # steam
    syncthing
    xfce.thunar
    xfce.thunar-volman
    xfce.thunar-dropbox-plugin
    xfce.thunar-archive-plugin
    zathura
    # zoom-us

    # media
    # guayadeque
    mpd
    mpv
    ncmpcpp
    pavucontrol
    vlc

    # terminals
    # alacritty
    gnome3.gnome-terminal
    termite

    # editors
    emacs
    neovim
    vim

    # browsers
    firefox
    google-chrome

    # programming stuff
    docker
    docker-compose
    jdk11
    # jetbrains.phpstorm
    leiningen
    # texlive.combined.scheme-tetex
    yarn

    # graphical environment
    lightdm
    lightdm_gtk_greeter
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:
  # services = {

    # syncthing = {
    #   enable = true;
    # };

    # printServer = {
    #   enable = true;
    # };
  # }

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "20.09"; # Did you read the comment?

}

