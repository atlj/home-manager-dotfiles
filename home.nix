{ config, pkgs, ... }:
{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "burakguner";
  home.homeDirectory = "/Users/burakguner";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.05"; # Please read the comment before changing.
  home.packages = with pkgs; [
    # Editors & Terminals
    neovim
    helix
    wezterm

    # Build & Development Tools
    tree-sitter
    pandoc
    cmake
    ninja
    ccache
    xcpretty
    gettext
    flatbuffers_23
    openssl
    libtool
    unixODBC
    devenv
    direnv

    # Database
    sqlite

    # Languages & Runtimes
    zulu21
    lua
    go
    rustup
    ruby
    elixir

    # JavaScript Tooling
    nodejs_24
    corepack_24
    watchman
    bun

    # Mobile Development
    swiftlint
    swiftformat
    fastlane
    xcodegen
    scrcpy
    maestro
    libimobiledevice

    # Containers & Networking
    docker
    colima
    docker-credential-helpers
    ngrok
    avahi
    socat
    wget

    # AI / Coding Assistants
    github-copilot-cli
    claude-code
    codex
    ollama

    # Media & Graphics
    ffmpeg
    imagemagick
    graphicsmagick
    yt-dlp
    aseprite

    # System & Shell Utilities
    fzf
    zoxide
    lazygit
    delta
    git
    gh
    btop
    ripgrep
    colordiff
    highlight

    # macOS Desktop Apps
    raycast
    keycastr
    qbittorrent-nox

    # Misc / Fun
    asciiquarium-transparent
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. If you don't want to manage your shell through Home
  # Manager then you have to manually source 'hm-session-vars.sh' located at
  # either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/burakguner/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
  };


  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
