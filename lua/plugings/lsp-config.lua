 return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "ts_ls",
          "pyright",
          "intelephense",
          "volar",
          "cssls",
          "html",
          "tailwindcss",
          "clangd",
          "csharp_ls",
          "omnisharp",
        },
        automatic_installation = true, -- Opcional: instala automáticamente los LSP faltantes
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local cmp_nvim_lsp = require("cmp_nvim_lsp")
      local capabilities = cmp_nvim_lsp.default_capabilities()
      local lspconfig = require("lspconfig")

      -- Configuraciones comunes para todos los LSP
      local common_setup = {
        capabilities = capabilities,
      }

      lspconfig.lua_ls.setup(common_setup)
      lspconfig.ts_ls.setup(common_setup)  -- Cambiado de ts_ls
      lspconfig.pyright.setup(common_setup)
      lspconfig.intelephense.setup(common_setup)
      lspconfig.volar.setup(common_setup)
      lspconfig.cssls.setup(common_setup)
      lspconfig.html.setup(common_setup)
      lspconfig.tailwindcss.setup(common_setup)
      lspconfig.clangd.setup(common_setup)
      lspconfig.csharp_ls.setup(common_setup)
      -- Configuración especial para Omnisharp
      lspconfig.omnisharp.setup({
        cmd = { "dotnet", vim.fn.expand("~/.local/share/nvim/mason/packages/omnisharp/libexec/OmniSharp.dll") },
        capabilities = capabilities,
      })

      -- Atajos de teclado
      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
      vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
    end,
  },
}
