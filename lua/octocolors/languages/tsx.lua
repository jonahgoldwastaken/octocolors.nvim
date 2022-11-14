local util = require("octocolors.util")

---@type OctoLanguage
local M = {}

function M.highlights(_, scale)
	return {
		["@punctuation.delimiter.tsx"] = { fg = util.light_dark(scale.red[6], scale.red[4]) },
		["@type.tsx"] = { fg = util.light_dark(scale.orange[7], scale.orange[3]) },
		["@variable.tsx"] = { fg = util.light_dark(scale.blue[7], scale.blue[3]) },
		["@property.tsx"] = { fg = util.light_dark(scale.blue[7], scale.blue[3]) },
	}
end

return M
