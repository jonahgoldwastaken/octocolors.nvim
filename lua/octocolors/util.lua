local M = {}

--- @return string "light" or "dark"
function M.mode()
	local background = require("octocolors.config").options.background
	if background == "auto" then
		return vim.o.background
	else
		return background
	end
end

function M.light_dark(light, dark) return M.mode() == "light" and light or dark end

--- @param color string Hex color value
--- @param bg string Neovim bg
--- @param alpha number 0-1
function M.alpha(color, bg, alpha)
	local c = M.hex_to_rgb(color)
	local b = M.hex_to_rgb(bg)

	local blend_channel = function(i)
		local ret = (alpha * c[i] + ((1 - alpha) * b[i]))
		return math.floor(math.min(math.max(0, ret), 255) + 0.5)
	end

	return string.format("#%02x%02x%02x", blend_channel(1), blend_channel(2), blend_channel(3))
end

--- @param color string Hex color value
--- @return table<number, number>
function M.hex_to_rgb(color)
	local hex = "[abcdef0-9][abcdef0-9]"
	local pat = string.format("^#(%s)(%s)(%s)$", hex, hex, hex)
	color = string.lower(color)

	assert(string.find(color, pat) ~= nil, "Invalid hex color: " .. tostring(color))

	local r, g, b = string.match(color, pat)

	return { tonumber(r, 16), tonumber(g, 16), tonumber(b, 16) }
end

function M.syntax(syntax)
	for group, colors in pairs(syntax) do
		if colors.style then
			if type(colors.style) == "table" then
				colors = vim.tbl_extend("force", colors, colors.style)
			end
			colors.style = nil
		end
		vim.api.nvim_set_hl(0, group, colors)
	end
end

function M.load(theme)
	if vim.g.colors_name then vim.cmd("hi clear") end

	vim.o.termguicolors = true
	vim.g.colors_name = "octocolors"

	M.syntax(theme.highlights)

	local filetypes = require("octocolors.languages").get_custom_languages()

	if not theme.config.lazy_load_syntax then
		for _, filetype in ipairs(filetypes) do
			M.load_highlights(require("octocolors.languages." .. filetype))
		end
	end

	M.autocmds(theme.config, filetypes)
end

function M.on_color_scheme()
	if vim.g.colors_name ~= "octocolors" then
		vim.cmd([[autocmd! OctoColors]])
		vim.cmd([[augroup! OctoColors]])
	end
end

function M.on_background_change() M.load(require("octocolors.theme").setup()) end

---@param lang octocolors.language
function M.load_highlights(lang)
	local c = require("octocolors.colors").get_colors()
	if c == nil then return end
	local highlights = lang.highlights(c.colors)

	M.syntax(highlights)
end

function M.on_file_type()
	local lang = require("octocolors.languages").load_language(vim.bo.filetype)
	if lang == nil then return end
	M.load_highlights(lang)
end

--- @param config octocolors.config
function M.autocmds(config, filetypes)
	vim.cmd([[augroup OctoColors]])
	vim.cmd([[  autocmd!]])
	vim.cmd([[  autocmd ColorScheme * lua require 'octocolors.util'.on_color_scheme()]])
	if config.lazy_load_syntax then
		vim.cmd(
			[[  autocmd FileType ]]
				.. table.concat(filetypes, ",")
				.. [[ ++once lua require 'octocolors.util'.on_file_type()]]
		)
	end
	if config.background == "auto" then
		vim.cmd([[  autocmd OptionSet background lua require 'octocolors.util'.on_background_change()]])
	end

	vim.cmd(
		[[  autocmd FileType ]]
			.. table.concat(config.sidebars, ",")
			.. [[ setlocal winhighlight=Normal:NormalSB,SignColumn:SignColumnSB]]
	)

	if vim.tbl_contains(config.sidebars, "terminal") then
		vim.cmd([[  autocmd TermOpen * setlocal winhighlight=Normal:NormalSB,SignColumn:SignColumnSB]])
	end
	vim.cmd([[augroup end]])
end

return M
