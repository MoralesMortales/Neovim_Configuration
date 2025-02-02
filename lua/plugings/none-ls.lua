return {
  "nvimtools/none-ls.nvim",
    dependencies = {
    "nvimtools/none-ls-extras.nvim",
  },
  config = function()
    local null_ls = require("null-ls")
    local rpc = require("null-ls.rpc")

    null_ls.setup({
      update_in_insert = false,
      sources = {
        null_ls.builtins.formatting.stylua,  --Lua
        null_ls.builtins.formatting.prettier, --Js
        null_ls.builtins.formatting.black, --Python
        null_ls.builtins.formatting.isort, --Python
        require("none-ls.diagnostics.eslint_d")
       -- null_ls.builtins.diagnostics.eslint_d, --Js
      },
    })

    rpc.flush = function() end

    vim.keymap.set("n", "<leader>gf", function()
      if vim.lsp.buf.format then
        vim.lsp.buf.format()
      else
        print("El servidor LSP no soporta formateo.")
      end
    end, {})
  end,
}

