{ config, pkgs, ... }:

{
# Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "sean";
  home.homeDirectory = "/home/sean";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "21.03";

  home.packages = with pkgs; [
    alacritty
    gnome3.networkmanagerapplet
    caffeine-ng
    udiskie
    flameshot
    redshift
    stow
    bitwarden
    git-crypt

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
    ncdu
    ranger
    ripgrep
    rsync
    sassc
    stow
    tmux
    # tree
    # unzip
    # usbutils
    # wget
    youtube-dl
    # z
    # zip
    # zsh

    # utilities
    # arandr
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
    nitrogen
    openvpn
    peek
    rclone
    rclone-browser
    redshift
    remmina
    simplescreenrecorder
    # slack
    # spotify
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
  ];

  # Enable zsh
  programs.zsh.enable = true;

  # Enable Oh-my-zsh
  programs.zsh.ohMyZsh = {
    enable = true;
    plugins = [ "git" "sudo" "docker" "kubectl" ];
  };

  programs.git = {
    enable = true;
    userName  = "sanklamm";
    userEmail = "sanklamm@gmail.com";
  };

  programs.gnome-terminal = {
    enable = true;
    profile = { dracula }
  };

  home.file = {
  "git-repos/dracula-gnome-terminal".source = fetchFromGitHub {
     owner = "dracula";
     repo = "gnome-terminal";
     rev = "4dfebf1";
     sha256 = "1xfax18y4ddafzmwqp8qfs6k34nh163bwjxb7llvls5hxr79vr9s"; # change this
  };

  home.file = {
    ".config/alacritty/alacritty.yaml".text = ''
      env:
        TERM: xterm-256color
      # Colors (Dracula PRO)
      colors:
        # Default colors
        primary:
          background: '0x22212c'
          foreground: '0xf8f8f2'

        cursor:
          text: '0x454158'
          cursor: '0xf8f8f2'

        selection:
          text: '0xf8f8f2'
          background: '0x454158'

        # Normal colors
        normal:
          black:   '0x22212c'
          red:     '0xff9580'
          green:   '0x8aff80'
          yellow:  '0xffff80'
          blue:    '0x9580ff'
          magenta: '0xff80bf'
          cyan:    '0x80ffea'
          white:   '0xf8f8f2'

        # Bright colors
        bright:
          black:   '0x22212c'
          red:     '0xffaa99'
          green:   '0xa2ff99'
          yellow:  '0xffff99'
          blue:    '0xaa99ff'
          magenta: '0xff99cc'
          cyan:    '0x99ffee'
          white:   '0xffffff'
    '';
  };

  home.file = {
  "dotfiles".source = fetchFromGitHub {
     owner = "sanklamm";
     repo = "dotfiles";
     rev = "e22e8e9";
     sha256 = "1xfax18y4ddafzmwqp8qfs6k34nh163bwjxb7llvls5hxr79vr9s"; # change this
  };

}
