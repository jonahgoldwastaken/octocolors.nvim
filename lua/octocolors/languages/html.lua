---@type octocolors.language
local M = {}

function M.highlights(c)
	return {
		["@operator.html"] = { fg = c.fg },
	}
end

return M
