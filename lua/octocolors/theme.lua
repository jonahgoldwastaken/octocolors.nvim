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
		vim.notify("octocolors: invalid background option: " .. options.theme, vim.log.levels.ERROR)
		return {}
	end
	local co = c.colors
	local scale = c.scale

	local light_dark = util.light_dark
	local alpha = util.alpha

	theme.highlights = {
		ColorColumn = {}, -- used for the columns set with 'colorcolumn'
		Conceal = {}, -- placeholder characters substituted for concealed text (see 'conceallevel')
		Cursor = { fg = co.blue }, -- character under the cursor
		lCursor = { link = "Cursor" }, -- the character under the cursor when |language-mapping| is used (see 'guicursor')
		CursorIM = { link = "Cursor" }, -- like Cursor, but used when in IME mode |CursorIM|
		CursorColumn = { link = "CursorLine" }, -- Screen-column at the cursor, when 'cursorcolumn' is set.
		CursorLine = { bg = co.bg.overlay }, -- Screen-line at the cursor, when 'cursorline' is set.  Low-priority if foreground (ctermfg OR guifg) is not set.
		Directory = { fg = co.fg }, -- directory names (and other special names in listings)
		DiffAdd = { bg = co.git.add.bg }, -- diff mode: Added line |diff.txt|
		DiffChange = { bg = co.git.change.bg }, -- diff mode: Changed line |diff.txt|
		DiffDelete = { bg = co.git.delete.bg },
		DiffText = { fg = co.whitespace }, -- diff mode: Changed text within a changed line |diff.txt|
		EndOfBuffer = { fg = co.whitespace }, -- filler lines (~) after the end of the buffer.  By default, this is highlighted like |hl-NonText|.
		-- TermCursor  = { }, -- cursor in a focused terminal
		-- TermCursorNC= { }, -- cursor in an unfocused terminal
		ErrorMsg = { fg = co.git.delete.fg }, -- error messages on the command line
		VertSplit = { fg = co.border, bg = "NONE" }, -- the column separating vertically split windows
		WinSeparator = { fg = co.border, bg = "NONE" }, -- the column separating vertically split windows
		Folded = {}, -- line used for closed folds
		FoldColumn = {}, -- 'foldcolumn'
		SignColumn = { fg = light_dark(scale.gray[1], scale.gray[10]), bg = co.bg.overlay }, -- column where |signs| are displayed
		SignColumnSB = { fg = light_dark(scale.gray[1], scale.gray[8]), bg = co.bg.default }, -- column where |signs| are displayed
		Substitute = { bg = light_dark(scale.yellow[5], scale.yellow[6]) }, -- |:substitute| replacement text highlighting
		LineNr = { fg = scale.gray[5] }, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
		CursorLineNr = { fg = co.fg }, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
		MatchParen = { bg = alpha(scale.green[3], co.bg.default, 0.25) }, -- The character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
		ModeMsg = { fg = co.fg }, -- 'showmode' message (e.g., "-- INSERT -- ")
		MsgArea = { fg = co.fg }, -- Area for messages and cmdline
		-- MsgSeparator= { }, -- Separator for scrolled messages, `msgsep` flag of 'display'
		MoreMsg = { fg = co.blue }, -- |more-prompt|
		NonText = { fg = light_dark(scale.gray[3], scale.gray[5]) }, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
		Normal = { fg = co.fg, bg = co.bg.default }, -- normal text
		NormalNC = { fg = co.fg, bg = co.bg.default }, -- normal text in non-current windows
		NormalSB = { fg = co.fg, bg = co.bg.sidebar }, -- normal text in sidebar
		NormalFloat = { fg = co.fg, bg = co.bg.overlay }, -- Normal text in floating windows.
		FloatBorder = { fg = co.border, bg = co.bg.overlay },
		Pmenu = { fg = co.fg, bg = co.bg.overlay }, -- Popup menu: normal item.
		PmenuSel = { fg = co.bg.default, bg = co.selection }, -- Popup menu: selected item.
		PmenuSbar = { bg = co.bg.overlay }, -- Popup menu: scrollbar.
		PmenuThumb = { bg = alpha(scale.gray[5], co.bg.overlay, 0.2) }, -- Popup menu: Thumb of the scrollbar.
		Question = { fg = co.blue }, -- |hit-enter| prompt and yes/no questions
		QuickFixLine = { bg = alpha(scale.blue[7], co.bg.overlay, 0.4) }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
		Search = { fg = "NONE", bg = co.match_highlight }, -- Last search pattern highlighting (see 'hlsearch').  Also used for similar items that need to stand out.
		IncSearch = { bg = co.match }, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
		CurSearch = { link = "IncSearch" },
		SpecialKey = { fg = co.whitespace }, -- Unprintable characters: text displayed differently from what it really is.  But not 'listchars' whitespace. |hl-Whitespace|
		SpellBad = { sp = co.diagnostic.error.fg, undercurl = true }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
		SpellCap = { sp = co.yellow, undercurl = true }, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
		SpellLocal = { sp = co.blue, undercurl = true }, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
		SpellRare = { sp = light_dark(scale.gray[7], scale.gray[3]), undercurl = true }, -- Word that is recognized by the spellchecker as one that is hardly ever used.  |spell| Combined with the highlighting used otherwise.
		StatusLine = { fg = co.fg, bg = co.bg.statusline }, -- status line of current window
		StatusLineNC = { fg = co.comment, bg = co.bg.default }, -- status lines of not-current windows Note: if this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
		TabLine = { fg = co.fg, bg = co.bg.default }, -- tab pages line, not active tab page label
		TabLineFill = { bg = co.bg.sidebar }, -- tab pages line, where there are no labels
		TabLineSel = { link = "PmenuSel" }, -- tab pages line, active tab page label
		Title = { fg = co.blue2, bold = true }, -- titles for output from ":set all", ":autocmd" etc.
		["@text.title"] = { fg = co.fg },
		Visual = { fg = co.bg.default, bg = co.selection }, -- Visual mode selection
		VisualNOS = { link = "Visual" }, -- Visual mode selection when vim is "Not Owning the Selection".
		WarningMsg = { fg = co.yellow }, -- warning messages
		Whitespace = { fg = co.whitespace }, -- "nbsp", "space", "tab" and "trail" in 'listchars'
		WildMenu = { bg = co.bg.overlay }, -- current match in 'wildmenu' completion

		-- These groups are not listed as default vim groups,
		-- but they are defacto standard group names for syntax highlighting.
		-- commented out groups should chain up to their "preferred" group by
		-- default,
		-- Uncomment and edit if you want more specific syntax highlighting.

		Comment = { fg = co.comment, style = options.styles.comments }, -- any comment
		-- ["@comment"] = { },
		-- ["@text.literal"] = { },

		Constant = { fg = co.blue2 }, -- (preferred) any constant
		["@enumMember"] = { fg = co.blue2 },
		-- ["@constant"] = { },
		String = { fg = co.blue3 }, --   a string constant: "this is a string"
		-- ["@string"] = { },
		Character = { link = "String" }, --  a character constant: 'c', '\n'
		-- ["@character"] = { },
		Number = { fg = co.blue2 }, --   a number constant: 234, 0xff
		-- ["@number"] = { },
		Boolean = { link = "Number" }, --  a boolean constant: TRUE, false
		-- ["@boolean"] = { },
		Float = { link = "Number" }, --    a floating point constant: 2.3e10
		-- ["@float"] = { },

		Identifier = { fg = co.orange, style = options.styles.variables }, -- (preferred) any variable name
		["@variable"] = { fg = co.fg, style = options.styles.variables },
		["@field"] = { fg = co.fg },
		["@property"] = { fg = co.fg },
		["@text.reference"] = { fg = co.link, underline = true, bold = true },
		["@interface"] = { fg = co.blue2 },
		["@decorator"] = { fg = co.blue },
		["@modifier"] = { fg = co.fg },
		-- ["@event"] = { },
		-- ["@namespace"] = { },
		-- ["@parameter"] = { },
		Function = { fg = co.purple, style = options.styles.functions }, -- function name (also: methods for classes)
		-- ["@function"] = { },
		-- ["@method"] = { },

		Statement = { fg = co.red }, -- (preferred) any statement
		-- Conditional   = { }, --  if, then, else, endif, switch, etc.
		-- ["@conditional"] = { },
		-- Repeat        = { }, --   for, do, while, etc.
		-- ["@repeat"] = { },
		-- Label         = { }, --    case, default, etc.
		-- ["@label"] = { },
		Operator = { link = "Statement" }, -- "sizeof", "+", "*", etc.
		-- ["@operator"] = { },
		Keyword = { link = "Statement", style = options.styles.keywords }, --  any other keyword
		-- ["@keyword"] = { },
		-- Exception     = { }, --  try, catch, throw
		-- ["@exception"] = { },

		PreProc = { fg = co.red }, -- (preferred) generic Preprocessor
		-- ["@preproc"] = { },
		-- Include       = { }, --  preprocessor #include
		-- ["@include"] = { },
		-- Define        = { }, --   preprocessor #define
		-- ["@define"] = { },
		-- ["@function.macro"] = { },
		Macro = { fg = co.orange }, --    same as Define
		-- ["@macro"] = { }, -- Macro
		-- ["@constant.macro"] = { },
		-- PreCondit     = { }, --  preprocessor #if, #else, #endif, etc.

		Type = { fg = co.red }, -- (preferred) int, long, char, etc.
		-- ["@type"] = { },
		["@enum"] = { fg = co.orange },
		["@typeParameter"] = { fg = co.blue },
		-- StorageClass  = { }, -- static, register, volatile, etc.
		-- ["@storageclass"] = { },
		-- Structure     = { }, --  struct, union, enum, etc.
		["@class"] = { fg = co.orange },
		["@struct"] = { fg = co.orange },
		-- ["@structure"] = { },
		-- Typedef       = { }, --  A typedef
		-- ["@type.definition"] = { },

		Special = { fg = co.blue3 }, -- (preferred) any special symbol
		["@constructor"] = { fg = co.orange },
		-- ["@constant.builtin"] = { },
		-- ["@function.builtin"] = { },
		-- SpecialChar   = { }, --  special character in a constant
		["@regexp"] = { fg = co.green },
		-- ["@string.escape"] = { },
		-- ["@string.special"] = { },
		-- ["@character.special"] = { },
		Tag = { fg = light_dark(scale.green[7], scale.green[2]) }, -- you can use CTRL-] on this
		-- ["@tag"] = { },
		["@tag.attribute"] = { fg = co.blue2 },
		["@tag.delimiter"] = { fg = co.fg },
		["@tag.punctuation"] = { fg = co.fg },
		-- Delimiter     = { }, --  character that needs attention
		-- ["@punctuation"] = { },
		["@punctuation.bracket"] = { fg = co.fg },
		-- SpecialComment= { }, -- special things inside a comment
		-- Debug         = { }, --    debugging statements
		-- ["@debug"] = { },

		["@text"] = { fg = co.fg },
		Underlined = { underline = true }, -- (preferred) text that stands out, HTML links
		-- ["@text.uri"] = { },
		-- ["@text.underline"] = { },
		Bold = { bold = true },
		Italic = { italic = true },

		-- ("Ignore", below, may be invisible...)
		-- Ignore = { }, -- (preferred) left blank, hidden  |hl-Ignore|

		Error = { fg = co.git.delete.fg }, -- (preferred) any erroneous construct
		Todo = { fg = co.bg.default, bg = co.yellow }, -- (preferred) anything that needs extra attention; mostly the keywords TODO FIXME and XXX
		-- ["@text.todo"] = { },

		qfLineNr = { fg = co.red },
		qfFileName = { fg = co.blue },

		mkdCodeDelimiter = { fg = co.fg },
		mkdCodeStart = { fg = co.orange, bold = true },
		mkdCodeEnd = { fg = co.orange, bold = true },

		markdownHeadingDelimiter = { fg = co.orange, bold = true },
		markdownTSTextReference = { link = "Title" },
		markdownH1 = { fg = co.blue2, bold = true },
		markdownH2 = { fg = co.blue2, bold = true },
		markdownH3 = { fg = co.blue2, bold = true },
		markdownLinkText = { fg = co.link, underline = true },
		markdownUrl = { fg = co.link, underline = true },

		debugPC = { bg = co.bg.sidebar }, -- used for highlighting the current line in terminal-debug
		debugBreakpoint = {
			fg = co.yellow,
			bg = light_dark(
				alpha(scale.yellow[3], co.bg.default, 0.3),
				alpha(scale.yellow[7], co.bg.default, 0.4)
			),
		}, -- used for breakpoint colors in terminal-debug

		-- These groups are for the native LSP client. Some other LSP clients may
		-- use these groups, or use their own. Consult your LSP client's
		-- documentation.
		LspReferenceText = { fg = light_dark(scale.green[1], scale.green[10]) }, -- used for highlighting "text" references
		LspReferenceRead = { link = "LspReferenceText" }, -- used for highlighting "read" references
		LspReferenceWrite = { link = "LspReferenceText" }, -- used for highlighting "write" references

		DiagnosticError = { fg = co.diagnostic.error.fg }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default
		DiagnosticWarn = { fg = co.diagnostic.warning.fg }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default
		DiagnosticInfo = { fg = co.diagnostic.info.fg }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default
		DiagnosticHint = { fg = co.diagnostic.hint.fg }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default

		DiagnosticVirtualTextError = { fg = co.diagnostic.error.fg, bg = co.diagnostic.error.bg }, -- Used for "Error" diagnostic virtual text
		DiagnosticVirtualTextWarn = { fg = co.diagnostic.warning.fg, bg = co.diagnostic.warning.bg }, -- Used for "Warning" diagnostic virtual text
		DiagnosticVirtualTextInfo = { fg = co.diagnostic.info.fg, bg = co.diagnostic.info.bg }, -- Used for "Information" diagnostic virtual text
		DiagnosticVirtualTextHint = { fg = co.diagnostic.hint.fg, bg = co.diagnostic.hint.bg }, -- Used for "Hint" diagnostic virtual text

		DiagnosticUnderlineError = { undercurl = true, sp = co.diagnostic.error.fg }, -- Used to underline "Error" diagnostics
		DiagnosticUnderlineWarn = { undercurl = true, sp = co.diagnostic.warning.fg }, -- Used to underline "Warning" diagnostics
		DiagnosticUnderlineInfo = { undercurl = true, sp = co.diagnostic.info.fg }, -- Used to underline "Information" diagnostics
		DiagnosticUnderlineHint = { undercurl = true, sp = co.diagnostic.hint.fg }, -- Used to underline "Hint" diagnostics

		LspCodeLens = { link = "Comment" },

		-- ts-rainbow
		rainbowcol1 = { fg = co.rainbow[1] },
		rainbowcol2 = { fg = co.rainbow[2] },
		rainbowcol3 = { fg = co.rainbow[3] },
		rainbowcol4 = { fg = co.rainbow[4] },
		rainbowcol5 = { fg = co.rainbow[5] },
		rainbowcol6 = { fg = co.rainbow[6] },

		-- NvimTree
		NvimTreeNormal = { fg = co.fg, bg = co.bg.sidebar },
		NvimTreeEndOfBuffer = { fg = co.bg.sidebar },
		NvimTreeRootFolder = { fg = co.fg, bold = true },
		NvimTreeGitDirty = { fg = co.yellow },
		NvimTreeGitNew = { fg = co.git.add.fg },
		NvimTreeGitRenamed = { fg = co.yellow },
		NvimTreeGitDeleted = { fg = co.git.delete.fg },
		NvimTreeGitIgnored = { fg = co.fg },
		NvimTreeSpecialFile = { fg = scale.yellow[4], underline = true },
		NvimTreeIndentMarker = { fg = co.fg },
		NvimTreeImageFile = { fg = scale.yellow[3] },
		NvimTreeFileIcon = { fg = co.fg },
		NvimTreeFolderIcon = { fg = co.fg },
		NvimTreeSymlink = { fg = scale.purple[4] },
		NvimTreeFolderName = { fg = co.fg },
		NvimTreeOpenedFolderName = { fg = co.fg, bold = true },
		NvimTreeOpenedFile = { fg = scale.blue[3] },

		-- Neotree
		NeoTreeNormal = { fg = co.fg, bg = co.bg.sidebar },
		NeoTreeNormalNC = { fg = co.fg, bg = co.bg.sidebar },
		NeoTreeEndOfBuffer = { fg = co.bg.sidebar },
		NeoTreeRootName = { fg = co.fg, bold = true },
		NeoTreeGitModified = { fg = co.yellow },
		NeoTreeGitAdded = { fg = co.git.add.fg },
		NeoTreeGitRenamed = { fg = co.yellow },
		NeoTreeGitDeleted = { fg = co.git.delete.fg },
		NeoTreeGitIgnored = { fg = co.comment },
		NeoTreeDimText = { fg = co.comment },
		NeoTreeMessage = { link = "NeoTreeDimText", italic = true },
		NeoTreeIndentMarker = { fg = co.fg },
		NeoTreeFileIcon = { fg = co.fg },
		NeoTreeDirectoryIcon = { fg = co.fg },
		NeoTreeSymbolicLinkTarget = { fg = scale.purple[4] },
		NeoTreeDirectoryName = { fg = co.fg },
		NeoTreeFileNameOpened = { fg = co.fg, bold = true },
		NeoTreeExpander = { fg = co.fg },

		-- GitGutter
		GitGutterAdd = { fg = co.git.add.fg },
		GitGutterChange = { fg = co.yellow },
		GitGutterDelete = { fg = co.git.delete.fg },

		-- GitSigns
		GitSignsAdd = { fg = co.git.add.fg },
		GitSignsChange = { fg = co.yellow },
		GitSignsDelete = { fg = co.git.delete.fg },

		-- Telescope
		TelescopeBorder = {
			fg = co.border,
			bg = co.bg.overlay,
		},
		TelescopeNormal = {
			fg = co.fg,
			bg = co.bg.overlay,
		},
		TelescopeTitle = { fg = co.fg },
		TelescopePromptPrefix = { fg = co.fg },

		-- Cmp
		CmpDocumentation = { link = "NormalFloat" },
		CmpDocumentationBorder = { link = "FloatBorder" },
		CmpItemAbbrDeprecated = { fg = co.comment, strikethrough = true },
		CmpItemAbbrMatch = { fg = co.blue },
		CmpItemAbbr = { fg = co.fg },
		CmpItemAbbrMatchFuzzy = { link = "CmpItemAbbrMatch" },
		CmpItemMenu = { link = "CmpItemAbbrDefault" },
		CmpItemKindColor = { fg = co.cmp.blue },
		CmpItemKindProperty = { fg = co.cmp.orange },
		CmpItemKindSnippet = { fg = co.cmp.blue2 },
		CmpItemKindVariable = { fg = co.cmp.orange },
		CmpItemKindClass = { fg = co.cmp.orange },
		CmpItemKindEnum = { fg = co.cmp.orange },
		CmpItemKindInterface = { fg = co.cmp.orange },
		CmpItemKindText = { fg = co.cmp.blue },
		CmpItemKindKeyword = { fg = co.cmp.red },
		CmpItemKindField = { fg = co.cmp.orange },
		CmpItemKindUnit = { fg = co.cmp.blue2 },
		CmpItemKindValue = { fg = co.cmp.orange },
		CmpItemKindFile = { fg = co.cmp.yellow },
		CmpItemKindFolder = { fg = co.cmp.yellow },
		CmpItemKindFunction = { fg = co.cmp.purple },
		CmpItemKindConstructor = { fg = light_dark(scale.purple[9], scale.purple[3]) },
		CmpItemKindEvent = { fg = co.comment },
		CmpItemKindMethod = { fg = co.cmp.purple },
		CmpItemKindOperator = { fg = light_dark(scale.blue[8], scale.blue[2]) },
		CmpItemKindEnumMember = { fg = co.cmp.blue2 },
		CmpItemKindReference = { fg = light_dark(scale.blue[6], scale.blue[3]) },
		CmpItemKindTypeParameter = { fg = light_dark(scale.blue[8], scale.blue[2]) },
		CmpItemKindConstant = { fg = co.cmp.green },
		CmpItemKindModule = { fg = co.cmp.red },
		CmpItemKindStruct = { fg = co.cmp.orange },

		-- Noice
		NoiceCmdlinePopupBorder = { fg = co.border, bg = co.bg.overlay },
		NoiceCmdlinePopup = { fg = co.fg, bg = co.bg.overlay },
		NoiceCmdlineIcon = { fg = co.fg },
		NoiceCmdlinePrompt = { fg = co.fg },
		NoiceCmdlinePopupBorderInput = { fg = co.border },
		NoiceCompletionItemKindEnum = { fg = co.cmp.orange },
		NoiceCompletionItemKindFile = { fg = co.cmp.yellow },
		NoiceCompletionItemKindText = { fg = co.cmp.blue },
		NoiceCompletionItemKindUnit = { fg = co.cmp.blue2 },
		NoiceCompletionItemKindEvent = { fg = co.comment },
		NoiceCompletionItemKindValue = { fg = co.cmp.orange },
		NoiceCompletionItemKindClass = { fg = co.cmp.orange },
		NoiceCompletionItemKindColor = { fg = co.cmp.blue },
		NoiceCompletionItemKindField = { fg = co.cmp.orange },
		NoiceCompletionItemKindFolder = { fg = co.cmp.yellow },
		NoiceCompletionItemKindMethod = { fg = co.cmp.purple },
		NoiceCompletionItemKindModule = { fg = co.cmp.red },
		NoiceCompletionItemKindStruct = { fg = co.cmp.orange },
		NoiceCompletionItemKindDefault = { fg = co.cmp.orange },
		NoiceCompletionItemKindKeyword = { fg = co.cmp.red },
		NoiceCompletionItemKindSnippet = { fg = co.cmp.blue2 },
		NoiceCompletionItemKindConstant = { fg = co.cmp.green },
		NoiceCompletionItemKindFunction = { fg = co.cmp.purple },
		NoiceCompletionItemKindProperty = { fg = co.cmp.orange },
		NoiceCompletionItemKindVariable = { fg = co.cmp.orange },
		NoiceCompletionItemKindReference = { fg = light_dark(scale.blue[6], scale.blue[3]) },
		NoiceCompletionItemKindInterface = { fg = co.cmp.orange },
		NoiceCompletionItemKindEnumMember = { fg = co.cmp.blue2 },
		NoiceCompletionItemKindConstructor = { fg = light_dark(scale.purple[9], scale.purple[3]) },
		NoiceCompletionItemKindTypeParameter = { fg = light_dark(scale.blue[8], scale.blue[2]) },
		NoiceFormatProgressDone = { bg = co.green },
		NoiceLspProgressSpinner = { fg = co.fg },
		NoiceLspProgressClient = { fg = co.fg, bold = true },

		-- Notify
		NotifyERRORBorder = { fg = co.red, bg = co.bg.overlay },
		NotifyWARNBorder = { fg = co.yellow, bg = co.bg.overlay },
		NotifyINFOBorder = { fg = co.border, bg = co.bg.overlay },
		NotifyDEBUGBorder = { fg = co.fg, bg = co.bg.overlay },
		NotifyTRACEBorder = { fg = scale.purple[9], bg = co.bg.overlay },

		NotifyERRORIcon = { fg = co.red },
		NotifyWARNIcon = { fg = co.yellow },
		NotifyINFOIcon = { fg = co.blue },
		NotifyDEBUGIcon = { fg = co.fg },
		NotifyTRACEIcon = { fg = scale.purple[9] },

		NotifyERRORTitle = { fg = co.red },
		NotifyWARNTitle = { fg = co.yellow },
		NotifyINFOTitle = { fg = co.blue },
		NotifyDEBUGTitle = { fg = co.fg },
		NotifyTRACETitle = { fg = scale.purple[9] },

		NotifyERRORBody = { fg = co.fg, bg = co.bg.overlay },
		NotifyWARNBody = { fg = co.fg, bg = co.bg.overlay },
		NotifyINFOBody = { fg = co.fg, bg = co.bg.overlay },
		NotifyDEBUGBody = { fg = co.fg, bg = co.bg.overlay },
		NotifyTRACEBody = { fg = co.fg, bg = co.bg.overlay },

		MiniIdentscopeSymbol = { fg = co.fg },

		DevIconDefault = { fg = co.fg },

		MasonHighlight = { fg = co.blue },
		MasonHighlightBlock = { fg = co.bg.default, bg = co.blue },
		MasonHighlightBlockBold = { fg = co.bg.default, bg = co.blue, bold = true },
		MasonHighlightSecondary = { fg = co.orange },
		MasonMuted = { fg = co.comment },
		MasonMutedBlock = { fg = co.bg.default, bg = co.comment },
		MasonMutedBlockBold = { fg = co.bg.default, bg = co.comment, bold = true },
		MasonError = { fg = co.red },
		MasonHeader = { fg = co.bg.default, bg = co.orange },
		MasonHeaderSecondary = { fg = co.bg.default, bg = co.blue },
		MasonHeaderSecondaryBold = { fg = co.bg.default, bg = co.blue, bold = true },

		HopNextKey = { fg = co.green2 },
		HopNextKey1 = { fg = co.yellow },
		HopNextKey2 = { fg = co.match },
	}

	return theme
end

return M
