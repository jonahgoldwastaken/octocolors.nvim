---@type octocolors.language
local M = {}

function M.highlights(c)
	return {
		["@text.title.help"] = { fg = c.blue2, bold = true },
	}
end

return M
