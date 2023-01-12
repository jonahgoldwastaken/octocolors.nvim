local M = {}

---@type table<string, boolean>
local _loaded_languages = {}

---@param lang string
---@return octocolors.language|nil
function M.load_language(lang)
	if lang == "" then return end
	if _loaded_languages[lang] then return end

	local has_custom_highlights, language = pcall(require, "octocolors.languages." .. lang)
	_loaded_languages[lang] = true
	if not has_custom_highlights then return end

	return language
end

function M.get_custom_languages()
	local dir = debug.getinfo(1, "S").source
	if dir:match("^@") then dir = dir:sub(2) end
	dir = vim.fs.dirname(dir)
	local files = vim.fn.glob(dir .. "/*.lua", false, true)
	local langs = {}
	for _, file in ipairs(files) do
		if not file:match("init.lua") then
			table.insert(langs, vim.fs.basename(file:gsub(".lua$", "")))
		end
	end
	return langs
end

return M
