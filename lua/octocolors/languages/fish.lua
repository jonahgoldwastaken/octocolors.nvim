local util = require("octocolors.util")

---@type OctoLanguage
local M = {}

function M.highlights(c, scale)
	return {
		["@function.builtin.fish"] = { fg = util.light_dark(scale.blue[7], scale.blue[3]) },
		["@function.call.fish"] = { fg = c.fg.default },
		["@parameter.fish"] = { fg = util.light_dark(scale.blue[9], scale.blue[2]) },
		["@number.fish"] = { fg = c.fg.default },
	}
end

return M
