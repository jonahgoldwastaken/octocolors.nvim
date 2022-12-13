---@type OctoLanguage
local M = {}

function M.highlights(c)
	return {
		["@parameter.swift"] = { fg = c.blue2 },
		["@type.swift"] = { fg = c.blue2 },
		["@function.call.swift"] = { fg = c.blue2 },
		["@namespace.swift"] = { fg = c.purple },
	}
end

return M
