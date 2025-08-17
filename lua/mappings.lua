require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

-- map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- LSP keymaps
map("n", "<leader>lp", "<cmd>LspInfo<cr>", { desc = "LSP Info" })
map("n", "gd", vim.lsp.buf.definition, { desc = "Goto Definition" })
map("n", "gr", "<cmd>Telescope lsp_references<cr>", { desc = "References" })
map("n", "<leader>lr", "<cmd>LspRestart<cr>", { desc = "Restart LSP" })

-- Formatting
map("n", "<leader>fc", function()
  vim.lsp.buf.format { async = true }
end, { desc = "Format File" })

-- Debugging (requires nvim-dap setup)
map("n", "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", { desc = "Toggle Breakpoint" })

map("n", "<leader>dc", "<cmd>lua require'dap'.continue()<cr>", { desc = "Continue Debug" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- Venv management
map("n", "<leader>pv", function()
  local venv = require "utils.venv"
  venv.setup_venv()
end, { desc = "Detect Python venv" })

map("n", "<leader>pc", function()
  local choice = vim.fn.input("Create venv (venv/.venv): ", "venv")
  if choice == "venv" or choice == ".venv" then
    vim.cmd("!python -m venv " .. choice)
    require("utils.venv").setup_venv()
  end
end, { desc = "Create Python venv" })

map("i", "<ESC>", function()
  local cmp = require "cmp"

  -- Close documentation window if visible
  pcall(function()
    if cmp.visible_docs() then
      cmp.close_docs()
    end
  end)

  -- Close completion menu if visible
  pcall(function()
    if cmp.visible() then
      cmp.close() -- Use close instead of abort
      return "" -- Stay in insert mode
    end
  end)

  -- Fallback to normal escape
  return "<ESC>"
end, { expr = true, desc = "Smart escape" })

map("n", "<leader>ws", "<cmd>wall<cr>", { desc = "Save all buffers" })
