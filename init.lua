vim.g.user42 = "xlebecq"
vim.g.mail42 = "xlebecq@student.42.fr"
vim.g.mapleader = "\\"

vim.cmd [[
  autocmd BufNewFile * :Stdheader
]]

require("packer").startup(function()
  use "wbthomason/packer.nvim"

  use "artanikin/vim-synthwave84"

  use {
    "nvim-telescope/telescope.nvim",
    requires = { "nvim-lua/plenary.nvim" }
  }
end)

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = "Telescope - Trouver des fichiers" })





