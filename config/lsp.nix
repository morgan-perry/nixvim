{
  plugins = {
    treesitter = {
      enable = true;

      nixvimInjections = true;

      settings = {
        highlight.enable = true;
        indent.enable = true;
      };
      # folding = true; not sure because of nvim-ufo
    };
    lspkind = {
      enable = true;
      cmp = {
        enable = true;
        menu = {
          nvim_lsp = "[LSP]";
          nvim_lua = "[api]";
          path = "[path]";
          luasnip = "[snip]";
          buffer = "[buffer]";
        };
      };
      extraOptions = {
        maxwidth = 50;
        ellipsis_char = "...";
      };
    };
    cmp = {
      enable = true;

      settings = {
        snippet.expand = "function(args) require('luasnip').lsp_expand(args.body) end";

        mapping = {
          "<C-d>" = "cmp.mapping.scroll_docs(-4)";
          "<C-f>" = "cmp.mapping.scroll_docs(4)";
          "<C-Space>" = "cmp.mapping.complete()";
          "<C-e>" = "cmp.mapping.close()";
          "<C-n>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
          "<Tab>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
          "<C-p>" = "cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'})";
          "<S-Tab>" = "cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'})";
          "<CR>" = "cmp.mapping.confirm({ select = true })";
        };

        sources = [
          { name = "path"; }
          { name = "nvim_lsp"; }
          { name = "nvim_lsp_signature_help"; }
          { name = "luasnip"; }
          {
          name = "buffer";
              # Words from other open buffers can also be suggested.
              option.get_bufnrs.__raw = "vim.api.nvim_list_bufs";
            }
            { name = "neorg"; }
          ];
        };
      };

      lsp = {
        enable = true;
        servers = {
          #tsserver.enable = true;
          nil-ls.enable = true;
          nil-ls.autostart = true;
          pyright.enable = true;
          clangd.enable = true;
          cssls.enable = true;
          html.enable = true;
          tailwindcss.enable = true;
        };
        keymaps.extra = [
          {
            action = "<CMD>LspStop<Enter>";
            key = "<leader>Lx";
          }
          {
            action = "<CMD>LspStart<Enter>";
            key = "<leader>Ls";
          }
          {
            action = "<CMD>LspRestart<Enter>";
            key = "<leader>Lr";
          }
          {
            # action = "Telescope lsp_definitions";
            action = "<CMD>Lspsaga goto_definition<Enter>";
            key = "gd";
          }
          {
            action = "<CMD>Lspsaga hover_doc<Enter>";
            key = "K";
          }
          {
            action = "<CMD>Lspsaga peek_definition<Enter>";
            key = "<leader>K";
          }
          {
            action = "<CMD>Lspsaga rename<Enter>";
            key = "<leader>cr";
          }
          {
            action = "<CMD>Lspsaga finder<Enter>";
            key = "<leader>cf";
          }
          {
            action = "<CMD>Lspsaga outline<Enter>";
            key = "<leader>co";
          }
          {
            action = "<CMD>Lspsaga outline<Enter>";
            key = "<leader>cf";
          }
        ];
      };

    };
}
