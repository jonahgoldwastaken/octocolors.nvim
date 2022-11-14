local util = require("octocolors.util")
local M = {}

local _loaded_style = ""
local _colors = {}

function M.setup()
	local opts = require("octocolors.config").options

	local style = opts.background == "auto" and vim.o.background or opts.background
	if style == _loaded_style then return _colors end
	_loaded_style = style

	local p_ok, palette = pcall(require, "octocolors.colors." .. style)
	if not p_ok then
		vim.notify("octocolors: invalid background option: " .. style, vim.log.levels.ERROR)
		return
	end
	_colors = util.color_to_hex(palette)
	return _colors
end

return M
