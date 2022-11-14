local util = require("octocolors.util")

---@type OctoLanguage
local M = {}

function M.highlights(_, scale)
	return {
		["@parameter.swift"] = { fg = util.light_dark(scale.blue[7], scale.blue[3]) },
		["@type.swift"] = { fg = util.light_dark(scale.blue[7], scale.blue[3]) },
		["@function.call.swift"] = { fg = util.light_dark(scale.blue[7], scale.blue[3]) },
		["@namespace.swift"] = { fg = util.light_dark(scale.purple[6], scale.purple[3]) },
	}
end

return M
