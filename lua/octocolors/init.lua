local config = require("octocolors.config")
local util = require("octocolors.util")
local theme = require("octocolors.theme")

local M = {}

---@param style "dark.default"|"dark.dimmed"|"light.default"|nil
function M._load(style)
	if style and not M._style and M._background then
		M._style = require("octocolors.config").options.style
		M._background = require("octocolors.config").options.background
	elseif not style and M._style and M._background then
		require("octocolors.config").options.style = M._style
		require("octocolors.config").options.background = M._background
		M._style = nil
		M._background = nil
	end
	local st, bg = nil, nil
	if style then
		bg, st = style:match("(%a+)%.(%a+)")
	end
	M.load({ style = st, background = bg })
end

---@param opts octocolors.config|nil
function M.load(opts)
	if opts then require("octocolors.config").extend(opts) end
	util.load(theme.setup((opts and opts.style) or require("octocolors.config").options.style))
end

M.setup = config.setup

return M
