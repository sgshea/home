{ pkgs, inputs, ... }:

{
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
    ./options.nix
    ./lsp.nix
    ./cmp.nix
    ./alpha.nix
  ];

  programs.nixvim = {
    enable = true;

    colorschemes.catppuccin.enable = true;

    keymaps = [
      {
        # Toggle NvimTree
        key = "<C-n>";
        action = "<CMD>NvimTreeToggle<CR>";
      }
      {
        # Change NvimTree to current directory
        key = "<C-h>";
        action = "<CMD>NvimTreeFindFile<CR>";
      }
      {
        # Format file
        key = "<space>fm";
        action = "<CMD>lua vim.lsp.buf.format()<CR>";
      }
    ];

    plugins = {
      # Statusline
      lualine.enable = true;
      bufferline.enable = true;
      comment.enable = true;
      nvim-autopairs.enable = true;

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

      # Tree explorer
      nvim-tree = {
        enable = true;
        openOnSetupFile = true;
        autoReloadOnWrite = true;
      };

      toggleterm = {
	enable = true;
	settings.open_mapping = "[[<c-t>]]";
      };

      # Telescope is a fuzzy finder for files, buffers, etc.
      # <leader>ff to find files
      # <leader>fg to find in files
      # <leader>fb to find buffers
      # <leader>fh to find help tags
      # While in insert mode: <c-/> to bring up keymaps
      # While in normal mode: ?
      telescope.enable = true;
      telescope.keymaps = {
        "<leader>ff" = "find_files";
        "<leader>fg" = "live_grep";
        "<leader>fb" = "buffers";
        "<leader>fh" = "help_tags";
      };

      wilder = {
        enable = true;
        modes = [ ":" "/" "?" ];
      };

      which-key.enable = true;
    };
  };
}
