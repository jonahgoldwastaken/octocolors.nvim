---@type OctoLanguage
local M = {}

function M.highlights(c)
	return {
		["@punctuation.delimiter.rust"] = { fg = c.red },
		--[[ ["@type.rust"] = { fg = c.orange }, ]]
		["@function.macro.rust"] = { fg = c.purple },
		["@type.builtin.rust"] = { fg = c.blue2 },
		["@variable.builtin.rust"] = { fg = c.red },
		["@interface.defaultLibrary.rust"] = { fg = c.blue2 },
		["@typeAlias.library.rust"] = { fg = c.orange },
		["@interface.library.rust"] = { fg = c.orange },
	}
end

return M
