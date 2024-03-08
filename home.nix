{ config, pkgs, ... }:

{
  home.username = "sammy";
  home.homeDirectory = "/var/home/sammy";

  home.stateVersion = "23.11";

  home.packages = with pkgs; [
    ripgrep
    fd
    sd
    tree

    cachix
    nil
    nix-info
    nix-health

    neofetch
  ];

  home.shellAliases = {
    g = "git";
    lg = "lazygit";
  };

  programs = {
    bash = {
      enable = true;
      initExtra = ''
        # Make Nix and home-manager installed things available in PATH.
        export PATH=/run/current-system/sw/bin/:/nix/var/nix/profiles/default/bin:$HOME/.nix-profile/bin:/etc/profiles/per-user/$USER/bin:$PATH
      '';
    };

    zsh = {
      enable = true;
      envExtra = ''
        # Make Nix and home-manager installed things available in PATH.
        export PATH=/run/current-system/sw/bin/:/nix/var/nix/profiles/default/bin:$HOME/.nix-profile/bin:/etc/profiles/per-user/$USER/bin:$PATH
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

    git = {
      enable = true;
    };
    lazygit.enable = true;

  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
