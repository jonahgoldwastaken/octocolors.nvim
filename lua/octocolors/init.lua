local util = require("octocolors.util")
local theme = require("octocolors.theme")

local M = {}

function M.load() util.load(theme.setup()) end

return M
