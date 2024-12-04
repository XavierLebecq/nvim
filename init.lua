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

  use "nvim-telescope/telescope-file-browser.nvim"
end)

local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = "Telescope - Trouver des fichiers" })

vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = "Telescope - Recherche texte" })

vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = "Telescope - Buffers ouverts" })

vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = "Telescope - Aide intégrée" })

vim.keymap.set('n', '<leader>fb', require('telescope').extensions.file_browser.file_browser, { desc = "Telescope - Navigateur de fichiers" })

