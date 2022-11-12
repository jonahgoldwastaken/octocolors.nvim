# 🐙 octocolors.nvim 🐙

A proper implementation of GitHub's color scheme for Neovim, written in Lua and with support for several plugins.

## Requirements

- Neovim 0.9 (nightly) for now, as I haven't tested this on older versions
- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)

## Installation

Install with your favourite package manager:

### [packer](https://github.com/wbthomason/packer.nvim)

```lua
use "jonahgoldwastaken/octocolors.nvim"
```

#### [vim-plug](https://github.com/junegunn/vim-plug)

```vim
Plug 'jonahgoldwastaken/octocolors.nvim', { 'branch': 'main' } 
```

## Usage

### Without specifying options

```vim
" VimScript
colorscheme octocolors
```

```lua
-- Lua
vim.cmd([[colorscheme octocolors]])
```
