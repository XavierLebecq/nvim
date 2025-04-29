-- Configuration de base
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4 

vim.opt.swapfile = false

vim.opt.number = true
vim.opt.relativenumber = false

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.termguicolors = true

vim.g.user42 = "xlebecq"
vim.g.mail42 = "xlebecq@student.42.fr"
vim.g.mapleader = "\\"
vim.cmd("colorscheme synthwave84")

-- Appliquer la transparence
vim.cmd [[
  hi Normal guibg=NONE ctermbg=NONE
  hi NormalNC guibg=NONE ctermbg=NONE
  hi EndOfBuffer guibg=NONE ctermbg=NONE
  hi VertSplit guibg=NONE ctermbg=NONE
  hi StatusLine guibg=NONE ctermbg=NONE
  hi NvimTreeNormal guibg=NONE ctermbg=NONE
]]


vim.cmd [[
  autocmd BufNewFile * :Stdheader
]]

-- Configuration de Packer
require("packer").startup(function()
  use "wbthomason/packer.nvim"

  use "artanikin/vim-synthwave84"

  use {
    "nvim-telescope/telescope.nvim",
    requires = { "nvim-lua/plenary.nvim" }
  }

  use "nvim-telescope/telescope-file-browser.nvim"

  -- **AJOUT DE `project.nvim` POUR LA GESTION DES PROJETS**
  use {
    "ahmedkhalf/project.nvim",
    config = function()
      require("project_nvim").setup {
        -- Méthodes de détection de la racine du projet
        detection_methods = { "pattern", "lsp" },

        -- Motifs pour détecter la racine
        patterns = { ".git", "package.json", "Makefile", "README.md" },

        -- Répertoires à exclure
        exclude_dirs = { "~/.cargo/*", "target/*", ".objs/*" },
      }
    end
  }
end)

-- Charger et configurer `project.nvim`
require("project_nvim").setup {
  -- Cette configuration peut être personnalisée si nécessaire
}

-- Configuration de Telescope
local actions = require("telescope.actions")

require('telescope').setup {
  defaults = {
    -- Configuration générale de Telescope
    prompt_prefix = "> ",
    selection_caret = "> ",
    path_display = { "smart" },

    -- Ajout des mappings pour ouvrir dans différents splits
    mappings = {
      i = {
        ["<C-v>"] = actions.select_vertical,  -- Ouvrir en split vertical avec Ctrl+V
        ["<C-x>"] = actions.select_horizontal, -- Ouvrir en split horizontal avec Ctrl+X
        ["<C-t>"] = actions.select_tab,  -- Ouvrir dans un nouvel onglet avec Ctrl+T
      },
      n = {
        ["<C-v>"] = actions.select_vertical,
        ["<C-x>"] = actions.select_horizontal,
        ["<C-t>"] = actions.select_tab,
      }
    },
      file_ignore_patterns = { 
          "node_modules",
          "objects",
          "object",
          "$.d",
          "$.o"
      }
    },
  pickers = {
    live_grep = {
      -- Paramètres spécifiques pour Live Grep (peut rester vide ici)
    },
    find_files = {
      -- Paramètres spécifiques pour Find Files (peut rester vide ici)
    },
  },
  extensions = {
    file_browser = {
  	    hijack_netrw = true, -- Remplace le navigateur de fichiers par défaut
      mappings = {
        ["n"] = { -- Mode normal
          ["a"] = function(prompt_bufnr)
            local fb_actions = require("telescope._extensions.file_browser.actions")
            fb_actions.create(prompt_bufnr) -- Crée un fichier/dossier avec 'a' en mode normal
          end,
        },
      },
    },
  },
}

-- Charger les extensions de Telescope
require('telescope').load_extension('file_browser')

-- Fonction corrigée pour obtenir la racine du projet
local function live_grep_project()
  local project_root = require("project_nvim.project").get_project_root() -- Correction ici
  require('telescope.builtin').live_grep({
    cwd = project_root, -- Utiliser la racine du projet comme répertoire de recherche
  })
end

-- Raccourcis clavier pour Telescope
local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = "Telescope - Trouver des fichiers" })

-- **MODIFICATION : UTILISER `live_grep_project` POUR RECHERCHER DANS TOUT LE PROJET**
vim.keymap.set('n', '<leader>fg', live_grep_project, { desc = "Telescope - Recherche texte dans le projet" })

vim.keymap.set('n', '<leader>b', builtin.buffers, { desc = "Telescope - Buffers ouverts" })

vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = "Telescope - Aide intégrée" })

vim.keymap.set('n', '<leader>fb', require('telescope').extensions.file_browser.file_browser, { desc = "Telescope - Navigateur de fichiers" })

-- 💙 Rendre les bordures de Telescope bleues
vim.api.nvim_set_hl(0, "TelescopeBorder", { fg = "#4169E1", bg = "NONE" })
vim.api.nvim_set_hl(0, "TelescopePromptBorder", { fg = "#4169E1", bg = "NONE" })
vim.api.nvim_set_hl(0, "TelescopeResultsBorder", { fg = "#4169E1", bg = "NONE" })
vim.api.nvim_set_hl(0, "TelescopePreviewBorder", { fg = "#4169E1", bg = "NONE" })

-- 💙 Rendre les tildes (~) en bleu
vim.api.nvim_set_hl(0, "EndOfBuffer", { fg = "#4169E1", bg = "NONE" })

-- 💙 Bleu pour les numéros classiques
vim.api.nvim_set_hl(0, "LineNr", { fg = "#4169E1", bg = "NONE" })

-- ❤️ Rouge pour le numéro de la ligne active
vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#FF5555", bg = "NONE" })

vim.opt.cursorline = true
