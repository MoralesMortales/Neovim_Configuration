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
					"arduino_language_server",
					"emmet_ls", -- Opcional para Blade/HTML
          "stimulus_ls",
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
			lspconfig.ts_ls.setup(common_setup) -- Cambiado de ts_ls
			lspconfig.pyright.setup(common_setup)
			lspconfig.intelephense.setup({
				capabilities = capabilities,
				filetypes = { "php", "blade" }, -- Añade "blade" aquí
				cmd = { "intelephense", "--stdio" },
				settings = {
					intelephense = {
						environment = {
							includePaths = { "vendor/laravel/framework/src" }, -- Para autocompletado de Laravel
						},
						stubs = { -- Stubs para Laravel y paquetes comunes
							"laravel",
							"phpunit",
							"carbon",
							"monolog",
							"pdepend",
							"psr",
							"redis",
							"symfony",
						},
						diagnostics = {
							undefinedTypes = true,
							undefinedFunctions = true,
							undefinedConstants = true,
							undefinedMethods = true,
						},
					},
				},
				root_dir = function(fname)
					return lspconfig.util.root_pattern("composer.json", ".git")(fname)
						or lspconfig.util.path.dirname(fname)
				end,
			})
			lspconfig.volar.setup(common_setup)
			lspconfig.cssls.setup(common_setup)
			lspconfig.html.setup(common_setup)
			lspconfig.tailwindcss.setup(common_setup)
			lspconfig.clangd.setup(common_setup)
			lspconfig.csharp_ls.setup(common_setup)
			lspconfig.stimulus_ls.setup(common_setup)
			lspconfig.emmet_ls.setup({
				capabilities = capabilities,
				filetypes = { "html", "blade", "php" }, -- Añade "blade" aquí
				init_options = {
					html = {
						options = {
							-- Para que Emmet funcione con atributos Blade
							["bem.enabled"] = true,
						},
					},
				},
			})
			vim.filetype.add({
				extension = {
					blade = "blade", -- Asocia .blade.php con el tipo "blade"
				},
				pattern = {
					[".*%.blade%.php"] = "blade", -- Patrón alternativo
				},
			})
			lspconfig.arduino_language_server.setup({ -- ¡Nota: El nombre puede variar!
				capabilities = capabilities,
				cmd = {
					vim.fn.stdpath("data") .. "/mason/bin/arduino-language-server", -- Mason-installed server
					"-cli",
					"/home/lup/.config/nvim/bin/arduino-cli", -- Full path to arduino-cli
					"-cli-config",
					"~/.arduino15/arduino-cli.yaml",
					"-fqbn",
					"arduino:avr:uno", -- Board type (Uno)
				},
				-- Opcional: Configuración para detectar proyectos Arduino
				root_dir = function(fname)
					return lspconfig.util.root_pattern("*.ino", "platformio.ini")(fname)
				end,
			})

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
