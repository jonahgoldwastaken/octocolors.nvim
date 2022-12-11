local util = require("octocolors.util")

---@type OctoLanguage
local M = {}

function M.highlights(scale)
	return {
		["@function.lua"] = { fg = util.light_dark(scale.red[6], scale.red[4]) },
		["@function.call.lua"] = { fg = util.light_dark(scale.blue[7], scale.blue[3]) },
		["@function.builtin.lua"] = { fg = util.light_dark(scale.blue[7], scale.blue[3]) },
		["@definition.function.lua"] = { fg = util.light_dark(scale.purple[6], scale.purple[3]) },
	}
end

return M
