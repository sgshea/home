{ config, pkgs, inputs, ... }:

{

  imports = [
    inputs.nixvim.homeManagerModules.nixvim
  ];

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

  # Configuring neovim using nixvim
  programs.nixvim = {
    enable = true;

    colorschemes.gruvbox.enable = true;

    # Set <space> as leader key
    globals = {
      mapleader = " ";
      maplocalleader = " ";
    };

    opts = {
      clipboard = {
        # Sync with OS clipboard
        register = "unnamedplus";
        # Clipboard providers
        providers.wl-copy.enable = true; # wayland
        providers.xclip.enable = true; # x
      };

      number = true;
      showmode = false;
      undofile = true;
      shiftwidth = 4;
    };

    plugins = {
      # Statusline
      lualine.enable = true;
      # "gc" to comment out visual regions/lines
      comment.enable = true;

      gitsigns = {
        enable = true;
        settings.signs = {
          add.text = "+";
          change.text = "~";
          delete.text = "_";
          topdelete.text = "‾";
          changedelete.text = "~";
        };
      };

      # Telescope is a fuzzy finder for files, buffers, etc.
      # <leader>ff to find files
      # <leader>fg to find in files
      # <leader>fb to find buffers
      # <leader>fh to find help tags
      # While in insert mode: <c-/> to bring up keymaps
      # While in normal mode: ?
      telescope.enable = true;

      lsp = {
        enable = true;

        keymaps = {
          silent = true;

          diagnostic = {
            "<leader>k" = "goto_prev";
            "<leader>j" = "goto_next";
          };

          lspBuf = {
            gd = "definition";
            gD = "references";
            gt = "type_definition";
            gi = "implementation";
            K = "hover";
            "<F2>" = "rename";
          };
        };

        servers = {
          clangd.enable = true;
        };
      };
    };

    keymaps = [
      # Keymaps for Telescope
      {
        mode = "n";
        key = "<leader>ff";
        action = "Telescope find_files";
      }
      {
        mode = "n";
        key = "<leader>fg";
        action = "Telescope live_grep";
      }
      {
        mode = "n";
        key = "<leader>fb";
        action = "Telescope buffers";
      }
      {
        mode = "n";
        key = "<leader>fh";
        action = "Telescope help_tags";
      }
    ];
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
