# Modern Neovim Configuration

A comprehensive, modern Neovim configuration built from scratch with Lua, featuring LSP support, autocompletion, syntax highlighting, and a beautiful UI.

## ✨ Features

- **Plugin Management**: [lazy.nvim](https://github.com/folke/lazy.nvim) for fast and efficient plugin management
- **LSP Support**: Full Language Server Protocol support with [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)
- **Autocompletion**: Intelligent code completion with [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
- **Syntax Highlighting**: Advanced syntax highlighting with [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
- **Fuzzy Finding**: Powerful fuzzy finding with [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
- **File Explorer**: Modern file explorer with [neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim)
- **Git Integration**: Git signs and LazyGit integration
- **Beautiful UI**: Catppuccin colorscheme with lualine statusline
- **Code Formatting**: Automatic code formatting with [conform.nvim](https://github.com/stevearc/conform.nvim)

## 📁 Structure

```
~/.config/nvim/
├── init.lua                 # Main configuration entry point
├── lua/
│   ├── config/
│   │   ├── options.lua      # Neovim options and settings
│   │   └── keymaps.lua      # Key mappings
│   └── plugins/
│       ├── init.lua         # Basic plugins
│       ├── colorscheme.lua  # Color scheme configuration
│       ├── lsp.lua          # LSP configuration
│       ├── completion.lua   # Autocompletion setup
│       ├── treesitter.lua   # Syntax highlighting
│       ├── telescope.lua    # Fuzzy finder
│       ├── neo-tree.lua     # File explorer
│       ├── lualine.lua      # Statusline
│       ├── git.lua          # Git integration
│       ├── formatting.lua   # Code formatting
│       └── ui.lua           # UI enhancements
└── README.md
```

## 🚀 Installation

1. **Backup your existing configuration** (if any):

   ```bash
   mv ~/.config/nvim ~/.config/nvim.backup
   ```

2. **Clone this configuration**:

   ```bash
   git clone <your-repo-url> ~/.config/nvim
   ```

3. **Start Neovim**:

   ```bash
   nvim
   ```

4. **Wait for plugins to install**: Lazy.nvim will automatically install all plugins on first launch.

## ⌨️ Key Mappings

### Leader Key

- **Leader**: `<Space>`

### General

- `<leader>w` - Save file
- `<leader>q` - Quit
- `<leader>Q` - Force quit
- `<leader>nh` - Clear search highlights

### Window Management

- `<leader>sv` - Split window vertically
- `<leader>sh` - Split window horizontally
- `<leader>se` - Make splits equal size
- `<leader>sx` - Close current split

### File Operations

- `<leader>fe` - Toggle file explorer
- `<leader>fn` - New file

### Telescope (Fuzzy Finding)

- `<leader>sf` - Find files
- `<leader>sg` - Live grep
- `<leader>sb` - Find buffers
- `<leader>sh` - Help tags
- `<leader>sw` - Search current word

### LSP

- `gd` - Go to definition
- `gD` - Go to declaration
- `gi` - Go to implementation
- `gr` - Show references
- `K` - Show hover documentation
- `<leader>ca` - Code actions
- `<leader>rn` - Rename symbol
- `[d` / `]d` - Navigate diagnostics

### Git

- `<leader>lg` - Open LazyGit
- `<leader>hs` - Stage hunk
- `<leader>hr` - Reset hunk
- `<leader>hp` - Preview hunk

## 🔧 Customization

### Adding New Plugins

Create a new file in `lua/plugins/` or add to an existing one:

```lua
return {
  "author/plugin-name",
  config = function()
    -- Plugin configuration
  end,
}
```

### Modifying Key Mappings

Edit `lua/config/keymaps.lua`:

```lua
vim.keymap.set("n", "<leader>your-key", ":YourCommand<CR>", { desc = "Description" })
```

### Changing Options

Edit `lua/config/options.lua`:

```lua
vim.opt.your_option = value
```

## 📦 Included Plugins

- **lazy.nvim** - Plugin manager
- **catppuccin** - Color scheme
- **lualine.nvim** - Statusline
- **nvim-treesitter** - Syntax highlighting
- **telescope.nvim** - Fuzzy finder
- **neo-tree.nvim** - File explorer
- **nvim-lspconfig** - LSP configuration
- **mason.nvim** - LSP server manager
- **nvim-cmp** - Autocompletion
- **gitsigns.nvim** - Git integration
- **conform.nvim** - Code formatting
- **which-key.nvim** - Key binding help
- **dashboard-nvim** - Start screen

## 🛠️ Requirements

- **Neovim** >= 0.9.0
- **Git**
- **Node.js** (for some LSP servers)
- **Python** (for some LSP servers)
- A **Nerd Font** for icons (recommended: JetBrains Mono Nerd Font)

## 📝 Notes

- First startup will take some time as plugins are downloaded and installed
- LSP servers will be automatically installed via Mason
- The configuration uses the Catppuccin Mocha theme by default
- All key mappings use `<Space>` as the leader key

## 🤝 Contributing

Feel free to fork this configuration and make it your own! If you have suggestions or improvements, please open an issue or pull request.

## 📄 License

This configuration is open source and available under the MIT License.
