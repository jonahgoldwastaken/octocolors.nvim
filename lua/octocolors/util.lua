local M = {}

--- @return string "light" or "dark"
function M.mode() return vim.o.background == "light" and "light" or "dark" end

--- @param color string Hex color value
--- @param alpha number 0-1
function M.alpha(color, alpha) return color .. string.format("%02x", math.floor(alpha * 255)) end

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
	local pat = string.format("^rgb%((%s),(%s),(%s)%)$", rgb, rgb, rgb)

	assert(string.find(color, pat) ~= nil, "Invalid rgb color: " .. tostring(color))

	local r, g, b = string.match(color, pat)

	return string.format("#%02x%02x%02x", r, g, b)
end

--- @param color string RGB color value
function M.rgba_to_hex(color)
	local rgb = "[0-9][0-9]?[0-9]?"
	local alpha = "[0-1]%.?[0-9]*"
	local pat = string.format("^rgba%((%s),(%s),(%s),(%s)%)$", rgb, rgb, rgb, alpha)

	assert(string.find(color, pat) ~= nil, "Invalid rgba color: " .. tostring(color))

	local r, g, b, a = string.match(color, pat)

	return string.format("#%02x%02x%02x%02x", r, g, b, math.floor(a * 255))
end

--- @param table table
function M.color_to_hex(table)
	if type(table) == "table" then
		for key, value in pairs(table) do
			if type(value) == "table" then
				table[key] = M.color_to_hex(value)
			else
				if string.find(value, "rgba") then
					table[key] = M.rgba_to_hex(value)
				elseif string.find(value, "rgb") then
					table[key] = M.rgb_to_hex(value)
				end
			end
		end
	end
	return table
end

return M
