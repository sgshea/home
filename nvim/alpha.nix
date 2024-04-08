{ config, ... }: {

  programs.nixvim.plugins.alpha = {
    enable = true;
    layout = [
      {
        type = "padding";
        val = 4;
      }
      {
        type = "text";
        opts = {
          position = "center";
          hl = "Type";
        };
        val = [
          "                                                                     "
          "       ████ ██████           █████      ██                     "
          "      ███████████             █████                             "
          "      █████████ ███████████████████ ███   ███████████   "
          "     █████████  ███    █████████████ █████ ██████████████   "
          "    █████████ ██████████ █████████ █████ █████ ████ █████   "
          "  ███████████ ███    ███ █████████ █████ █████ ████ █████  "
          " ██████  █████████████████████ ████ █████ █████ ████ ██████ "
          "                                                                       "
        ];
      }
      {
        type = "padding";
        val = 4;
      }
      {
        type = "group";

        val = [
          {
            type = "button";
            val = "󰭎  Find file";
            on_press.__raw = "function() vim.cmd[[Telescope find_files]] end";
            opts = {
              keymap = [
                "n"
                "f"
                ":Telescope find_files <CR>"
                {
                  noremap = true;
                  silent = true;
                  nowait = true;
                }
              ];
              shortcut = "f";
              position = "center";
              cursor = 3;
              width = 50;
              align_shortcut = "right";
              hl_shortcut = "Keyword";
            };
          }
          {
            type = "button";
            val = "  New     ";
            on_press.raw = "<cmd>ene<CR>";
            opts = {
              # hl = "comment";
              keymap = [
                "n"
                "n"
                "<cmd>:ene<CR>"
                {
                  noremap = true;
                  silent = true;
                  nowait = true;
                }
              ];
              shortcut = "n";

              position = "center";
              cursor = 3;
              width = 50;
              align_shortcut = "right";
              hl_shortcut = "Keyword";
            };
          }
          {
            type = "button";
            val = "  Home Config";
            on_press.__raw =
              "function() vim.cmd[[e ~/.config/home-manager/home.nix]] end";
            opts = {
              keymap = [
                "n"
                "h"
                "<cmd>e ~/.config/home-manager/home.nix <CR>"
                {
                  noremap = true;
                  silent = true;
                  nowait = true;
                }
              ];
              shortcut = "h";
              position = "center";
              cursor = 3;
              width = 50;
              align_shortcut = "right";
              hl_shortcut = "Keyword";
            };
          }
          {
            type = "button";
            val = "  Recently used";
            on_press.raw = "require('telescope.builtin').oldfiles";
            opts = {
              keymap = [
                "n"
                "o"
                ":Telescope oldfiles <CR>"
                {
                  noremap = true;
                  silent = true;
                  nowait = true;
                }
              ];
              shortcut = "o";
              position = "center";
              cursor = 3;
              width = 50;
              align_shortcut = "right";
              hl_shortcut = "Keyword";
            };
          }
          {
            type = "button";
            val = "󰱽  Find text";
            on_press.raw = "require('telescope.builtin').live_grep";
            opts = {
              keymap = [
                "n"
                "g"
                ":Telescope live_grep <CR>"
                {
                  noremap = true;
                  silent = true;
                  nowait = true;
                }
              ];
              shortcut = "g";
              position = "center";
              cursor = 3;
              width = 50;
              align_shortcut = "right";
              hl_shortcut = "Keyword";
            };
          }
          {
            type = "button";
            val = "󰩈  Quit Neovim";
            on_press.__raw = "function() vim.cmd[[qa]] end";
            opts = {
              keymap = [
                "n"
                "q"
                ":qa<CR>"
                {
                  noremap = true;
                  silent = true;
                  nowait = true;
                }
              ];
              shortcut = "q";
              position = "center";
              cursor = 3;
              width = 50;
              align_shortcut = "right";
              hl_shortcut = "Keyword";
            };
          }
        ];
      }
    ];
  };
}
