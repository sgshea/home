{
  programs.nixvim.globals.mapleader = " ";
  programs.nixvim.opts = {
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
    shiftwidth = 2;
  };
}
