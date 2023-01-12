local config = require("octocolors.config")
local util = require("octocolors.util")
local theme = require("octocolors.theme")

local M = {}

--- @param opts octocolors.config|nil
function M.load(opts)
	opts = opts or {}
	config.extend(opts)
	util.load(theme.setup())
end

M.setup = config.setup

return M
