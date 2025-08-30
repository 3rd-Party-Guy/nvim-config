return {
  {
  	"nvim-treesitter/nvim-treesitter",
    opts = {
  	  ensure_installed = {
   		  "vim", "lua", "vimdoc",
        "html", "css", "perl", "haskell",
        "markdown", "markdown_inline",
   	  },
    },
  },

  {
    "L3MON4D3/LuaSnip",
    version = "v2.*",
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load({ paths = "~/.config/nvim/lua/custom/snippets/" })
    end,
  },

  {
    "nvim-telescope/telescope-live-grep-args.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    config = function()
      require("telescope").load_extension("live_grep_args")
    end,
  },

  {
    "f-person/git-blame.nvim",
    -- load the plugin at startup
    event = "VeryLazy",
    -- Because of the keys part, you will be lazy loading this plugin.
    -- The plugin will only load once one of the keys is used.
    -- If you want to load the plugin at startup, add something like event = "VeryLazy",
    -- or lazy = false. One of both options will work.
    opts = {
      enabled = true,
      message_template = "<date> • <author> • <<sha>> • <summary>",
      date_format = "%d/%m/%y",
      virtual_text_column = 120,
      delay = 0,
    },
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "mason-org/mason-lspconfig.nvim",
    opts = {
      ensure_installed = { "lua_ls" },
    },
    dependencies = {
      { "mason-org/mason.nvim", opts = {} },
      "neovim/nvim-lspconfig",
    }
  },

  {
    'nvimdev/lspsaga.nvim',
    event = "LspAttach",
    config = function()
        require('lspsaga').setup({})
    end,
    dependencies = {
        'nvim-treesitter/nvim-treesitter',
        'nvim-tree/nvim-web-devicons',
    }
  },

  {
    'vyfor/cord.nvim',
    build = ':Cord update',
    event = 'VeryLazy',
    opts = {
      buttons = {
        {
          label = function(opts)
            return opts.repo_url and 'Join Psychosis'
          end,
          url = function(opts)
            return opts.repo_url or 'https://discord.gg/eJ3H9GdQCs'
          end,
        }
      },
      text = {
        workspace = function(opts)
          local hour = tonumber(os.date('%H'))
          local times = {
            { 22, '🌙 Late night coding' },
            { 18, '🌆 Evening session' },
            { 12, '☀️ Afternoon coding' },
            { 5,  '🌅 Morning productivity' },
            { 0,  '🌙 Midnight hacking' },
          }

          local status = "Coding"
          for _, t in ipairs(times) do
            if hour >= t[1] then
              status = t[2]
              break
            end
          end

          return string.format('%s: %s', status, opts.filename or "No file")
        end
      }
    },
  },

  {
    "akinsho/toggleterm.nvim",
    version = "*",
    event = "VeryLazy",
    opts = {
      open_mapping = [[<leader>.]],
      direction = "float",
      float_opts = {
        border = "curved",
      }
    },
  },
}
