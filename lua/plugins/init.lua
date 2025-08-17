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

  {
    "kylechui/nvim-surround",
    version = "^3.0.0", -- Stable version
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup {
        keymaps = {
          insert = false,
          insert_line = false,
          normal = "ys", -- Add surround (original)
          normal_cur = "yss", -- Add surround to current line
          normal_line = "yS", -- Add surround with newlines
          normal_cur_line = "ySS", -- Add surround to current line with newlines
          visual = "S", -- Visual mode: S
          visual_line = "S", -- Visual line mode
          delete = "ds", -- Delete surround
          change = "cs", -- Change surround
        },
        aliases = {
          ["q"] = { "`", "'", '"' }, -- Press csq" to change any quote to double quotes
          ["b"] = { ")", "]", "}" }, -- Press csb) to change any bracket to parentheses
        },
        surrounds = {
          HTML = {
            ["t"] = { -- Use 't' for tags
              add = function()
                local tag = vim.fn.input "Tag: "
                return { { "<" .. tag .. ">" }, { "</" .. tag .. ">" } }
              end,
            },
          },
        },
      }
    end,
  },

  {
    "Pocco81/auto-save.nvim",
    event = "BufEnter",
    config = function()
      require("auto-save").setup {
        enabled = true,
        trigger_events = {
          immediate_save = { "InsertLeave", "FocusLost" },
          defer_save = { "TextChanged", "TextChangedI" },
        },
        debounce_delay = 1000,
        execution_message = {
          message = "󰄳 Auto-saved",
          dim = 0.3,
          cleaning_interval = 1250,
        },
        conditions = {
          exists = true,
          modifiable = true,
          filetype_is_not = { "alpha", "dashboard", "NvimTree", "TelescopePrompt", "lua" },
        },
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
