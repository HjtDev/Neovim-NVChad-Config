require "nvchad.autocmds"

local venv = require "utils.venv"

vim.api.nvim_create_autocmd({ "VimEnter", "DirChanged" }, {
  pattern = "*",
  callback = function()
    venv.setup_venv()
  end,
})
