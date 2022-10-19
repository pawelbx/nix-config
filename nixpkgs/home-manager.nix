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
    python3
    python3Packages.numpy
    du-dust
    btop
    qbittorrent
  ];

  programs.home-manager.enable = true;

  programs.ssh = {
    enable = true;
    compression = true;
    forwardAgent = true;
    extraConfig = "AddKeysToAgent yes";
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
  programs.btop = {
    enable = true;
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };

}
