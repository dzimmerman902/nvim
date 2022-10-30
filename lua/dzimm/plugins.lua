local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system {
        'git',
        'clone',
        '--depth',
        '1',
        'https://github.com/wbthomason/packer.nvim',
        install_path,
    }
    print 'Installing packer close and reopen Neovim...'
    vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, 'packer')
if not status_ok then
    return
end

-- Have packer use a popup window
packer.init {
    display = {
        open_fn = function()
            return require('packer.util').float { border = 'rounded' }
        end,
    },
}

return packer.startup(function(use)
    -- Packer
    use 'wbthomason/packer.nvim'
    use 'nvim-lua/plenary.nvim'
    use 'kyazdani42/nvim-web-devicons'

    -- lualine
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    }

    -- Auto Pairs
    use 'windwp/nvim-autopairs' -- Autopairs, integrates with both cmp and treesitter

    -- BarBar
    use 'romgrk/barbar.nvim'
    --
    -- Comments
    use 'numToStr/Comment.nvim' -- Easily comment stuff
    use 'JoosepAlviste/nvim-ts-context-commentstring'

    -- Color Schemes
    -- use 'rmehri01/onenord.nvim'
    use 'folke/tokyonight.nvim'

    -- Cmp Plugins
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer' -- The completion plugin
    use 'hrsh7th/cmp-path' -- The completion plugin
    use 'hrsh7th/cmp-cmdline' -- The completion plugin
    use 'hrsh7th/nvim-cmp' -- The completion plugin
    use 'hrsh7th/cmp-vsnip'
    use 'hrsh7th/vim-vsnip'

    -- DAP
    use 'mfussenegger/nvim-dap'
    use 'rcarriga/nvim-dap-ui'
    use 'mxsdev/nvim-dap-vscode-js'
    use {
        'microsoft/vscode-js-debug',
        opt = true,
        run = 'npm install --legacy-peer-deps && npm run compile',
    }

    -- Emmet
    use 'mattn/emmet-vim'

    -- fzf
    use { 'ibhagwan/fzf-lua', branch = 'main' }

    -- Glow
    use { 'ellisonleao/glow.nvim' }

    -- Git
    use 'lewis6991/gitsigns.nvim'
    use 'f-person/git-blame.nvim'

    -- Illuminate
    use 'RRethy/vim-illuminate'

    -- LSP
    use 'neovim/nvim-lspconfig'
    use 'jose-elias-alvarez/null-ls.nvim'

    -- Nvim Tree
    use 'preservim/nerdtree'

    -- Replace With Register
    use 'vim-scripts/ReplaceWithRegister'

    -- Snippets
    use 'L3MON4D3/LuaSnip' --snippet engine
    use 'rafamadriz/friendly-snippets' -- a bunch of snippets to use

    -- Surround
    use 'tpope/vim-surround'

    -- Toggleterm
    use 'akinsho/toggleterm.nvim'

    -- Treesitter
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
    }

    -- Windows
    use {
        'anuvyklack/windows.nvim',
        requires = 'anuvyklack/middleclass',
    }

    use 'ryanoasis/vim-devicons'
    use 'tiagofumo/vim-nerdtree-syntax-highlight'

    if PACKER_BOOTSTRAP then
        require('packer').sync()
    end
end)
