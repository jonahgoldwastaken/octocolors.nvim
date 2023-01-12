---@type OctoLanguage
local M = {}

function M.highlights(c)
	return {
		["@function.lua"] = { fg = c.red },
		["@function.call.lua"] = { fg = c.blue2 },
		["@function.builtin.lua"] = { fg = c.blue2 },
		["@definition.function.lua"] = { fg = c.purple },
		["@constructor.lua"] = { fg = c.fg },
		["@type.lua"] = { fg = c.blue2 },
		["@field.lua"] = { fg = c.blue2 },
		["@class.lua"] = { fg = c.blue2 },
		["@property.lua"] = { fg = c.blue2 },
	}
end

return M
