-- Configuration minimale pour Packer
require("packer").startup(function()
  use "wbthomason/packer.nvim" -- Gestionnaire de plugins

  use {
    "nvim-telescope/telescope.nvim",
    requires = { "nvim-lua/plenary.nvim" } -- Dépendance obligatoire pour Telescope
  }
end)

-- Autocommande pour Stdheader
vim.cmd [[
  autocmd BufNewFile * :Stdheader
]]

-- Variables pour 42
vim.g.user42 = "xlebecq"
vim.g.mail42 = "xlebecq@student.42.fr"

