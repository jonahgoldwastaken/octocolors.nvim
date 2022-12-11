local colors = require("octocolors.colors")
local util = require("octocolors.util")

local M = {}

--- @class Highlight
--- @field fg string|nil
--- @field bg string|nil
--- @field sp string|nil
--- @field bold boolean|nil
--- @field underline boolean|nil
--- @field italic boolean|nil
--- @field undercurl boolean|nil
--- @field link string|nil

--- @alias Highlights table<string,Highlight>

--- @param scheme "default"|nil
--- @return Theme
function M.setup(scheme)
	scheme = scheme or "default"
	local config = require("octocolors.config")
	local options = config.options
	--- @class Theme
	--- @field highlights Highlights
	local theme = {
		scheme = scheme,
		colors = colors.setup(),
		config = options,
	}

	local c = theme.colors
	if c == nil then
		vim.notify(
			"octocolors: invalid background option: " .. options.background,
			vim.log.levels.ERROR
		)
		return {}
	end
	local scale = c.scale

	local light_dark = util.light_dark
	local alpha = util.alpha

	theme.highlights = {
		Comment = { fg = light_dark(scale.gray[6], scale.gray[4]), style = options.styles.comments }, -- any comment
		ColorColumn = {}, -- used for the columns set with 'colorcolumn'
		Conceal = {}, -- placeholder characters substituted for concealed text (see 'conceallevel')
		Cursor = { fg = light_dark(scale.blue[6], scale.blue[4]) }, -- character under the cursor
		lCursor = { link = "Cursor" }, -- the character under the cursor when |language-mapping| is used (see 'guicursor')
		CursorIM = { link = "Cursor" }, -- like Cursor, but used when in IME mode |CursorIM|
		CursorColumn = { link = "CursorLine" }, -- Screen-column at the cursor, when 'cursorcolumn' is set.
		CursorLine = { bg = light_dark(scale.blue[2], scale.gray[9]) }, -- Screen-line at the cursor, when 'cursorline' is set.  Low-priority if foreground (ctermfg OR guifg) is not set.
		Directory = { fg = light_dark(scale.blue[6], scale.blue[4]) }, -- directory names (and other special names in listings)
		DiffAdd = {
			bg = light_dark(scale.green[2], scale.green[6]),
		}, -- diff mode: Added line |diff.txt|
		DiffChange = {
			bg = light_dark(
				alpha(scale.yellow[2], light_dark(scale.white, scale.gray[9]), 0.3),
				alpha(scale.yellow[6], light_dark(scale.white, scale.gray[9]), 0.2)
			),
		}, -- diff mode: Changed line |diff.txt|
		DiffDelete = {
			bg = light_dark(
				alpha(scale.red[2], light_dark(scale.white, scale.gray[9]), 0.3),
				alpha(scale.red[6], light_dark(scale.white, scale.gray[9]), 0.2)
			),
		}, -- diff mode: Deleted line |diff.txt|
		DiffText = { fg = light_dark(scale.gray[2], scale.gray[6]) }, -- diff mode: Changed text within a changed line |diff.txt|
		EndOfBuffer = { fg = light_dark(scale.gray[2], scale.gray[6]) }, -- filler lines (~) after the end of the buffer.  By default, this is highlighted like |hl-NonText|.
		-- TermCursor  = { }, -- cursor in a focused terminal
		-- TermCursorNC= { }, -- cursor in an unfocused terminal
		ErrorMsg = { fg = light_dark(scale.red[6], scale.red[5]) }, -- error messages on the command line
		VertSplit = { fg = light_dark(scale.gray[3], scale.gray[7]), bg = "NONE" }, -- the column separating vertically split windows
		WinSeparator = { fg = light_dark(scale.gray[3], scale.gray[7]), bg = "NONE" }, -- the column separating vertically split windows
		Folded = {}, -- line used for closed folds
		FoldColumn = {}, -- 'foldcolumn'
		SignColumn = {
			fg = light_dark(scale.gray[1], scale.gray[10]),
			bg = light_dark(scale.white, scale.gray[9]),
		}, -- column where |signs| are displayed
		SignColumnSB = {
			fg = light_dark(scale.gray[1], scale.gray[8]),
			bg = light_dark(scale.white, scale.gray[10]),
		}, -- column where |signs| are displayed
		Substitute = { bg = light_dark(scale.yellow[5], scale.yellow[6]) }, -- |:substitute| replacement text highlighting
		LineNr = { fg = scale.gray[5] }, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
		CursorLineNr = { fg = light_dark(scale.gray[9], scale.gray[2]) }, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
		MatchParen = { bg = alpha(scale.green[3], light_dark(scale.white, scale.gray[10]), 0.25) }, -- The character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
		ModeMsg = { fg = light_dark(scale.gray[9], scale.gray[2]) }, -- 'showmode' message (e.g., "-- INSERT -- ")
		MsgArea = { fg = light_dark(scale.gray[9], scale.gray[2]) }, -- Area for messages and cmdline
		-- MsgSeparator= { }, -- Separator for scrolled messages, `msgsep` flag of 'display'
		MoreMsg = { fg = light_dark(scale.blue[6], scale.blue[4]) }, -- |more-prompt|
		NonText = { fg = light_dark(scale.gray[3], scale.gray[5]) }, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
		Normal = {
			fg = light_dark(scale.gray[9], scale.gray[2]),
			bg = light_dark(scale.white, scale.gray[10]),
		}, -- normal text
		NormalNC = {
			fg = light_dark(scale.gray[9], scale.gray[2]),
			bg = light_dark(scale.white, scale.gray[10]),
		}, -- normal text in non-current windows
		NormalSB = {
			fg = light_dark(scale.gray[9], scale.gray[2]),
			bg = light_dark(scale.white, scale.gray[10]),
		}, -- normal text in sidebar
		NormalFloat = {
			fg = light_dark(scale.gray[9], scale.gray[2]),
			bg = light_dark(scale.white, scale.gray[10]),
		}, -- Normal text in floating windows.
		FloatBorder = { fg = light_dark(scale.gray[3], scale.gray[7]) },
		Pmenu = {
			fg = light_dark(scale.gray[9], scale.gray[2]),
			bg = light_dark(scale.white, scale.gray[9]),
		}, -- Popup menu: normal item.
		PmenuSel = {
			fg = light_dark(scale.gray[9], scale.gray[2]),
			bg = alpha(
				light_dark(scale.gray[4], scale.gray[5]),
				light_dark(scale.white, scale.gray[10]),
				0.4
			),
		}, -- Popup menu: selected item.
		PmenuSbar = { bg = light_dark(scale.white, scale.gray[9]) }, -- Popup menu: scrollbar.
		PmenuThumb = { bg = alpha(scale.gray[5], light_dark(scale.white, scale.gray[9]), 0.2) }, -- Popup menu: Thumb of the scrollbar.
		Question = { fg = light_dark(scale.blue[6], scale.blue[4]) }, -- |hit-enter| prompt and yes/no questions
		QuickFixLine = { bg = alpha(scale.blue[7], light_dark(scale.white, scale.gray[9]), 0.4) }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
		Search = {
			fg = "NONE",
			bg = light_dark(
				alpha(scale.yellow[2], light_dark(scale.white, scale.gray[10]), 0.3),
				alpha(scale.yellow[6], light_dark(scale.white, scale.gray[10]), 0.2)
			),
		}, -- Last search pattern highlighting (see 'hlsearch').  Also used for similar items that need to stand out.
		IncSearch = { fg = "#000000", bg = light_dark(scale.orange[6], scale.orange[5]) }, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
		SpecialKey = { fg = light_dark(scale.gray[2], scale.gray[6]) }, -- Unprintable characters: text displayed differently from what it really is.  But not 'listchars' whitespace. |hl-Whitespace|
		SpellBad = { sp = light_dark(scale.red[6], scale.red[5]), undercurl = true }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
		SpellCap = { sp = light_dark(scale.yellow[6], scale.yellow[4]), undercurl = true }, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
		SpellLocal = { sp = light_dark(scale.blue[6], scale.blue[4]), undercurl = true }, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
		SpellRare = { sp = light_dark(scale.gray[7], scale.gray[3]), undercurl = true }, -- Word that is recognized by the spellchecker as one that is hardly ever used.  |spell| Combined with the highlighting used otherwise.
		StatusLine = {
			fg = light_dark(scale.white, scale.gray[10]),
			bg = light_dark(scale.blue[6], scale.blue[4]),
		}, -- status line of current window
		StatusLineNC = {
			fg = light_dark(scale.gray[1], scale.gray[8]),
			bg = light_dark(scale.white, scale.gray[10]),
		}, -- status lines of not-current windows Note: if this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
		TabLine = {
			fg = light_dark(scale.gray[9], scale.gray[2]),
			bg = light_dark(scale.white, scale.gray[10]),
		}, -- tab pages line, not active tab page label
		TabLineFill = { bg = light_dark(scale.gray[1], scale.black) }, -- tab pages line, where there are no labels
		TabLineSel = { link = "PmenuSel" }, -- tab pages line, active tab page label
		Title = { fg = light_dark(scale.orange[7], scale.orange[3]), bold = true }, -- titles for output from ":set all", ":autocmd" etc.
		Visual = { bg = light_dark(scale.blue[2], scale.blue[9]) }, -- Visual mode selection
		VisualNOS = { link = "Visual" }, -- Visual mode selection when vim is "Not Owning the Selection".
		WarningMsg = { fg = light_dark(scale.yellow[6], scale.yellow[4]) }, -- warning messages
		Whitespace = { fg = light_dark(scale.gray[8], scale.gray[6]) }, -- "nbsp", "space", "tab" and "trail" in 'listchars'
		WildMenu = { bg = light_dark(scale.white, scale.gray[9]) }, -- current match in 'wildmenu' completion

		-- These groups are not listed as default vim groups,
		-- but they are defacto standard group names for syntax highlighting.
		-- commented out groups should chain up to their "preferred" group by
		-- default,
		-- Uncomment and edit if you want more specific syntax highlighting.

		Constant = { fg = light_dark(scale.blue[7], scale.blue[3]) }, -- (preferred) any constant
		String = { fg = light_dark(scale.blue[8], scale.blue[2]) }, --   a string constant: "this is a string"
		Character = { link = "String" }, --  a character constant: 'c', '\n'
		-- Number        = { }, --   a number constant: 234, 0xff
		-- Boolean       = { }, --  a boolean constant: TRUE, false
		-- Float         = { }, --    a floating point constant: 2.3e10

		Identifier = {
			fg = light_dark(scale.orange[7], scale.orange[3]),
			style = options.styles.variables,
		}, -- (preferred) any variable name
		["@variable"] = {
			fg = light_dark(scale.gray[9], scale.gray[2]),
			style = options.styles.variables,
		},
		["@field"] = { fg = light_dark(scale.gray[9], scale.gray[2]) },
		Function = {
			fg = light_dark(scale.purple[6], scale.purple[3]),
			style = options.styles.functions,
		}, -- function name (also: methods for classes)
		["@property"] = { fg = light_dark(scale.blue[9], scale.blue[2]) },
		["@constructor"] = { fg = light_dark(scale.orange[7], scale.orange[3]) },

		Statement = { fg = light_dark(scale.red[6], scale.red[4]) }, -- (preferred) any statement
		-- Conditional   = { }, --  if, then, else, endif, switch, etc.
		-- Repeat        = { }, --   for, do, while, etc.
		-- Label         = { }, --    case, default, etc.
		Operator = { link = "Statement" }, -- "sizeof", "+", "*", etc.
		Keyword = { link = "Statement", style = options.styles.keywords }, --  any other keyword
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
		["@tag.delimiter"] = { fg = light_dark(scale.gray[9], scale.gray[2]) },
		["@tag.punctuation"] = { fg = light_dark(scale.gray[9], scale.gray[2]) },
		["@punctuation.bracket"] = { fg = light_dark(scale.gray[9], scale.gray[2]) },
		-- Delimiter     = { }, --  character that needs attention
		-- SpecialComment= { }, -- special things inside a comment
		-- Debug         = { }, --    debugging statements

		Underlined = { underline = true }, -- (preferred) text that stands out, HTML links
		Bold = { bold = true },
		Italic = { italic = true },
		["@text.emphasis"] = { italic = true },

		-- ("Ignore", below, may be invisible...)
		-- Ignore = { }, -- (preferred) left blank, hidden  |hl-Ignore|

		Error = { fg = light_dark(scale.red[6], scale.red[5]) }, -- (preferred) any erroneous construct
		Todo = {
			fg = light_dark(scale.white, scale.gray[10]),
			bg = light_dark(scale.yellow[6], scale.yellow[4]),
		}, -- (preferred) anything that needs extra attention; mostly the keywords TODO FIXME and XXX

		qfLineNr = { fg = light_dark(scale.red[6], scale.red[4]) },
		qfFileName = { fg = light_dark(scale.blue[6], scale.blue[4]) },

		mkdCodeDelimiter = { fg = light_dark(scale.gray[9], scale.gray[2]) },
		mkdCodeStart = { fg = light_dark(scale.orange[7], scale.orange[3]), bold = true },
		mkdCodeEnd = { fg = light_dark(scale.orange[7], scale.orange[3]), bold = true },

		markdownHeadingDelimiter = { fg = light_dark(scale.orange[7], scale.orange[3]), bold = true },
		markdownTSTextReference = { link = "Title" },
		markdownH1 = { fg = light_dark(scale.blue[7], scale.blue[3]), bold = true },
		markdownH2 = { fg = light_dark(scale.blue[7], scale.blue[3]), bold = true },
		markdownH3 = { fg = light_dark(scale.blue[7], scale.blue[3]), bold = true },
		markdownLinkText = { fg = light_dark(scale.gray[9], scale.gray[2]), underline = true },
		markdownUrl = { fg = light_dark(scale.gray[9], scale.gray[2]), underline = true },

		debugPC = { bg = light_dark(scale.gray[1], scale.black) }, -- used for highlighting the current line in terminal-debug
		debugBreakpoint = {
			fg = light_dark(scale.yellow[6], scale.yellow[4]),
			bg = light_dark(
				alpha(scale.yellow[3], light_dark(scale.white, scale.gray[10]), 0.3),
				alpha(scale.yellow[7], light_dark(scale.white, scale.gray[10]), 0.4)
			),
		}, -- used for breakpoint colors in terminal-debug

		-- These groups are for the native LSP client. Some other LSP clients may
		-- use these groups, or use their own. Consult your LSP client's
		-- documentation.
		LspReferenceText = { fg = light_dark(scale.green[1], scale.green[10]) }, -- used for highlighting "text" references
		LspReferenceRead = { link = "LspReferenceText" }, -- used for highlighting "read" references
		LspReferenceWrite = { link = "LspReferenceText" }, -- used for highlighting "write" references

		DiagnosticError = { fg = light_dark(scale.red[6], scale.red[5]) }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default
		DiagnosticWarn = { fg = light_dark(scale.yellow[6], scale.yellow[4]) }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default
		DiagnosticInfo = { fg = light_dark(scale.blue[6], scale.blue[4]) }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default
		DiagnosticHint = { fg = light_dark(scale.gray[7], scale.gray[3]) }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default

		DiagnosticVirtualTextError = {
			fg = light_dark(scale.red[6], scale.red[5]),
			bg = alpha(
				light_dark(scale.red[4], scale.red[5]),
				light_dark(scale.white, scale.gray[10]),
				0.4
			),
		}, -- Used for "Error" diagnostic virtual text
		DiagnosticVirtualTextWarn = {
			fg = light_dark(scale.yellow[6], scale.yellow[4]),
			bg = alpha(
				light_dark(scale.yellow[4], scale.yellow[5]),
				light_dark(scale.white, scale.gray[10]),
				0.4
			),
		}, -- Used for "Warning" diagnostic virtual text
		DiagnosticVirtualTextInfo = {
			fg = light_dark(scale.blue[6], scale.blue[4]),
			bg = alpha(
				light_dark(scale.blue[4], scale.blue[5]),
				light_dark(scale.white, scale.gray[10]),
				0.4
			),
		}, -- Used for "Information" diagnostic virtual text
		DiagnosticVirtualTextHint = {
			fg = light_dark(scale.gray[7], scale.gray[3]),
			bg = light_dark(scale.gray[1], scale.gray[8]),
		}, -- Used for "Hint" diagnostic virtual text

		DiagnosticUnderlineError = { undercurl = true, sp = light_dark(scale.red[6], scale.red[5]) }, -- Used to underline "Error" diagnostics
		DiagnosticUnderlineWarn = {
			undercurl = true,
			sp = light_dark(scale.yellow[6], scale.yellow[4]),
		}, -- Used to underline "Warning" diagnostics
		DiagnosticUnderlineInfo = { undercurl = true, sp = light_dark(scale.blue[6], scale.blue[4]) }, -- Used to underline "Information" diagnostics
		DiagnosticUnderlineHint = { undercurl = true, sp = light_dark(scale.gray[7], scale.gray[3]) }, -- Used to underline "Hint" diagnostics

		LspCodeLens = { link = "Comment" },

		-- ts-rainbow
		rainbowcol1 = { fg = light_dark(scale.blue[6], scale.blue[3]) },
		rainbowcol2 = { fg = light_dark(scale.green[6], scale.green[3]) },
		rainbowcol3 = { fg = light_dark(scale.yellow[6], scale.yellow[3]) },
		rainbowcol4 = { fg = light_dark(scale.red[6], scale.red[3]) },
		rainbowcol5 = { fg = light_dark(scale.pink[6], scale.pink[3]) },
		rainbowcol6 = { fg = light_dark(scale.purple[6], scale.purple[3]) },

		-- NvimTree
		NvimTreeNormal = {
			fg = light_dark(scale.gray[9], scale.gray[2]),
			bg = light_dark(scale.gray[1], scale.black),
		},
		NvimTreeEndOfBuffer = { fg = light_dark(scale.gray[1], scale.black) },
		NvimTreeRootFolder = { fg = light_dark(scale.gray[9], scale.gray[2]), bold = true },
		NvimTreeGitDirty = { fg = light_dark(scale.yellow[6], scale.yellow[4]) },
		NvimTreeGitNew = { fg = light_dark(scale.green[6], scale.green[3]) },
		NvimTreeGitRenamed = { fg = light_dark(scale.yellow[6], scale.yellow[4]) },
		NvimTreeGitDeleted = { fg = light_dark(scale.red[6], scale.red[5]) },
		NvimTreeGitIgnored = { fg = light_dark(scale.gray[9], scale.gray[2]) },
		NvimTreeSpecialFile = { fg = scale.yellow[4], underline = true },
		NvimTreeIndentMarker = { fg = light_dark(scale.gray[9], scale.gray[2]) },
		NvimTreeImageFile = { fg = scale.yellow[3] },
		NvimTreeFileIcon = { fg = light_dark(scale.gray[9], scale.gray[2]) },
		NvimTreeFolderIcon = { fg = light_dark(scale.gray[9], scale.gray[2]) },
		NvimTreeSymlink = { fg = scale.purple[4] },
		NvimTreeFolderName = { fg = light_dark(scale.gray[9], scale.gray[2]) },
		NvimTreeOpenedFolderName = { fg = light_dark(scale.gray[9], scale.gray[2]), bold = true },
		NvimTreeOpenedFile = { fg = scale.blue[3] },

		-- GitGutter
		GitGutterAdd = { fg = light_dark(scale.green[6], scale.green[3]) },
		GitGutterChange = { fg = light_dark(scale.yellow[6], scale.yellow[4]) },
		GitGutterDelete = { fg = light_dark(scale.red[6], scale.red[5]) },

		-- GitSigns
		GitSignsAdd = { fg = light_dark(scale.green[6], scale.green[3]) },
		GitSignsChange = { fg = light_dark(scale.yellow[6], scale.yellow[4]) },
		GitSignsDelete = { fg = light_dark(scale.red[6], scale.red[5]) },

		-- Telescope
		TelescopeBorder = {
			fg = light_dark(scale.gray[7], scale.gray[3]),
			bg = light_dark(scale.white, scale.gray[9]),
		},
		TelescopeNormal = {
			fg = light_dark(scale.gray[9], scale.gray[2]),
			bg = light_dark(scale.white, scale.gray[9]),
		},
		TelescopeTitle = { fg = light_dark(scale.gray[9], scale.gray[2]) },
		TelescopePromptPrefix = { fg = light_dark(scale.gray[9], scale.gray[2]) },

		-- Cmp
		CmpDocumentation = { link = "NormalFloat" },
		CmpDocumentationBorder = { link = "FloatBorder" },
		CmpItemAbbrDeprecated = { fg = light_dark(scale.gray[6], scale.gray[4]), strikethrough = true },
		CmpItemAbbrMatch = { fg = light_dark(scale.blue[6], scale.blue[4]) },
		CmpItemAbbr = { fg = light_dark(scale.gray[9], scale.gray[2]) },
		CmpItemAbbrMatchFuzzy = { link = "CmpItemAbbrMatch" },
		CmpItemMenu = { link = "CmpItemAbbrDefault" },
		CmpItemKindColor = { fg = light_dark(scale.blue[9], scale.blue[3]) },
		CmpItemKindProperty = { fg = light_dark(scale.orange[7], scale.orange[4]) },
		CmpItemKindSnippet = { fg = light_dark(scale.blue[7], scale.blue[4]) },
		CmpItemKindVariable = { fg = light_dark(scale.orange[7], scale.orange[4]) },
		CmpItemKindClass = { fg = light_dark(scale.orange[7], scale.orange[4]) },
		CmpItemKindEnum = { fg = light_dark(scale.orange[7], scale.orange[4]) },
		CmpItemKindInterface = { fg = light_dark(scale.orange[7], scale.orange[4]) },
		CmpItemKindText = { fg = light_dark(scale.blue[9], scale.blue[3]) },
		CmpItemKindKeyword = { fg = light_dark(scale.red[7], scale.red[4]) },
		CmpItemKindField = { fg = light_dark(scale.orange[7], scale.orange[4]) },
		CmpItemKindUnit = { fg = light_dark(scale.blue[7], scale.blue[4]) },
		CmpItemKindValue = { fg = light_dark(scale.orange[7], scale.orange[4]) },
		CmpItemKindFile = { fg = light_dark(scale.yellow[7], scale.yellow[4]) },
		CmpItemKindFolder = { fg = light_dark(scale.yellow[7], scale.yellow[4]) },
		CmpItemKindFunction = { fg = light_dark(scale.purple[7], scale.purple[4]) },
		CmpItemKindConstructor = { fg = light_dark(scale.purple[9], scale.purple[3]) },
		CmpItemKindEvent = { fg = light_dark(scale.gray[6], scale.gray[4]) },
		CmpItemKindMethod = { fg = light_dark(scale.purple[7], scale.purple[4]) },
		CmpItemKindOperator = { fg = light_dark(scale.blue[8], scale.blue[2]) },
		CmpItemKindEnumMember = { fg = light_dark(scale.blue[7], scale.blue[4]) },
		CmpItemKindReference = { fg = light_dark(scale.blue[6], scale.blue[3]) },
		CmpItemKindTypeParameter = { fg = light_dark(scale.blue[8], scale.blue[2]) },
		CmpItemKindConstant = { fg = light_dark(scale.green[7], scale.green[4]) },
		CmpItemKindModule = { fg = light_dark(scale.red[7], scale.red[4]) },
		CmpItemKindStruct = { fg = light_dark(scale.orange[7], scale.orange[4]) },

		-- Noice
		NoiceCmdlinePopupBorder = {
			fg = light_dark(scale.gray[7], scale.gray[3]),
			bg = light_dark(scale.white, scale.gray[9]),
		},
		NoiceCmdlinePopup = {
			fg = light_dark(scale.gray[9], scale.gray[2]),
			bg = light_dark(scale.white, scale.gray[9]),
		},
		NoiceCmdlineIcon = { fg = light_dark(scale.gray[9], scale.gray[2]) },
		NoiceCompletionItemKindEnum = { fg = light_dark(scale.orange[7], scale.orange[4]) },
		NoiceCompletionItemKindFile = { fg = light_dark(scale.yellow[7], scale.yellow[4]) },
		NoiceCompletionItemKindText = { fg = light_dark(scale.blue[9], scale.blue[3]) },
		NoiceCompletionItemKindUnit = { fg = light_dark(scale.blue[7], scale.blue[4]) },
		NoiceCompletionItemKindEvent = { fg = light_dark(scale.gray[6], scale.gray[4]) },
		NoiceCompletionItemKindValue = { fg = light_dark(scale.orange[7], scale.orange[4]) },
		NoiceCompletionItemKindClass = { fg = light_dark(scale.orange[7], scale.orange[4]) },
		NoiceCompletionItemKindColor = { fg = light_dark(scale.blue[9], scale.blue[3]) },
		NoiceCompletionItemKindField = { fg = light_dark(scale.orange[7], scale.orange[4]) },
		NoiceCompletionItemKindFolder = { fg = light_dark(scale.yellow[7], scale.yellow[4]) },
		NoiceCompletionItemKindMethod = { fg = light_dark(scale.purple[7], scale.purple[4]) },
		NoiceCompletionItemKindModule = { fg = light_dark(scale.red[7], scale.red[4]) },
		NoiceCompletionItemKindStruct = { fg = light_dark(scale.orange[7], scale.orange[4]) },
		NoiceCompletionItemKindDefault = { fg = light_dark(scale.orange[7], scale.orange[4]) },
		NoiceCompletionItemKindKeyword = { fg = light_dark(scale.red[7], scale.red[4]) },
		NoiceCompletionItemKindSnippet = { fg = light_dark(scale.blue[7], scale.blue[4]) },
		NoiceCompletionItemKindConstant = { fg = light_dark(scale.green[7], scale.green[4]) },
		NoiceCompletionItemKindFunction = { fg = light_dark(scale.purple[7], scale.purple[4]) },
		NoiceCompletionItemKindProperty = { fg = light_dark(scale.orange[7], scale.orange[4]) },
		NoiceCompletionItemKindVariable = { fg = light_dark(scale.orange[7], scale.orange[4]) },
		NoiceCompletionItemKindReference = { fg = light_dark(scale.blue[6], scale.blue[3]) },
		NoiceCompletionItemKindInterface = { fg = light_dark(scale.orange[7], scale.orange[4]) },
		NoiceCompletionItemKindEnumMember = { fg = light_dark(scale.blue[7], scale.blue[4]) },
		NoiceCompletionItemKindConstructor = { fg = light_dark(scale.purple[9], scale.purple[3]) },
		NoiceCompletionItemKindTypeParameter = { fg = light_dark(scale.blue[8], scale.blue[2]) },

		-- Notify
		NotifyERRORBorder = {
			fg = light_dark(scale.red[6], scale.red[5]),
			bg = light_dark(scale.white, scale.gray[9]),
		},
		NotifyWARNBorder = {
			fg = light_dark(scale.yellow[6], scale.yellow[4]),
			bg = light_dark(scale.white, scale.gray[9]),
		},
		NotifyINFOBorder = {
			fg = light_dark(scale.blue[6], scale.blue[4]),
			bg = light_dark(scale.white, scale.gray[9]),
		},
		NotifyDEBUGBorder = {
			fg = light_dark(scale.gray[9], scale.gray[2]),
			bg = light_dark(scale.white, scale.gray[9]),
		},
		NotifyTRACEBorder = { fg = scale.purple[9], bg = light_dark(scale.white, scale.gray[9]) },

		NotifyERRORIcon = { fg = light_dark(scale.red[6], scale.red[5]) },
		NotifyWARNIcon = { fg = light_dark(scale.yellow[6], scale.yellow[4]) },
		NotifyINFOIcon = { fg = light_dark(scale.blue[6], scale.blue[4]) },
		NotifyDEBUGIcon = { fg = light_dark(scale.gray[9], scale.gray[2]) },
		NotifyTRACEIcon = { fg = scale.purple[9] },

		NotifyERRORTitle = { fg = light_dark(scale.red[6], scale.red[5]) },
		NotifyWARNTitle = { fg = light_dark(scale.yellow[6], scale.yellow[4]) },
		NotifyINFOTitle = { fg = light_dark(scale.blue[6], scale.blue[4]) },
		NotifyDEBUGTitle = { fg = light_dark(scale.gray[9], scale.gray[2]) },
		NotifyTRACETitle = { fg = scale.purple[9] },

		NotifyERRORBody = {
			fg = light_dark(scale.gray[9], scale.gray[2]),
			bg = light_dark(scale.white, scale.gray[9]),
		},
		NotifyWARNBody = {
			fg = light_dark(scale.gray[9], scale.gray[2]),
			bg = light_dark(scale.white, scale.gray[9]),
		},
		NotifyINFOBody = {
			fg = light_dark(scale.gray[9], scale.gray[2]),
			bg = light_dark(scale.white, scale.gray[9]),
		},
		NotifyDEBUGBody = {
			fg = light_dark(scale.gray[9], scale.gray[2]),
			bg = light_dark(scale.white, scale.gray[9]),
		},
		NotifyTRACEBody = {
			fg = light_dark(scale.gray[9], scale.gray[2]),
			bg = light_dark(scale.white, scale.gray[9]),
		},
	}

	return theme
end

return M
