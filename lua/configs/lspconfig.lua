require("nvchad.configs.lspconfig").defaults()

local on_attach = require("nvchad.configs.lspconfig").on_attach
local capabilities = require("nvchad.configs.lspconfig").capabilities

local util = require "lspconfig/util"

local function find_venv(path)
  local patterns = { "venv", ".venv", "env", ".env", "virtualenv" }
  for _, pattern in ipairs(patterns) do
    local venv_path = util.path.join(path, pattern)
    if util.path.exists(venv_path) then
      return venv_path
    end
  end
  return nil
end

-- Configure pyright using the new API
vim.lsp.config("pyright", {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "python" },
  before_init = function(_, config)
    local venv = find_venv(config.root_dir)
    if venv then
      config.settings = config.settings or {}
      config.settings.python = config.settings.python or {}
      config.settings.python.pythonPath = util.path.join(venv, "bin", "python")
    end
  end,
  settings = {
    python = {
      analysis = {
        typeCheckingMode = "basic",
        autoSearchPaths = true,
        useLibraryCodeForTypes = true,
        diagnosticMode = "workspace",
      },
    },
  },
})

vim.lsp.config("ts_ls", {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "javascript", "typescript", "javascriptreact", "typescriptreact" },
  init_options = {
    preferences = {
      includeInlayParameterNameHints = "all",
      includeCompletionsForModuleExports = true,
    },
  },
})

-- Tailwind CSS
vim.lsp.config("tailwindcss", {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "html", "css", "javascriptreact", "typescriptreact" },
  init_options = {
    userLanguages = {
      typescriptreact = "javascriptreact",
    },
  },
  settings = {
    tailwindCSS = {
      experimental = {
        classRegex = {
          "tw`([^`]*)",
          'tw="([^"]*)',
          'tw={"([^"}]*)',
          "tw\\.\\w+`([^`]*)",
        },
      },
    },
  },
})

-- ESLint
vim.lsp.config("eslint", {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
})

-- Enable all configured LSP servers
vim.lsp.enable "pyright"
vim.lsp.enable "ts_ls"
vim.lsp.enable "tailwindcss"
vim.lsp.enable "eslint"
