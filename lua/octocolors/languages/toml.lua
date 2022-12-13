---@type OctoLanguage
local M = {}

function M.highlights(c)
	return {
		["@property.toml"] = { fg = c.fg },
		["@operator.toml"] = { fg = c.fg },
		["@type.toml"] = { fg = c.purple },
	}
end
return M
