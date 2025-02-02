  return {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 100,

    config = function()
      vim.cmd.colorscheme "catppuccin"
    end
  }
