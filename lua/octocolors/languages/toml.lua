local util = require("octocolors.util")

---@type OctoLanguage
local M = {}

function M.highlights(scale)
	return {
		["@property.toml"] = { fg = util.light_dark(scale.gray[9], scale.gray[2]) },
		["@operator.toml"] = { fg = util.light_dark(scale.gray[9], scale.gray[2]) },
		["@type.toml"] = { fg = util.light_dark(scale.purple[6], scale.purple[3]) },
	}
end
return M
