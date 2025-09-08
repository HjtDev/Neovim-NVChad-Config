local cmp = require "cmp"

return {
  completion = {
    autocomplete = {
      trigger_characters = { ".", ":", "(", "[", ",", "@", "*", "#", "|", "=", "-", "{", "/", "\\", "+", "?" },
      min_length = 1,
    },
    completeopt = "menu,menuone,noselect",
    keyword_length = 1,
    get_trigger_characters = function()
      return { ".", ":", "(", "[", ",", "@", "*", "#", "|", "=", "-", "{", "/", "\\", "+", "?" }
    end,
  },
  mapping = {
    ["<C-space>"] = cmp.mapping.complete(), -- Keep this
    ["<ESC>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.abort() -- Use close() instead of abort()
      else
        fallback()
      end
    end, { "i", "s" }),
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      else
        fallback() -- Defer to tabout
      end
    end, { "i", "s" }),

    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      else
        fallback() -- Defer to tabout
      end
    end, { "i", "s" }),
  },

  sources = cmp.config.sources {
    { name = "nvim_lsp" },
    { name = "luasnip" },
    { name = "buffer" },
    { name = "path" },
  },

  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },
}
