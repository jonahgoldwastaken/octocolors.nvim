local colors = require("octocolors.colors").setup()
local util = require("octocolors.util")

local bg = util.light_dark(colors.scale.white, colors.scale.gray[9])
local fg = util.light_dark(colors.scale.gray[9], colors.scale.gray[2])

local octocolors = {}

local function create_group(scale)
	local group = {
		a = { bg = util.light_dark(scale[6], scale[4]), fg = bg, gui = "bold" },
		b = { bg = util.light_dark(scale[7], scale[8]), fg = scale[1] },
		c = { bg = bg, fg = fg },
	}
	return group
end

local inactive_hi = {
	bg = util.light_dark(colors.scale.gray[1], colors.scale.gray[10]),
	fg = util.alpha(fg, bg, 0.3),
}

octocolors.normal = create_group(colors.scale.blue)
octocolors.insert = create_group(colors.scale.green)
octocolors.command = create_group(colors.scale.purple)
octocolors.visual = create_group(colors.scale.yellow)
octocolors.replace = create_group(colors.scale.red)
octocolors.terminal = create_group(colors.scale.orange)
octocolors.inactive = { a = inactive_hi, b = inactive_hi, c = inactive_hi }

vim.cmd("hi! link StatusLine Normal")

return octocolors
