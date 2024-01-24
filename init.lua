require('packer').startup(function(use)

	use 'wbthomason/packer.nvim'

	use { "catppuccin/nvim", as = "catppuccin" }

	use "nvim-lua/plenary.nvim"

	use {'neoclide/coc.nvim', branch = 'release'}

	use {
    		"williamboman/mason.nvim",
    		"williamboman/mason-lspconfig.nvim",
    		"neovim/nvim-lspconfig",
	}

	use {
 		'nvim-telescope/telescope.nvim', tag = '0.1.5',
 		requires = { {'nvim-lua/plenary.nvim'} }
	}
	
	use {"CRAG666/code_runner.nvim"}

	use {"github/copilot.vim"}

end)

-- LSP --
require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = { "pyright" }, -- Automatically install LSP servers
	automatic_installation = true,
})

require('lspconfig')['pyright'].setup{}

-- Code Runner --
require('code_runner').setup({
	filetype = {
		python = "python3 -u"
	}
})

print("Wassup homeslice! You ready for some programming?") -- always.

-- LOOK & FEEL --
vim.cmd("colorscheme catppuccin-frappe")
vim.cmd("set number")
vim.cmd("set relativenumber")
vim.cmd("set nowrap")

-- BINDS --
vim.g.mapleader = ","
vim.cmd("nnoremap <leader>r :RunCode<CR>")
vim.cmd("nnoremap <leader>rf :RunFile<CR>")
vim.cmd("nnoremap <leader>rp :RunProject<CR>")
vim.cmd("nnoremap <leader>rc :RunClose<CR>")
vim.cmd("nnoremap <leader>p :Telescope find_files<CR>")
vim.cmd("nnoremap <leader>o :Telescope live_grep<CR>")
vim.cmd("nnoremap <leader>t :Telescope<CR>")
vim.cmd("nnoremap <leader>ce :Copilot enable<CR>")
vim.cmd("nnoremap <leader>cd :Copilot disable<CR>")
vim.api.nvim_set_keymap('n', '<CapsLock>', '<Esc>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('i', '<CapsLock>', '<Esc>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('v', '<CapsLock>', '<Esc>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>y', '"+y', {noremap = true, silent = true})
vim.api.nvim_set_keymap('i', '<CR>', 'coc#pum#visible() ? coc#pum#confirm() : "\\<CR>"', {expr = true, noremap = true})

