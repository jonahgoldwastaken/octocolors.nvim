---@type OctoLanguage
local M = {}

function M.highlights(c)
	return {
		["@punctuation.delimiter.rust"] = { fg = c.red },
		["@type.rust"] = { fg = c.orange },
	}
end

return M
