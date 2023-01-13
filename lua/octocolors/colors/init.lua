local util = require("octocolors.util")
local M = {}

local _loaded_style = ""

---@type table<string, octocolors.palette>
local _colors = {}

---@class octocolors.palette
---@field ansi octocolors.ansi
---@field scale octocolors.scale
---@field colors octocolors.colors

---@class octocolors.ansi
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

---@class octocolors.scale
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

---@return { scale: octocolors.scale, ansi: octocolors.ansi, colors: octocolors.colors }|nil
function M.setup()
	local opts = require("octocolors.config").options

	local background = opts.background == "auto" and vim.o.background or opts.background
	local style = opts.theme
	local req_str = background .. "." .. style
	if req_str == "light.dimmed" then req_str = "light.init" end
	req_str = req_str:gsub("default", "init")

	if _colors[req_str] then return _colors[req_str] end

	---@type boolean, octocolors.scale
	local p_ok, scale = pcall(require, "octocolors.colors." .. req_str)
	if not p_ok then
		vim.notify("octocolors: invalid background option: " .. req_str, vim.log.levels.ERROR)
		return
	end

	_loaded_style = req_str

	---@type octocolors.palette
	local palette = { scale = scale }
	local fg = util.light_dark(scale.gray[9], scale.gray[2])
	local bg = util.light_dark(scale.white, scale.gray[10])
	local overlay = util.light_dark(scale.white, scale.gray[9])

	---@class octocolors.colors
	palette.colors = {
		-- UI
		fg = fg,
		bg = {
			default = bg,
			overlay = overlay,
			sidebar = util.light_dark(util.high_contrast(scale.gray[1], scale.white), scale.black),
			statusline = util.light_dark(util.high_contrast(scale.gray[1], scale.gray[2]), scale.gray[9]),
		},
		border = util.light_dark(
			util.high_contrast(scale.gray[3], scale.gray[9]),
			util.high_contrast(scale.gray[7], scale.gray[6])
		),

		-- Colors
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
		visual = {
			fg = util.high_contrast("NONE", util.light_dark(scale.white, scale.gray[10])),
			bg = util.high_contrast(
				util.light_dark(scale.blue[6], scale.blue[4]),
				util.light_dark(scale.gray[10], scale.gray[1])
			),
		},
		selection = {
			match = util.light_dark(scale.blue[6], scale.blue[4]),
			bg = util.light_dark(util.alpha(scale.gray[4], bg, 0.2), util.alpha(scale.gray[5], bg, 0.4)),
		},

		match = util.light_dark(scale.yellow[5], scale.yellow[6]),
		match_highlight = util.alpha(scale.yellow[2], bg, 0.5),
		link = util.light_dark(scale.blue[9], scale.blue[2]),

		-- Diagnostics
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

		-- Git
		git = {
			add = {
				fg = util.light_dark(scale.green[6], scale.green[3]),
				bg = util.light_dark(scale.green[2], scale.green[6]),
				gutter = util.light_dark(
					util.hc_alpha(scale.green[4], overlay, 0.4),
					util.hc_alpha(scale.green[5], overlay, 0.4)
				),
				line = util.light_dark("#e6ffec", util.alpha(scale.green[5], bg, 0.4)),
			},
			change = {
				fg = util.light_dark(scale.yellow[6], scale.yellow[4]),
				bg = util.light_dark(
					util.alpha(scale.yellow[2], overlay, 0.3),
					util.alpha(scale.yellow[6], overlay, 0.2)
				),
				gutter = util.light_dark(
					util.hc_alpha(scale.yellow[6], overlay, 0.4, scale.yellow[4]),
					util.hc_alpha(scale.yellow[5], overlay, 0.4)
				),
				line = util.light_dark(
					util.alpha(scale.yellow[1], bg, 0.6),
					util.alpha(scale.yellow[5], bg, 0.4)
				),
			},
			delete = {
				fg = util.light_dark(scale.red[6], scale.red[5]),
				bg = util.light_dark(
					util.alpha(scale.red[2], overlay, 0.3),
					util.alpha(scale.red[6], overlay, 0.2)
				),
				gutter = util.light_dark(
					util.hc_alpha(scale.red[4], overlay, 0.4),
					util.hc_alpha(scale.red[5], overlay, 0.4)
				),
				line = util.light_dark(scale.red[1], util.alpha(scale.red[5], bg, 0.4)),
			},
		},

		-- Bracket pair rainbow
		rainbow = {
			util.light_dark(scale.blue[6], scale.blue[3]),
			util.light_dark(scale.green[6], scale.green[3]),
			util.light_dark(scale.yellow[6], scale.yellow[3]),
			util.light_dark(scale.red[6], scale.red[3]),
			util.light_dark(scale.pink[6], scale.pink[3]),
			util.light_dark(scale.purple[6], scale.purple[3]),
		},

		-- Completion
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

	palette.ansi = {
		black = util.light_dark(scale.gray[10], scale.gray[6]),
		blackBright = util.light_dark(scale.gray[7], scale.gray[5]),
		white = util.light_dark(scale.gray[6], scale.gray[3]),
		whitebright = util.light_dark(scale.gray[5], scale.white),
		gray = util.light_dark(scale.gray[6], scale.gray[5]),
		red = util.light_dark(scale.red[6], scale.red[4]),
		redbright = util.light_dark(scale.red[7], scale.red[3]),
		green = util.light_dark(scale.green[7], scale.green[4]),
		greenBright = util.light_dark(scale.green[6], scale.green[3]),
		yellow = util.light_dark(scale.yellow[8], scale.yellow[4]),
		yellowBright = util.light_dark(scale.yellow[7], scale.yellow[3]),
		blue = util.light_dark(scale.blue[6], scale.blue[4]),
		blueBright = util.light_dark(scale.blue[5], scale.blue[3]),
		magenta = util.light_dark(scale.purple[6], scale.purple[4]),
		magentaBright = util.light_dark(scale.purple[5], scale.purple[3]),
		cyan = util.light_dark("#1b7c83", "#39c5cf"),
		cyanBright = util.light_dark("#3192aa", "#56d4dd"),
	}

	_colors[req_str] = palette
	return _colors[req_str]
end

function M.get_colors() return _colors[_loaded_style] end

return M
