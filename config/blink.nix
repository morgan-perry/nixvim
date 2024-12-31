{
  plugins.blink-cmp = {
    enable = true;
    settings = {
      accept = {
        auto_brackets = {
          enabled = false;
        };
      };
      windows.documentation = {
        auto_show = false;
      };
      highlight = {
        use_nvim_cmp_as_default = true;
      };
      keymap = {
        "<C-e>" = [ "hide" ];
        "<C-n>" = [
          "select_next"
          "fallback"
        ];
        "<C-p>" = [
          "select_prev"
          "fallback"
        ];
        "<C-space>" = [
          "show"
          "show_documentation"
          "hide_documentation"
        ];
        "<C-y>" = [ "select_and_accept" ];
        "<S-Tab>" = [
          "snippet_backward"
          "fallback"
        ];
        "<Tab>" = [
          "select_and_accept"
          "snippet_forward"
          "fallback"
        ];
      };
      trigger = {
        signature_help = {
          enabled = false;
        };
      };
      sources = {
        completion = {
          enabled_providers = [
            "lsp"
            "path"
            "snippets"
            # enable to have text completion
            # "buffer"
          ];
        };
        default = [
          "lsp"
          "path"
          "luasnip"
        ];
      };
    };
  };
}
