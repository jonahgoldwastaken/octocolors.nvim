---@type OctoLanguage
local M = {}

function M.highlights(c)
	return {
		["@function.lua"] = { fg = c.red },
		["@function.call.lua"] = { fg = c.blue2 },
		["@function.builtin.lua"] = { fg = c.blue2 },
		["@definition.function.lua"] = { fg = c.purple },
	}
end

return M
