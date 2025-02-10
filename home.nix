{ config, pkgs, inputs, ... }:

{

  imports = [ ./nvim ];

  home = {
    username = "sammy";
    homeDirectory = "/var/home/sammy";
    stateVersion = "24.11";
  };

  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    ripgrep
    fd
    sd
    tree
    just

    cachix
    nil
    nix-info
    nix-health

    fastfetch

    (pkgs.nerdfonts.override { fonts = [ "FiraCode" "Hack" ]; })
  ];

  home.shellAliases = {
    g = "git";
    lg = "lazygit";
    fastfetch = "fastfetch -c 'examples/10'";
  };

  programs = {

    fish = {
      enable = true;
      interactiveShellInit = ''
        set fish_greeting # Disable greeting
      '';
      plugins = [ ];
    };

    bash = {
      enable = true;
      initExtra = ''
        # Make Nix and home-manager installed things available in PATH.
        export PATH=/run/current-system/sw/bin/:/nix/var/nix/profiles/default/bin:$HOME/.nix-profile/bin:/etc/profiles/per-user/$USER/bin:$USER/.local/bin:$PATH
      '';
    };

    zsh = {
      enable = true;
      envExtra = ''
        # Make Nix and home-manager installed things available in PATH.
        export PATH=/run/current-system/sw/bin/:/nix/var/nix/profiles/default/bin:$HOME/.nix-profile/bin:/etc/profiles/per-user/$USER/bin:$USER/.local/bin:$PATH
      '';
    };

    # Better `cd`
    bat.enable = true;
    # Type `z <pat>` to cd to some directory
    zoxide.enable = true;
    # Type `<ctrl> + r` to fuzzy search your shell history
    fzf.enable = true;
    jq.enable = true;
    htop.enable = true;

    starship = {
      enable = true;
      settings = {
        username = {
          style_user = "blue bold";
          style_root = "red bold";
          format = "[$user]($style) ";
          disabled = false;
          show_always = true;
        };
        hostname = {
          ssh_only = false;
          ssh_symbol = "🌐 ";
          format = "on [$hostname](bold red) ";
          trim_at = ".local";
          disabled = false;
        };
      };
    };

    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };

    git = { enable = true; };
    lazygit.enable = true;
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
