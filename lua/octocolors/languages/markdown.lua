local util = require("octocolors.util")

---@type OctoLanguage
local M = {}

function M.highlights(scale)
	return {
		["@text.title.markdown"] = { fg = util.light_dark(scale.blue[7], scale.blue[3]), bold = true },
		["@text.reference.markdown_inline"] = { fg = util.light_dark(scale.blue[7], scale.blue[3]) },
	}
end
return M
