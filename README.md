# 🐙 octocolors.nvim 🐙

A proper implementation of GitHub's colour scheme for Neovim, written in Lua and with support for several plugins.

## Requirements

- Neovim 0.9 (nightly) for now, as I haven't tested this on older versions
- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)

## Installation

Install with your favourite package manager:

### [lazy](https://github.com/folke/lazy.nvim)

```lua
{
	"jonahgoldwastaken/octocolors.nvim",
	lazy = false,
	priority = 1000,
}
```

### [packer](https://github.com/wbthomason/packer.nvim)

```lua
use "jonahgoldwastaken/octocolors.nvim"
```

#### [vim-plug](https://github.com/junegunn/vim-plug)

```vim
Plug 'jonahgoldwastaken/octocolors.nvim', { 'branch': 'main' }
```

## Usage

```vim
" VimScript
colorscheme octocolors
```

```lua
-- Lua
vim.cmd([[colorscheme octocolors]])
```

To enable octocolors in lualine, set it as the theme during setup:

```lua
require('lualine').setup({
	options = {
		-- more configuration
		theme = "octocolors" -- or "auto" if colorscheme is set to octocolors already
		-- more configuration
	}
})
```

## Configuration

> ⚠️ Make sure you configure octocolors before loading the scheme by calling `colorscheme octocolors`

When `theme` is set to `auto`, octocolors uses `vim.o.background` to select the correct colours.

```lua
require("octocolors").setup({
	theme = "auto", -- May be "light", "dark" or "auto"
	styles = {
		-- Customise the styling of certain syntax groups
		-- All attr-list values for `:help nvim_set_hl` are valid
		comments = { italic = true },
		keywords = {},
		functions = {},
		variables = {},
	},
	sidebars = { "qf", "vista_kind", "terminal", "help" }, -- Set a darker background for sidebar-like windows. "nvim_tree" or "neotree" are nice additions here
	lazy_load_syntax = true, -- Lazy load custom syntax highlights on FileType event for different
})
```

## Plugins supported

- [TreeSitter](https://github.com/nvim-treesitter/nvim-treesitter)
- [LSP Diagnostics](https://neovim.io/doc/user/lsp.html)
- [GitSigns](https://github.com/lewis6991/gitsigns.nvim)
- [GitGutter](https://github.com/airblade/vim-gitgutter)
- [Telescope](https://github.com/nvim-telescope/telescope.nvim)
- [NvimTree](https://github.com/kyazdani42/nvim-tree.lua)
- [Neotree](https://github.com/nvim-neo-tree/neo-tree.nvim)
- [Lualine](https://github.com/hoob3rt/lualine.nvim)
- [Trouble](https://github.com/folke/trouble.nvim)
- [nvim-ts-rainbow](https://github.com/mrjones2014/nvim-ts-rainbow)
- [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
- [Noice](https://github.com/folke/noice.nvim)
- [Notify](https://github.com/rcarriga/nvim-notify)
- [Mason](https://github.com/williamboman/mason.nvim)
- [Hop.nvim](https://github.com/phaazon/hop.nvim)

## Acknowledgements

- [Tokyo Night by folke](https://github.com/folke/tokyonight.nvim) for code inspiration and general project structure.
- [GitHub VSCode Theme](https://github.com/primer/github-vscode-theme) as the main base for the chosen colours.
- [Primer Primitives](https://github.com/primer/primitives) for supplying the colours.
