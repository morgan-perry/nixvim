# NOTE: The extra config here was AI generated so it may break as orgroam and
# mini.hipatterns create issues with one another
{
  pkgs,
  lib,
  config,
  ...
}:
let
  org-roam-directory = "/doc/share/org/roam";

  org-roam-nvim = pkgs.vimUtils.buildVimPlugin {
    pname = "org-roam-nvim";
    version = "main";
    src = pkgs.fetchFromGitHub {
      owner = "chipsenkbeil";
      repo = "org-roam.nvim";
      rev = "main";
      sha256 = "sha256-KEmbFGXjOlSPY8wpr5WUzD5+eCUP1hXN2Ty37smLU9M=";
    };
    dependencies = with pkgs.vimPlugins; [
      orgmode
    ];
  };
in
{
  # Keep org-roam configuration
  plugins.orgmode.enable = true;
  extraPlugins = [ org-roam-nvim ];

  # Override mini.nvim configuration to prevent hipatterns from auto-initializing
  plugins.mini.luaConfig.content = lib.mkForce (
    lib.foldlAttrs (
      lines: name: config:
      # Skip hipatterns in the initial setup
      if name == "hipatterns" then
        lines
      else
        ''
          ${lines}
          require(${lib.nixvim.toLuaObject "mini.${name}"}).setup(${lib.nixvim.toLuaObject config})
        ''
    ) "" config.plugins.mini.modules
    + lib.optionalString ((config.plugins.mini.modules ? icons) && config.plugins.mini.mockDevIcons) ''
      MiniIcons.mock_nvim_web_devicons()
    ''
  );

  # Add the delayed hipatterns initialization and org-roam config
  extraConfigLua = ''
    -- Safe delayed initialization for mini.hipatterns
    vim.api.nvim_create_autocmd("VimEnter", {
      callback = function()
        -- Wait until Vim is fully initialized
        vim.defer_fn(function()
          -- Only proceed if a valid buffer exists
          if vim.api.nvim_get_current_buf() > 0 then
            -- Try to load hipatterns safely
            local status_ok, hipatterns = pcall(require, 'mini.hipatterns')
            if status_ok then
              -- Get hipatterns config or use empty table
              local config = ${
                if config.plugins.mini.modules ? hipatterns then
                  lib.nixvim.toLuaObject config.plugins.mini.modules.hipatterns
                else
                  "{}"
              }
              
              -- Print debugging info
              print("Safely initializing mini.hipatterns with valid buffer: " .. vim.api.nvim_get_current_buf())
              
              -- Initialize with safeguards
              local setup_ok, err = pcall(function() 
                hipatterns.setup(config)
              end)
              
              if not setup_ok then
                print("Error setting up mini.hipatterns: " .. tostring(err))
              end
            else
              print("Could not require mini.hipatterns: " .. tostring(hipatterns))
            end
          else
            print("No valid buffer available for mini.hipatterns initialization")
          end
        end, 500) -- 500ms delay for extra safety
      end,
      once = true
    })

    -- Set up org-roam (independent of mini.hipatterns)
    require('orgmode').setup({
      org_agenda_files = {'~/org_roam_files/**/*'},
      org_default_notes_file = '~/org_roam_files/refile.org',
    })

    local status_ok, org_roam = pcall(require, "org-roam")
    if status_ok then
      -- Convert to absolute path (more reliable than tilde)
      local home = vim.fn.expand('$HOME')
      local directory = home .. "${org-roam-directory}"

      org_roam.setup({
        directory = directory,
        database = {
          -- Force database to be at a specific location
          path = home .. "/.org-roam.db",
        },
        org_files = {
          directory, -- Include the main directory explicitly
          -- Add other directories as needed
        },
        -- Add debug mode
        debug = true,
      })
      
      -- Force database initialization on startup
      vim.api.nvim_create_autocmd("VimEnter", {
        callback = function()
          vim.schedule(function()
            -- Print debug info about what's happening
            print("Initializing org-roam database...")
            
            -- Force a database sync
            if org_roam.database and org_roam.database.sync then
              org_roam.database.sync()
              print("org-roam database sync complete")
            else
              print("org-roam database sync function not found")
            end
          end)
        end,
        once = true,
      })
      
      -- Add keybindings to help with debugging
      vim.api.nvim_set_keymap('n', '<leader>rs', 
        [[:lua require("org-roam").database.sync()<CR>]], 
        {noremap = true, silent = true, desc = "Sync org-roam database"})
      
      vim.api.nvim_set_keymap('n', '<leader>rf', 
        [[:lua print(vim.inspect(require("org-roam").database.query("SELECT * FROM nodes LIMIT 10")))<CR>]], 
        {noremap = true, desc = "Find org-roam nodes in DB"})
    else
      vim.notify("Error loading org-roam: " .. tostring(org_roam), vim.log.levels.ERROR)
    end
  '';
}
