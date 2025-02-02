return {
  'nvim-pack/nvim-spectre',
	config = function()
		require("spectre").setup({
			is_insert_mode = false, -- Evitar abrir en modo inserción
			mapping = {
				["toggle_case"] = {
					map = "<leader>tc",
					cmd = "<cmd>lua require('spectre').change_options('ignore-case')<CR>",
					desc = "Alternar sensibilidad de mayúsculas",
				},
			},
		})
	end,
}
