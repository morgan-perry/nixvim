{ pkgs, ... }:
{
  colorschemes.modus.enable = true;
  colorschemes.modus.settings.style = "modus_vivendi";
  globals.mapleader = " ";

  clipboard = {
    # Use system clipboard
    register = "unnamedplus";

    providers = {
      wl-copy = {
        enable = true;
        package = pkgs.wl-clipboard; # NOTE: May not work on WSL
      };
    };
  };

  performance.combinePlugins = {
    enable = true;
    standalonePlugins = [
      # NOTE: Must be here otherwise snippets do not show up when blink.cmp is enable
      "friendly-snippets"
    ];
  };
  performance.byteCompileLua = {
    enable = true;
    configs = true;
    plugins = true;
    nvimRuntime = true;
    initLua = true;
  };

  opts = {
    number = true;
    relativenumber = true;
    signcolumn = "yes";
    expandtab = true;
    autoindent = true;
    smartindent = true;
    foldcolumn = "0";
    foldlevel = 99;
    foldlevelstart = 99;
    foldenable = true;
    showtabline = 0;
    undofile = true;
    tabstop = 2;
    shiftwidth = 2;
    softtabstop = 0;
  };
}
