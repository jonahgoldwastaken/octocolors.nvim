local colors = require("octocolors.colors")
local util = require("octocolors.util")

local M = {}

-- @class Highlight
-- @field fg string|nil
-- @field bg string|nil
-- @field sp string|nil
-- @field style string|nil|Highlight

-- @alias Highlights table<string,Highlight>

-- @param scheme? "default"
function M.setup(scheme)
	-- @class Theme
	-- @field highlights Highlights
	local theme = {
		scheme = scheme or "default",
		colors = colors.setup(),
	}

	local c = theme.colors
	local scale = c.scale

	local light_dark = util.light_dark
	local alpha = util.alpha

	theme.highlights = {
		Comment = { fg = light_dark(scale.gray[6], scale.gray[4]) }, -- any comment
		ColorColumn = {}, -- used for the columns set with 'colorcolumn'
		Conceal = {}, -- placeholder characters substituted for concealed text (see 'conceallevel')
		Cursor = { fg = c.accent.fg }, -- character under the cursor
		lCursor = { link = "Cursor" }, -- the character under the cursor when |language-mapping| is used (see 'guicursor')
		CursorIM = { link = "Cursor" }, -- like Cursor, but used when in IME mode |CursorIM|
		CursorColumn = { link = "CursorLine" }, -- Screen-column at the cursor, when 'cursorcolumn' is set.
		CursorLine = { bg = light_dark(scale.blue[2], scale.gray[9]) }, -- Screen-line at the cursor, when 'cursorline' is set.  Low-priority if foreground (ctermfg OR guifg) is not set.
		Directory = { fg = c.accent.fg }, -- directory names (and other special names in listings)
		DiffAdd = {
			bg = light_dark(
				alpha(scale.green[2], c.canvas.default, 0.3),
				alpha(scale.green[6], c.canvas.default, 0.2)
			),
		}, -- diff mode: Added line |diff.txt|
		DiffChange = {
			bg = light_dark(
				alpha(scale.yellow[2], c.canvas.default, 0.3),
				alpha(scale.yellow[6], c.canvas.default, 0.2)
			),
		}, -- diff mode: Changed line |diff.txt|
		DiffDelete = {
			bg = light_dark(
				alpha(scale.red[2], c.canvas.default, 0.3),
				alpha(scale.red[6], c.canvas.default, 0.2)
			),
		}, -- diff mode: Deleted line |diff.txt|
		DiffText = { fg = light_dark(scale.gray[2], scale.gray[6]) }, -- diff mode: Changed text within a changed line |diff.txt|
		EndOfBuffer = { fg = light_dark(scale.gray[2], scale.gray[6]) }, -- filler lines (~) after the end of the buffer.  By default, this is highlighted like |hl-NonText|.
		-- TermCursor  = { }, -- cursor in a focused terminal
		-- TermCursorNC= { }, -- cursor in an unfocused terminal
		ErrorMsg = { fg = c.danger.fg }, -- error messages on the command line
		VertSplit = { bg = c.border.default }, -- the column separating vertically split windows
		WinSeparator = { bg = c.border.default }, -- the column separating vertically split windows
		Folded = {}, -- line used for closed folds
		FoldColumn = {}, -- 'foldcolumn'
		SignColumn = {}, -- column where |signs| are displayed
		SignColumnSB = {}, -- column where |signs| are displayed
		Substitute = { bg = c.attention.emphasis }, -- |:substitute| replacement text highlighting
		LineNr = { fg = scale.gray[5] }, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
		CursorLineNr = { fg = c.fg.default }, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
		MatchParen = { bg = alpha(scale.green[3], c.canvas.default, 0.25) }, -- The character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
		ModeMsg = { fg = c.fg.default }, -- 'showmode' message (e.g., "-- INSERT -- ")
		MsgArea = { fg = c.fg.default }, -- Area for messages and cmdline
		-- MsgSeparator= { }, -- Separator for scrolled messages, `msgsep` flag of 'display'
		MoreMsg = { fg = c.accent.fg }, -- |more-prompt|
		NonText = { fg = light_dark(scale.gray[3], scale.gray[5]) }, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
		Normal = { fg = c.fg.default, bg = c.canvas.default }, -- normal text
		NormalNC = { fg = c.fg.default, bg = c.canvas.default }, -- normal text in non-current windows
		NormalSB = { fg = c.fg.default, bg = c.canvas.default }, -- normal text in sidebar
		NormalFloat = { fg = c.fg.default, bg = c.canvas.default }, -- Normal text in floating windows.
		FloatBorder = { fg = c.border.default },
		Pmenu = { fg = c.fg.default, bg = c.canvas.overlay }, -- Popup menu: normal item.
		PmenuSel = { fg = c.fg.default, bg = c.neutral.muted }, -- Popup menu: selected item.
		PmenuSbar = { bg = c.canvas.overlay }, -- Popup menu: scrollbar.
		PmenuThumb = { bg = alpha(scale.gray[5], c.canvas.default, 0.2) }, -- Popup menu: Thumb of the scrollbar.
		Question = { fg = c.accent.fg }, -- |hit-enter| prompt and yes/no questions
		QuickFixLine = { bg = alpha(scale.blue[7], c.canvas.default, 0.4) }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
		Search = {
			fg = "NONE",
			bg = light_dark(
				alpha(scale.yellow[2], c.canvas.default, 0.3),
				alpha(scale.yellow[6], c.canvas.default, 0.2)
			),
		}, -- Last search pattern highlighting (see 'hlsearch').  Also used for similar items that need to stand out.
		IncSearch = { fg = "#000000", bg = c.severe.fg }, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
		SpecialKey = { fg = light_dark(scale.gray[2], scale.gray[6]) }, -- Unprintable characters: text displayed differently from what it really is.  But not 'listchars' whitespace. |hl-Whitespace|
		SpellBad = { sp = c.danger.fg, undercurl = true }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
		SpellCap = { sp = c.attention.fg, undercurl = true }, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
		SpellLocal = { sp = c.accent.fg, undercurl = true }, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
		SpellRare = { sp = c.fg.muted, undercurl = true }, -- Word that is recognized by the spellchecker as one that is hardly ever used.  |spell| Combined with the highlighting used otherwise.
		StatusLine = { fg = c.canvas.default, bg = c.accent.fg }, -- status line of current window
		StatusLineNC = { fg = c.canvas.subtle, bg = c.canvas.default }, -- status lines of not-current windows Note: if this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
		TabLine = { fg = c.fg.default, bg = c.canvas.default }, -- tab pages line, not active tab page label
		TabLineFill = { bg = c.canvas.inset }, -- tab pages line, where there are no labels
		TabLineSel = { link = "PmenuSel" }, -- tab pages line, active tab page label
		Title = { fg = light_dark(scale.orange[7], scale.orange[3]), bold = true }, -- titles for output from ":set all", ":autocmd" etc.
		Visual = { bg = scale.blue[9] }, -- Visual mode selection
		VisualNOS = { link = "Visual" }, -- Visual mode selection when vim is "Not Owning the Selection".
		WarningMsg = { fg = c.attention.fg }, -- warning messages
		Whitespace = { fg = light_dark(scale.gray[8], scale.gray[6]) }, -- "nbsp", "space", "tab" and "trail" in 'listchars'
		WildMenu = { bg = c.canvas.overlay }, -- current match in 'wildmenu' completion

		-- These groups are not listed as default vim groups,
		-- but they are defacto standard group names for syntax highlighting.
		-- commented out groups should chain up to their "preferred" group by
		-- default,
		-- Uncomment and edit if you want more specific syntax highlighting.

		Constant = { fg = light_dark(scale.blue[7], scale.blue[3]) }, -- (preferred) any constant
		String = { fg = light_dark(scale.blue[9], scale.blue[2]) }, --   a string constant: "this is a string"
		Character = { link = "String" }, --  a character constant: 'c', '\n'
		-- Number        = { }, --   a number constant: 234, 0xff
		-- Boolean       = { }, --  a boolean constant: TRUE, false
		-- Float         = { }, --    a floating point constant: 2.3e10

		Identifier = { fg = light_dark(scale.orange[7], scale.orange[3]) }, -- (preferred) any variable name
		["@variable"] = { fg = c.fg.default },
		["@field"] = { fg = c.fg.default },
		Function = { fg = light_dark(scale.purple[6], scale.purple[3]) }, -- function name (also: methods for classes)
		["@property"] = { fg = light_dark(scale.blue[9], scale.blue[2]) },
		["@constructor"] = { fg = light_dark(scale.orange[7], scale.orange[3]) },

		Statement = { fg = light_dark(scale.red[6], scale.red[4]) }, -- (preferred) any statement
		-- Conditional   = { }, --  if, then, else, endif, switch, etc.
		-- Repeat        = { }, --   for, do, while, etc.
		-- Label         = { }, --    case, default, etc.
		Operator = { link = "Statement" }, -- "sizeof", "+", "*", etc.
		Keyword = { link = "Statement" }, --  any other keyword
		-- Exception     = { }, --  try, catch, throw

		PreProc = { fg = light_dark(scale.red[6], scale.red[4]) }, -- (preferred) generic Preprocessor
		-- Include       = { }, --  preprocessor #include
		-- Define        = { }, --   preprocessor #define
		-- Macro         = { }, --    same as Define
		-- PreCondit     = { }, --  preprocessor #if, #else, #endif, etc.

		Type = { fg = light_dark(scale.red[6], scale.red[4]) }, -- (preferred) int, long, char, etc.
		-- StorageClass  = { }, -- static, register, volatile, etc.
		-- Structure     = { }, --  struct, union, enum, etc.
		-- Typedef       = { }, --  A typedef

		Special = { fg = light_dark(scale.blue[9], scale.blue[2]) }, -- (preferred) any special symbol
		-- SpecialChar   = { }, --  special character in a constant
		Tag = { fg = light_dark(scale.green[7], scale.green[2]) }, --    you can use CTRL-] on this
		["@tag.attribute"] = { fg = light_dark(scale.blue[7], scale.blue[3]) },
		["@tag.delimiter"] = { fg = c.fg.default },
		["@tag.punctuation"] = { fg = c.fg.default },
		["@punctuation.bracket"] = { fg = c.fg.default },
		-- Delimiter     = { }, --  character that needs attention
		-- SpecialComment= { }, -- special things inside a comment
		-- Debug         = { }, --    debugging statements

		-- Custom syntax highlighting
		-- Typescript React
		--[[ ["@punctuation.delimiter.ts"] = { fg = light_dark(scale.red[6], scale.red[4]) }, ]]
		["@punctuation.delimiter.tsx"] = { fg = light_dark(scale.red[6], scale.red[4]) },
		--[[ ["@type.ts"] = { fg = light_dark(scale.orange[7], scale.orange[3]) }, ]]
		["@type.tsx"] = { fg = light_dark(scale.orange[7], scale.orange[3]) },
		--[[ ["@variable.ts"] = { fg = c.fg.default }, ]]
		["@variable.tsx"] = { fg = light_dark(scale.blue[7], scale.blue[3]) },
		["@property.tsx"] = { fg = light_dark(scale.blue[7], scale.blue[3]) },

		-- TOML
		["@property.toml"] = { fg = c.fg.default },
		["@operator.toml"] = { fg = c.fg.default },
		["@type.toml"] = { fg = light_dark(scale.purple[6], scale.purple[3]) },

		-- Lua
		--[[ ["@function.lua"] = { fg = light_dark(scale.red[6], scale.red[4]) }, ]]
		["@function.call.lua"] = { fg = light_dark(scale.blue[5], scale.blue[3]) },
		["@definition.function.lua"] = { fg = light_dark(scale.purple[6], scale.purple[3]) },

		Underlined = { underline = true }, -- (preferred) text that stands out, HTML links
		Bold = { bold = true },
		Italic = { italic = true },

		-- ("Ignore", below, may be invisible...)
		-- Ignore = { }, -- (preferred) left blank, hidden  |hl-Ignore|

		Error = { fg = c.danger.fg }, -- (preferred) any erroneous construct
		Todo = { fg = c.canvas.default, bg = c.attention.fg }, -- (preferred) anything that needs extra attention; mostly the keywords TODO FIXME and XXX

		qfLineNr = { fg = light_dark(scale.red[6], scale.red[4]) },
		qfFileName = { fg = c.accent.fg },

		mkdCodeDelimiter = { fg = c.fg.default },
		mkdCodeStart = { fg = light_dark(scale.orange[7], scale.orange[3]), bold = true },
		mkdCodeEnd = { fg = light_dark(scale.orange[7], scale.orange[3]), bold = true },

		markdownHeadingDelimiter = { fg = light_dark(scale.orange[7], scale.orange[3]), bold = true },
		markdownTSTextReference = { link = "Title" },
		markdownH1 = { fg = light_dark(scale.orange[7], scale.orange[3]), bold = true },
		markdownH2 = { fg = light_dark(scale.orange[7], scale.orange[3]), bold = true },
		markdownH3 = { fg = light_dark(scale.orange[7], scale.orange[3]), bold = true },
		markdownLinkText = { fg = c.fg.default, underline = true },
		markdownUrl = { fg = c.fg.default, underline = true },

		debugPC = { bg = c.canvas.inset }, -- used for highlighting the current line in terminal-debug
		debugBreakpoint = {
			fg = c.attention.fg,
			bg = light_dark(
				alpha(scale.yellow[3], c.canvas.default, 0.3),
				alpha(scale.yellow[7], c.canvas.default, 0.4)
			),
		}, -- used for breakpoint colors in terminal-debug

		-- These groups are for the native LSP client. Some other LSP clients may
		-- use these groups, or use their own. Consult your LSP client's
		-- documentation.
		LspReferenceText = { fg = light_dark(scale.green[1], scale.green[10]) }, -- used for highlighting "text" references
		LspReferenceRead = { link = "LspReferenceText" }, -- used for highlighting "read" references
		LspReferenceWrite = { link = "LspReferenceText" }, -- used for highlighting "write" references

		DiagnosticError = { fg = c.danger.fg }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default
		DiagnosticWarn = { fg = c.attention.fg }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default
		DiagnosticInfo = { fg = c.accent.fg }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default
		DiagnosticHint = { fg = c.fg.muted }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default

		DiagnosticVirtualTextError = { fg = c.danger.fg, bg = c.danger.muted }, -- Used for "Error" diagnostic virtual text
		DiagnosticVirtualTextWarn = { fg = c.attention.fg, bg = c.attention.muted }, -- Used for "Warning" diagnostic virtual text
		DiagnosticVirtualTextInfo = { fg = c.accent.fg, bg = c.accent.muted }, -- Used for "Information" diagnostic virtual text
		DiagnosticVirtualTextHint = { fg = c.fg.muted, bg = c.canvas.subtle }, -- Used for "Hint" diagnostic virtual text

		DiagnosticUnderlineError = { undercurl = true, sp = c.danger.fg }, -- Used to underline "Error" diagnostics
		DiagnosticUnderlineWarn = { undercurl = true, sp = c.attention.fg }, -- Used to underline "Warning" diagnostics
		DiagnosticUnderlineInfo = { undercurl = true, sp = c.accent.fg }, -- Used to underline "Information" diagnostics
		DiagnosticUnderlineHint = { undercurl = true, sp = c.fg.muted }, -- Used to underline "Hint" diagnostics

		LspCodeLens = { link = "Comment" },

		-- ts-rainbow
		rainbowcol1 = { fg = light_dark(scale.blue[6], scale.blue[3]) },
		rainbowcol2 = { fg = light_dark(scale.green[6], scale.green[3]) },
		rainbowcol3 = { fg = light_dark(scale.yellow[6], scale.yellow[3]) },
		rainbowcol4 = { fg = light_dark(scale.red[6], scale.red[3]) },
		rainbowcol5 = { fg = light_dark(scale.pink[6], scale.pink[3]) },
		rainbowcol6 = { fg = light_dark(scale.purple[6], scale.purple[3]) },

		-- NvimTree
		NvimTreeNormal = { fg = c.fg.default, bg = c.canvas.inset },
		NvimTreeEndOfBuffer = { fg = c.canvas.inset },
		NvimTreeRootFolder = { fg = c.fg.default, bold = true },
		NvimTreeGitDirty = { fg = c.attention.fg },
		NvimTreeGitNew = { fg = c.success.fg },
		NvimTreeGitRenamed = { fg = c.attention.fg },
		NvimTreeGitDeleted = { fg = c.danger.fg },
		NvimTreeGitIgnored = { fg = c.fg.default },
		NvimTreeSpecialFile = { fg = scale.yellow[4], underline = true },
		NvimTreeIndentMarker = { fg = c.fg.default },
		NvimTreeImageFile = { fg = scale.yellow[3] },
		NvimTreeFileIcon = { fg = c.fg.default },
		NvimTreeFolderIcon = { fg = c.fg.default },
		NvimTreeSymlink = { fg = scale.purple[4] },
		NvimTreeFolderName = { fg = c.fg.default },
		NvimTreeOpenedFolderName = { fg = c.fg.default, bold = true },
		NvimTreeOpenedFile = { fg = scale.blue[3] },

		-- GitGutter
		GitGutterAdd = { fg = c.success.fg },
		GitGutterChange = { fg = c.attention.fg },
		GitGutterDelete = { fg = c.danger.fg },

		-- GitSigns
		GitSignsAdd = { fg = c.success.fg },
		GitSignsChange = { fg = c.attention.fg },
		GitSignsDelete = { fg = c.danger.fg },

		-- Telescope
		TelescopeBorder = { fg = c.border.default, bg = c.canvas.overlay },
		TelescopeNormal = { fg = c.fg.default, bg = c.canvas.overlay },
	}

	return theme
end

return M
