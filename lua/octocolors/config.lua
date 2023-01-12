local M = {}

--- @class Config
local defaults = {
	background = "auto", -- May be "light", "dark" or "auto"
	style = "default", -- May be "default" or "dimmed"
	styles = {
		comments = { italic = true },
		keywords = {},
		functions = {},
		variables = {},
	},
	sidebars = { "qf", "vista_kind", "terminal", "help" }, -- Darkens the background for these filetypes
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
