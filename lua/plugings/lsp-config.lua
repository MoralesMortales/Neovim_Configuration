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
      require("mason").setup()
    end,

		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					--		"ts_ls",
					--		"pyright", -- Para Python (Django)
					--		"intelephense", -- Para PHP (Laravel)
					--		"volar", -- Para Vue.js
					--		"cssls", -- Para CSS
					--		"html", -- Para HTML
					--	"tailwindcss",
					--	"clangd",
					"csharp_ls",
					"omnisharp"
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local cmp_nvim_lsp = require("cmp_nvim_lsp")
			local capabilities = cmp_nvim_lsp.default_capabilities()
			local lspconfig = require("lspconfig")

			lspconfig.csharp_ls.setup({
				capabilities = capabilities,
			})
			lspconfig.omnisharp.setup({
        cmd = { "dotnet", vim.fn.expand("~/.local/share/nvim/mason/packages/omnisharp/libexec/OmniSharp.dll") },
				capabilities = capabilities,
			})


			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},
}
