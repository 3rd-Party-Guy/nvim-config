return {
  {
  	"nvim-treesitter/nvim-treesitter",
    opts = {
  	  ensure_installed = {
   		  "vim", "lua", "vimdoc",
        "html", "css", "perl", "haskell",
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
    "ThePrimeagen/vim-be-good",
  },

  {
    "andweeb/presence.nvim"
  }
}
