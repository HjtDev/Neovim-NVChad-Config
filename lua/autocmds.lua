require "nvchad.autocmds"

local venv = require "utils.venv"

vim.api.nvim_create_autocmd({ "VimEnter", "DirChanged" }, {
  pattern = "*",
  callback = function()
    venv.setup_venv()
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "typescriptreact", "javascriptreact" },
  callback = function()
    vim.wo.foldmethod = "expr"
    vim.wo.foldexpr = "nvim_treesitter#foldexpr()"
  end,
})

vim.api.nvim_create_autocmd("User", {
  pattern = "CmpCompletionStarted",
  callback = function()
    vim.schedule(function()
      vim.cmd [[
        augroup CmpDynamicUpdate
          autocmd!
          autocmd TextChangedI,TextChangedP * lua require('cmp').complete()
        augroup END
      ]]
    end)
  end,
})

vim.api.nvim_create_autocmd("User", {
  pattern = "CmpCompletionEnded",
  callback = function()
    vim.cmd [[
      augroup CmpDynamicUpdate
        autocmd!
      augroup END
    ]]
  end,
})
