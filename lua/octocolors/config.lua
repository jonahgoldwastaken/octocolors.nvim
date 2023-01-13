local M = {}

---@class octocolors.syntax_styles
---@field comments table<string,any>
---@field keywords table<string,any>
---@field functions table<string,any>
---@field variables table<string,any>

---@class octocolors.config
---@field background "auto"|"light"|"dark"
---@field theme "default"|"dimmed"|"high_contrast" theme, "dimmed" only has an effect for the dark theme
---@field styles octocolors.syntax_styles
---@field sidebars table<string>
---@field lazy_load_syntax boolean

---@type octocolors.config
local defaults = {
	background = "auto", -- May be "light", "dark" or "auto"
	theme = "default", -- May be "default" or "dimmed", currently only affects the dark theme
	styles = {
		-- Customise the styling of certain syntax groups
		-- All attr-list values for `:help nvim_set_hl` are valid
		comments = { italic = true },
		keywords = {},
		functions = {},
		variables = {},
	},
	sidebars = { "qf", "vista_kind", "terminal", "help" }, -- Darkens the background for these filetypes
	lazy_load_syntax = true, -- Lazy load custom syntax highlights on FileType event
}

M.options = {}

--- @param opts octocolors.config|nil
function M.setup(opts) M.options = vim.tbl_deep_extend("force", defaults, opts or {}) end

--- @param opts octocolors.config|nil
function M.extend(opts)
	M.options = vim.tbl_deep_extend("force", {}, M.options or defaults, opts or {})
end

M.setup()

return M
