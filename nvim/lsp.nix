{
  programs.nixvim.plugins = {
    lsp = {
      enable = true;
      servers = {
        bashls.enable = true;
        clangd.enable = true;
        fsautocomplete.enable = true;
        nixd.enable = true;
        ruff-lsp.enable = true;
      };
      keymaps.lspBuf = {
        "gd" = "definition";
        "gD" = "references";
        "gt" = "type_definition";
        "gi" = "implementation";
        "K" = "hover";
      };
    };
    rust-tools.enable = true;
    treesitter = {
      enable = true;
      nixGrammars = true;
      settings.indent.enable = true;
    };
    treesitter-context.enable = true;

    none-ls = {
      enable = true;
      sources = {
        diagnostics = {
          statix.enable = true;
          clj_kondo.enable = true;
          cppcheck.enable = true;
        };
        formatting = {
          nixfmt.enable = true;
          markdownlint.enable = true;
          clang_format.enable = true;
          prettier.enable = true;
        };
      };
    };
  };
}
