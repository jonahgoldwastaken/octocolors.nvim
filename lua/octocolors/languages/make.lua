local util = require("octocolors.util")

---@type OctoLanguage
local M = {}

function M.highlights(c, scale)
	return {
		["@operator.make"] = { fg = c.fg.default },
		["@symbol.make"] = { fg = c.fg.default },
		["@function.builtin.make"] = { fg = util.light_dark(scale.blue[7], scale.blue[3]) },
	}
end

return M
