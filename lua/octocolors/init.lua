local config = require("octocolors.config")
local util = require("octocolors.util")
local theme = require("octocolors.theme")

local M = {}

--- @param opts Config|nil
function M.load(opts)
	if opts then config.extend(opts) end
	util.load(theme.setup())
end

M.setup = config.setup

return M
