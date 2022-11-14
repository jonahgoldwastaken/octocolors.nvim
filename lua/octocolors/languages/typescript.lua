local util = require("octocolors.util")

---@class OctoLanguage
---@field highlights fun(colors: OctoPalette, scale: table<string, table>): Highlights
local M = {}

function M.highlights(c, scale)
	return {
		["@punctuation.delimiter.ts"] = { fg = util.light_dark(scale.red[6], scale.red[4]) },
		["@type.ts"] = { fg = util.light_dark(scale.orange[7], scale.orange[3]) },
		["@variable.ts"] = { fg = c.fg.default },
	}
end

return M
