local colors = require("octocolors.colors").setup()
local util = require("octocolors.util")

local bg1 = colors.canvas.default
local bg2 = colors.canvas.inset
local fg = colors.fg.default

local octocolors = {}

local function create_group(scale)
	local group = {
		a = { bg = util.light_dark(scale[6], scale[4]), fg = bg1, gui = "bold" },
		b = { bg = util.light_dark(scale[7], scale[8]), fg = scale[1] },
		c = { bg = colors.canvas.overlay, fg = fg },
	}
	return group
end

local inactive_hi = { bg = bg2, fg = util.alpha(fg, bg2, 0.3) }

octocolors.normal = create_group(colors.scale.blue)
octocolors.insert = create_group(colors.scale.green)
octocolors.command = create_group(colors.scale.purple)
octocolors.visual = create_group(colors.scale.yellow)
octocolors.replace = create_group(colors.scale.red)
octocolors.terminal = create_group(colors.scale.orange)
octocolors.inactive = { a = inactive_hi, b = inactive_hi, c = inactive_hi }

vim.cmd("hi! link StatusLine Normal")

return octocolors
