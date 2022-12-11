local util = require("octocolors.util")

---@type OctoLanguage
local M = {}

function M.highlights(scale)
	return {
		["@punctuation.delimiter.rust"] = { fg = util.light_dark(scale.red[6], scale.red[4]) },
		["@type.rust"] = { fg = util.light_dark(scale.orange[7], scale.orange[3]) },
	}
end

return M
