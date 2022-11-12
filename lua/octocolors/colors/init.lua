local util = require("octocolors.util")
local M = {}

function M.setup(opts)
	opts = opts or {}
	local config = require("octocolors.config")

	local style = config.options.background == "auto" and vim.o.background
		or config.options.background
	local p_ok, palette = pcall(require, "octocolors.colors." .. style)
	if not p_ok then
		vim.notify("octocolors: invalid background option: " .. style, vim.log.levels.ERROR)
		return
	end
	return util.color_to_hex(palette)
end

return M
