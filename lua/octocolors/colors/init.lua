local util = require "octocolors.util"
local M = {}

function M.setup()
	local mode = vim.o.background == "light" and "light" or "dark"
	return util.color_to_hex(require("octocolors.colors." .. mode))
end

return M
