local M = {}

--- @return string "light" or "dark"
function M.mode() return vim.o.background == "light" and "light" or "dark" end

--- @param color string Hex color value
--- @parm bg string Neovim bg
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

--- @param color string RGB color value
function M.rgb_to_hex(color)
	local rgb = "[0-9][0-9]?[0-9]?"
	local pat = string.format("^rgb%%((%s),(%s),(%s)%%)$", rgb, rgb, rgb)
	assert(string.find(color, pat) ~= nil, "Invalid rgb color: " .. tostring(color))

	local r, g, b = string.match(color, pat)

	return string.format("#%02x%02x%02x", r, g, b)
end

--- @param color string RGB color value
function M.rgba_to_hex(color, bg)
	local rgb = "[0-9][0-9]?[0-9]?"
	local alpha = "[0-1]%.?[0-9]*"
	local pat = string.format("^rgba%%((%s),(%s),(%s),(%s)%%)$", rgb, rgb, rgb, alpha)
	assert(string.find(color, pat) ~= nil, "Invalid rgba color: " .. tostring(color))

	local r, g, b, a = string.match(color, pat)

	return M.alpha(string.format("#%02x%02x%02x", r, g, b), bg, a)
end

--- @param table table
function M.color_to_hex(table, bg)
	bg = bg or ""
	if bg == "" then
		for k, _ in pairs(table) do
			if k == "canvas" then
				for k2, v in pairs(table[k]) do
					if k2 == "default" then bg = v end
				end
			end
		end
	end
	if type(table) == "table" then
		for key, value in pairs(table) do
			if type(value) == "table" then
				table[key] = M.color_to_hex(table[key], bg)
			else
				if string.find(value, "^rgba") then
					table[key] = M.rgba_to_hex(table[key], bg)
				elseif string.find(value, "^rgb") then
					table[key] = M.rgb_to_hex(table[key])
				end
			end
		end
	end
	return table
end

function M.syntax(syntax)
	for group, colors in pairs(syntax) do
		vim.api.nvim_set_hl(0, group, colors)
	end
end

function M.load(theme)
	if vim.g.colors_name then vim.cmd("hi clear") end

	vim.o.termguicolors = true
	vim.g.colors_name = "octocolors"

	M.syntax(theme.highlights)
end

return M
