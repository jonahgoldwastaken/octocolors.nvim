---@type OctoLanguage
local M = {}

function M.highlights(c)
	return {
		["@text.title.markdown"] = { fg = c.blue2, bold = true },
		["@text.reference.markdown_inline"] = { fg = c.blue2 },
	}
end
return M
