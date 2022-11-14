local M = {}

--- @class Config
local defaults = {
	background = "auto", -- May be "light", "dark" or "auto"
	terminal_colors = false, -- Highlight colors when using `:terminal`
	styles = {
		comments = { italic = true },
		keywords = {},
		functions = {},
		variables = {},
	},
	sidebars = { "qf", "vista_kind", "terminal", "packer", "help" },
	lazy_load_syntax = true, -- Lazy load custom syntax highlights on FileType event
}

M.options = {}

--- @param opts Config|nil
function M.setup(opts) M.options = vim.tbl_deep_extend("force", defaults, opts or {}) end

--- @param opts Config|nil
function M.extend(opts)
	M.options = vim.tbl_deep_extend("force", {}, M.options or defaults, opts or {})
end

M.setup()

return M
