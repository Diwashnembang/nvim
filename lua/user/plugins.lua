local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  print("Installing packer close and reopen Neovim...")
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])


-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end


-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

return packer.startup(function(use)
  -- [[ Plugins Go Here ]]
  use 'lewis6991/impatient.nvim'  --loads lua module faster / faster nvim load
  use ({'wbthomason/packer.nvim'}) -- Packer can manage itself
  use({'nvim-lua/popup.nvim'}) --  An implementation of the Popup API from vim in Neovim
  use({ "nvim-lua/plenary.nvim"}) -- Useful lua functions used by lots of plugins

   -- Lazy loading:
  -- Load on specific commands
  use {'tpope/vim-dispatch', opt = true, cmd = {'Dispatch', 'Make', 'Focus', 'Start'}}
  --End Lazy Loading

  -- Cmp Plugins[[Auto complete ]]
  use({ "hrsh7th/nvim-cmp"}) -- The completion plugin
	use({ "hrsh7th/cmp-buffer"}) -- buffer completions
  use({ "hrsh7th/cmp-path"}) -- path completions
	use({ "saadparwaiz1/cmp_luasnip"}) --snippet completions 
  use({ "hrsh7th/cmp-nvim-lua"}) -- cmp for nvim inlua 
  use({ "hrsh7th/cmp-nvim-lsp"}) -- cmp for lsp

	-- snippets
	use({ "L3MON4D3/LuaSnip"}) --snippet engine
	use({ "rafamadriz/friendly-snippets"}) -- a bunch of snippets to use

  
	-- LSP
	use({ "neovim/nvim-lspconfig"}) -- enable LSP
	use({ "williamboman/nvim-lsp-installer" }) -- simple to use language server installer
  use({"jose-elias-alvarez/null-ls.nvim"})     --For linting
   --File Nagivation 
  use {                                              -- filesystem navigation
    'kyazdani42/nvim-tree.lua',
     requires = 'kyazdani42/nvim-web-devicons'        -- filesystem icons
  }

   -- [[ Theme ]]
  use { 'mhinz/vim-startify' }                       -- start screen
  use { 'DanilaMihailov/beacon.nvim' }               -- cursor jump
  use {
    'nvim-lualine/lualine.nvim',                     -- statusline
    requires = {'kyazdani42/nvim-web-devicons',
                opt = true}
  }
  use { 'Mofiqul/dracula.nvim' }                     -- colorscheme:

   --Telescope
  use {
    'nvim-telescope/telescope.nvim',                 -- fuzzy finder
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use {'nvim-telescope/telescope-media-files.nvim'}         --show photos in the preview
  --
  --Tree Sitter
  use{'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate'}
  use{"p00f/nvim-ts-rainbow"}               --Plugins for treesitter that gives rainbow brackets
  --
-- [[ Dev ]]
  use { 'majutsushi/tagbar' }                        -- code structure
  use { 'Yggdroot/indentLine' }                      -- see indentation
  use { 'tpope/vim-fugitive' }                       -- git integration
  use { 'junegunn/gv.vim' }                          -- commit history
  use { 'windwp/nvim-autopairs' }                    -- auto close brackets, etc.
  use {'JoosepAlviste/nvim-ts-context-commentstring'}  --for comments
  use {"numToStr/Comment.nvim"}                        -- Easily comment stuff
  --bufferLine
  use {'akinsho/bufferline.nvim', tag = "v2.*", requires = 'kyazdani42/nvim-web-devicons'}
  use {'akinsho/toggleterm.nvim'}                      --Terminal

  -- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end

end
--config = {
 --package_root = vim.fn.stdpath('config') .. '/site/pack'
--}
)
