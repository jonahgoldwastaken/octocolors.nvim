---@type OctoLanguage
local M = {}

function M.highlights(c)
	return {
		["@type.css"] = { fg = c.green2 },
		["@property.css"] = { fg = c.blue2 },
		["@type.definition.css"] = { fg = c.orange },
	}
end

return M
