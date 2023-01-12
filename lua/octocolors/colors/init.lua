local util = require("octocolors.util")
local M = {}

local _loaded_style = ""

---@type OctoPalette
local _colors = {}

---@class OctoPalette
---@field ansi OctoAnsi
---@field scale OctoScale
---@field colors OctoColors

---@class OctoAnsi
---@field black string
---@field blackBright string
---@field white string
---@field whiteBright string
---@field gray string
---@field red string
---@field redBright string
---@field green string
---@field greenBright string
---@field yellow string
---@field yellowBright string
---@field blue string
---@field blueBright string
---@field magenta string
---@field magentaBright string
---@field cyan string
---@field cyanBright string

---@class OctoScale
---@field black string
---@field white string
---@field gray string[]
---@field blue string[]
---@field green string[]
---@field yellow string[]
---@field orange string[]
---@field red string[]
---@field purple string[]
---@field pink string[]
---@field coral string[]

---@return { scale: OctoScale, ansi: OctoAnsi, colors: OctoColors }|nil
function M.setup()
	local opts = require("octocolors.config").options

	local style = opts.theme == "auto" and vim.o.background or opts.theme
	if style == _loaded_style then return _colors end

	---@type boolean, OctoPalette
	local p_ok, palette = pcall(require, "octocolors.colors." .. style)
	if not p_ok then
		vim.notify("octocolors: invalid background option: " .. style, vim.log.levels.ERROR)
		return
	end
	_loaded_style = style

	local scale = palette.scale
	local bg = util.light_dark(scale.white, scale.gray[10])
	local overlay = util.light_dark(scale.white, scale.gray[9])

	---@class OctoColors
	palette.colors = {
		fg = util.light_dark(scale.gray[9], scale.gray[2]),
		bg = {
			default = bg,
			overlay = overlay,
			sidebar = util.light_dark(scale.gray[1], scale.black),
			statusline = util.light_dark(scale.white, scale.gray[9]),
		},
		border = util.light_dark(scale.gray[3], scale.gray[7]),
		blue = util.light_dark(scale.blue[6], scale.blue[4]),
		blue2 = util.light_dark(scale.blue[7], scale.blue[3]),
		blue3 = util.light_dark(scale.blue[9], scale.blue[2]),
		green = util.light_dark(scale.green[2], scale.green[6]),
		green2 = util.light_dark(scale.green[7], scale.green[3]),
		yellow = util.light_dark(scale.yellow[7], scale.yellow[4]),
		orange = util.light_dark(scale.orange[7], scale.orange[3]),
		purple = util.light_dark(scale.purple[6], scale.purple[3]),
		red = util.light_dark(scale.red[6], scale.red[4]),
		comment = util.light_dark(scale.gray[6], scale.gray[4]),
		whitespace = util.light_dark(scale.gray[2], scale.gray[6]),
		selection = util.light_dark(scale.blue[5], scale.blue[6]),
		match = util.light_dark(scale.yellow[5], scale.yellow[6]),
		match_highlight = util.alpha(scale.yellow[2], bg, 0.5),
		link = util.light_dark(scale.blue[9], scale.blue[2]),
		diagnostic = {
			error = {
				fg = util.light_dark(scale.red[6], scale.red[5]),
				bg = util.alpha(util.light_dark(scale.red[4], scale.red[5]), bg, 0.4),
			},
			warning = {
				fg = util.light_dark(scale.yellow[6], scale.yellow[4]),
				bg = util.alpha(util.light_dark(scale.yellow[4], scale.yellow[5]), bg, 0.4),
			},
			info = {
				fg = util.light_dark(scale.blue[6], scale.blue[4]),
				bg = util.alpha(util.light_dark(scale.blue[4], scale.blue[5]), bg, 0.4),
			},
			hint = {
				fg = util.light_dark(scale.gray[7], scale.gray[3]),
				bg = util.light_dark(scale.gray[1], scale.gray[8]),
			},
		},
		git = {
			add = {
				fg = util.light_dark(scale.green[6], scale.green[3]),
				bg = util.light_dark(scale.green[2], scale.green[6]),
			},
			change = {
				fg = util.light_dark(scale.yellow[6], scale.yellow[4]),
				bg = util.light_dark(
					util.alpha(scale.yellow[2], overlay, 0.3),
					util.alpha(scale.yellow[6], overlay, 0.2)
				),
			},
			delete = {
				fg = util.light_dark(scale.red[6], scale.red[5]),
				bg = util.light_dark(
					util.alpha(scale.red[2], overlay, 0.3),
					util.alpha(scale.red[6], overlay, 0.2)
				),
			},
		},
		rainbow = {
			util.light_dark(scale.blue[6], scale.blue[3]),
			util.light_dark(scale.green[6], scale.green[3]),
			util.light_dark(scale.yellow[6], scale.yellow[3]),
			util.light_dark(scale.red[6], scale.red[3]),
			util.light_dark(scale.pink[6], scale.pink[3]),
			util.light_dark(scale.purple[6], scale.purple[3]),
		},
		cmp = {
			blue = util.light_dark(scale.blue[9], scale.blue[3]),
			blue2 = util.light_dark(scale.blue[7], scale.blue[4]),
			orange = util.light_dark(scale.orange[7], scale.orange[4]),
			yellow = util.light_dark(scale.yellow[7], scale.yellow[4]),
			purple = util.light_dark(scale.purple[7], scale.purple[4]),
			green = util.light_dark(scale.green[7], scale.green[4]),
			red = util.light_dark(scale.red[7], scale.red[4]),
		},
	}
	_colors = palette
	return _colors
end

function M.get_colors() return _colors end

return M
