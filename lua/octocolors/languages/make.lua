local util = require("octocolors.util")

---@type OctoLanguage
local M = {}

function M.highlights(scale)
	return {
		["@operator.make"] = { fg = util.light_dark(scale.gray[9], scale.gray[2]) },
		["@symbol.make"] = { fg = util.light_dark(scale.gray[9], scale.gray[2]) },
		["@function.builtin.make"] = { fg = util.light_dark(scale.blue[7], scale.blue[3]) },
	}
end

return M
