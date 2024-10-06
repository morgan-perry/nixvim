{
  colorschemes.vscode.enable = true;
  globals.mapleader = " ";

  clipboard.register = "unnamedplus";
  #clipboard.providers.wl-copy.enable = true; for wayland
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
    signcolumn = "number";
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
