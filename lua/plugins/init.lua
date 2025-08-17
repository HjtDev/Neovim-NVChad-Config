return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = "williamboman/mason.nvim",
    config = function()
      require("mason-lspconfig").setup {
        ensure_installed = { "pyright", "ruff_lsp" },
      }
    end,
  },

  -- Python-specific plugins (optional but recommended)
  {
    "mfussenegger/nvim-dap-python",
    ft = "python",
    dependencies = {
      "mfussenegger/nvim-dap",
      "rcarriga/nvim-dap-ui",
      "williamboman/mason.nvim", -- Ensure mason is available
    },
    config = function()
      local mason_path = vim.fn.glob(vim.fn.stdpath "data" .. "/mason/")
      require("dap-python").setup(mason_path .. "packages/debugpy/venv/bin/python")
    end,
  },

  {
    "linux-cultist/venv-selector.nvim",
    dependencies = { "neovim/nvim-lspconfig" },
    opts = {
      name = { "venv", ".venv", "env", ".env" },
      auto_refresh = true,
    },
    keys = {
      { "<leader>cv", "<cmd>VenvSelect<cr>", desc = "Select Venv" },
    },
  },

  {
    "AckslD/swenv.nvim",
    config = function()
      require("swenv").setup {
        venvs_path = vim.fn.expand "~/venvs/",
      }
    end,
    keys = {
      { "<leader>sv", "<cmd>lua require('swenv').pick_venv()<cr>", desc = "Switch Venv" },
    },
  },

  {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    ft = { "typescript", "typescriptreact" },
    opts = {
      on_attach = function(client, bufnr)
        client.server_capabilities.documentFormattingProvider = false
      end,
      settings = {
        tsserver_file_preferences = {
          includeInlayEnumMemberValueHints = true,
          includeInlayFunctionLikeReturnTypeHints = true,
          includeInlayFunctionParameterTypeHints = true,
        },
      },
    },
  },
  {
    "windwp/nvim-ts-autotag",
    ft = { "javascriptreact", "typescriptreact" },
    config = true,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
        "javascript",
        "typescript",
        "tsx",
        "python", -- Changed "jsx" to "tsx"
      },
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      indent = { enable = true },
    },
  },

  {
    "abecodes/tabout.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "hrsh7th/nvim-cmp",
    },
    event = "InsertEnter",
    after = "nvim-cmp",
    config = function()
      require("tabout").setup {
        tabkey = "<Tab>", -- Re-enable tabkey in tabout
        backwards_tabkey = "<S-Tab>", -- Re-enable backwards tabkey
        completion = false, -- Disable completion handling in tabout
        tabouts = {
          { open = "'", close = "'" },
          { open = '"', close = '"' },
          { open = "`", close = "`" },
          { open = "(", close = ")" },
          { open = "[", close = "]" },
          { open = "{", close = "}" },
          { open = "<", close = ">" }, -- For JSX/HTML
        },
        ignore_beginning = false,
        act_as_tab = true,
      }
    end,
  },
  -- test new blink
  -- { import = "nvchad.blink.lazyspec" },

  -- {
  -- 	"nvim-treesitter/nvim-treesitter",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"vim", "lua", "vimdoc",
  --      "html", "css"
  -- 		},
  -- 	},
  -- },
}
