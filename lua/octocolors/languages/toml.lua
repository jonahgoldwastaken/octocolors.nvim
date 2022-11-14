local util = require("octocolors.util")

---@type OctoLanguage
local M = {}

function M.highlights(c, scale)
	return {
		["@property.toml"] = { fg = c.fg.default },
		["@operator.toml"] = { fg = c.fg.default },
		["@type.toml"] = { fg = util.light_dark(scale.purple[6], scale.purple[3]) },
	}
end
return M
