{ config, pkgs, libs, ... }:
{
  home.packages = with pkgs; [
    aspell
    aspellDicts.en
    aspellDicts.pl
    gnupg
    gnuplot
    gnutar
    git
    jq
    emacs
    neofetch
    fzf
    yt-dlp
    youtube-dl
    powerline-fonts
    tree
    watch
    zsh
    zsh-syntax-highlighting
    oh-my-zsh
    ripgrep
    postgresql
    ruby
    tmux
    python3
    python3Packages.numpy
    python3Packages.pygments
    du-dust
    btop
    pandoc
    xcode-install
    jetbrains-mono
    qbittorrent
    mpv
  ];

  home.file.".aspell.conf".text = "data-dir /Users/pawel/.nix-profile/lib/aspell/";

  programs.home-manager.enable = true;

  programs.tmux.enable = true;

  programs.ssh = {
    enable = true;
    compression = true;
    forwardAgent = true;
    extraConfig = "AddKeysToAgent yes";
  };
  programs.mpv = {
    enable = true;
  };
  programs.zsh = {
    enable = true;
    enableCompletion = false;
    history = {
      size = 50000;
      save = 50000;
      ignoreDups = true;
    };
    sessionVariables = {
      PAGER = "less";
    };
    initExtra = ''
      export CLICOLOR=1
    '';
    oh-my-zsh = {
      enable = true;
      theme = "agnoster";
    };
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };
}
