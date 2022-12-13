---@type OctoLanguage
local M = {}

function M.highlights(c)
	return {
		["@punctuation.delimiter.tsx"] = { fg = c.red },
		["@type.tsx"] = { fg = c.orange },
		["@variable.tsx"] = { fg = c.blue2 },
		["@property.tsx"] = { fg = c.blue2 },
	}
end

return M
