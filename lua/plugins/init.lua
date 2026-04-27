return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    build = ":TSUpdate",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "markdown",
        "markdown_inline",
        "c_sharp",
        "zig",
        "perl",
        "odin",
      },
      highlight = { enable = true },
      indent = { enable = true },
    },
  },

  {
    "L3MON4D3/LuaSnip",
    version = "v2.*",
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load { paths = "~/.config/nvim/lua/custom/snippets/" }
    end,
  },

  {
    "nvim-telescope/telescope-live-grep-args.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    config = function()
      require("telescope").load_extension "live_grep_args"
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
    },
  },

  {
    "nvimdev/lspsaga.nvim",
    event = "LspAttach",
    opts = {
      lightbulb = {
        virtual_text = false,
      },
    },
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
  },

  {
    "vyfor/cord.nvim",
    build = ":Cord update",
    event = "VeryLazy",
    opts = {
      buttons = {
        {
          label = function(opts)
            return opts.repo_url and "Join Psychosis"
          end,
          url = function(opts)
            return opts.repo_url or "https://discord.gg/eJ3H9GdQCs"
          end,
        },
      },
      text = {
        workspace = function(opts)
          local hour = tonumber(os.date "%H")
          local times = {
            { 22, "🌙 Late night coding" },
            { 18, "🌆 Evening session" },
            { 12, "☀️ Afternoon coding" },
            { 5, "🌅 Morning productivity" },
            { 0, "🌙 Midnight hacking" },
          }

          local status = "Coding"
          for _, t in ipairs(times) do
            if hour >= t[1] then
              status = t[2]
              break
            end
          end

          return string.format("%s: %s", status, opts.filename or "No file")
        end,
      },
    },
  },

  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = true,
    event = "VeryLazy",
    opts = {
      size = 15,
      open_mapping = [[<C-.>]],
      shade_terminals = true,
      direction = "float",
      float_opts = {
        border = "curved",
      },
    },
  },

  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {},
    keys = {
      {
        "s",
        mode = { "n", "x", "o" },
        function()
          require("flash").jump()
        end,
        desc = "Flash",
      },
      {
        "S",
        mode = { "n", "x", "o" },
        function()
          require("flash").treesitter()
        end,
        desc = "Flash Treesitter",
      },
      {
        "r",
        mode = "o",
        function()
          require("flash").remote()
        end,
        desc = "Remote Flash",
      },
      {
        "R",
        mode = { "o", "x" },
        function()
          require("flash").treesitter_search()
        end,
        desc = "Treesitter Search",
      },
      {
        "<c-s>",
        mode = { "c" },
        function()
          require("flash").toggle()
        end,
        desc = "Toggle Flash Search",
      },
    },
  },

  {
    "stevearc/conform.nvim",
    event = "VeryLazy",
    opts = {
      notify_on_error = true,
      formatters = {
        odinfmt = {
          command = "/home/nikolay.hadzhiev/.local/share/nvim/mason/packages/ols/odinfmt-x86_64-unknown-linux-gnu",
          args = { "-stdin" },
          stdin = true,
        },
      },
      formatters_by_ft = {
        lua = { "stylua" },
        odin = { "odinfmt" },
      },
      format_on_save = {
        -- These options will be passed to conform.format()
        timeout_ms = 500,
        lsp_fallback = true,
      },
    },
  },
}
