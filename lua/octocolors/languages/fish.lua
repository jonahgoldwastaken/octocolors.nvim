local util = require("octocolors.util")

---@type OctoLanguage
local M = {}

function M.highlights(scale)
	return {
		["@function.builtin.fish"] = { fg = util.light_dark(scale.blue[7], scale.blue[3]) },
		["@function.call.fish"] = { fg = util.light_dark(scale.gray[9], scale.gray[2]) },
		["@parameter.fish"] = { fg = util.light_dark(scale.blue[9], scale.blue[2]) },
		["@number.fish"] = { fg = util.light_dark(scale.gray[9], scale.gray[2]) },
	}
end

return M
