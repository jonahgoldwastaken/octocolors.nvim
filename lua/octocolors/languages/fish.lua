---@type OctoLanguage
local M = {}

function M.highlights(c)
	return {
		["@function.builtin.fish"] = { fg = c.blue2 },
		["@function.call.fish"] = { fg = c.fg },
		["@parameter.fish"] = { fg = c.blue3 },
		["@number.fish"] = { fg = c.fg },
	}
end

return M
