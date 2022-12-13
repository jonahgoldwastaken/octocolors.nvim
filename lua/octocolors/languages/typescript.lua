---@class OctoLanguage
---@field highlights fun(c: OctoColors): Highlights
local M = {}

function M.highlights(c)
	return {
		["@punctuation.delimiter.ts"] = { fg = c.red },
		["@type.ts"] = { fg = c.orange },
		["@variable.ts"] = { fg = c.fg },
	}
end

return M
