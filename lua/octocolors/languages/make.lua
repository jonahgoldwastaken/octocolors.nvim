---@type OctoLanguage
local M = {}

function M.highlights(c)
	return {
		["@operator.make"] = { fg = c.fg },
		["@symbol.make"] = { fg = c.fg },
		["@function.builtin.make"] = { fg = c.blue2 },
	}
end

return M
