local colors = require "octocolors.colors"
local util = require "octocolors.util"

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

	local function light_dark(light, dark) return util.mode() == "light" and light or dark end

	theme.highlights = {
		Comment = { fg = light_dark(scale.gray[6], scale.gray[4]) }, -- any comment
		ColorColumn = {}, -- used for the columns set with 'colorcolumn'
		Conceal = {}, -- placeholder characters substituted for concealed text (see 'conceallevel')
		Cursor = { fg = c.accent.fg }, -- character under the cursor
		lCursor = { link = "Cursor" }, -- the character under the cursor when |language-mapping| is used (see 'guicursor')
		CursorIM = { link = "Cursor" }, -- like Cursor, but used when in IME mode |CursorIM|
		CursorColumn = { link = "CursorLine" }, -- Screen-column at the cursor, when 'cursorcolumn' is set.
		CursorLine = { bg = light_dark(scale.blue[2], scale.gray[9]) }, -- Screen-line at the cursor, when 'cursorline' is set.  Low-priority if foreground (ctermfg OR guifg) is not set.
		Directory = {}, -- directory names (and other special names in listings)
		DiffAdd = {}, -- diff mode: Added line |diff.txt|
		DiffChange = {}, -- diff mode: Changed line |diff.txt|
		DiffDelete = {}, -- diff mode: Deleted line |diff.txt|
		DiffText = {}, -- diff mode: Changed text within a changed line |diff.txt|
		EndOfBuffer = {}, -- filler lines (~) after the end of the buffer.  By default, this is highlighted like |hl-NonText|.
		-- TermCursor  = { }, -- cursor in a focused terminal
		-- TermCursorNC= { }, -- cursor in an unfocused terminal
		ErrorMsg = { fg = c.danger.fg }, -- error messages on the command line
		VertSplit = {}, -- the column separating vertically split windows
		WinSeparator = {}, -- the column separating vertically split windows
		Folded = {}, -- line used for closed folds
		FoldColumn = {}, -- 'foldcolumn'
		SignColumn = {}, -- column where |signs| are displayed
		SignColumnSB = {}, -- column where |signs| are displayed
		Substitute = {}, -- |:substitute| replacement text highlighting
		LineNr = {}, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
		CursorLineNr = {}, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
		MatchParen = {}, -- The character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
		ModeMsg = {}, -- 'showmode' message (e.g., "-- INSERT -- ")
		MsgArea = {}, -- Area for messages and cmdline
		-- MsgSeparator= { }, -- Separator for scrolled messages, `msgsep` flag of 'display'
		MoreMsg = {}, -- |more-prompt|
		NonText = {}, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
		Normal = { fg = c.fg.default, bg = c.canvas.default }, -- normal text
		NormalNC = { fg = c.fg.default, bg = c.canvas.default }, -- normal text in non-current windows
		NormalSB = { fg = c.fg.default, bg = c.canvas.default }, -- normal text in sidebar
		NormalFloat = { fg = c.fg.default, bg = c.canvas.default }, -- Normal text in floating windows.
		FloatBorder = { fg = c.border.default },
		Pmenu = { fg = c.fg.default, bg = c.canvas.overlay }, -- Popup menu: normal item.
		PmenuSel = { fg = c.fg.muted }, -- Popup menu: selected item.
		PmenuSbar = { bg = c.canvas.overlay }, -- Popup menu: scrollbar.
		PmenuThumb = { bg = util.alpha(scale.gray[5], 0.2) }, -- Popup menu: Thumb of the scrollbar.
		Question = {}, -- |hit-enter| prompt and yes/no questions
		QuickFixLine = {}, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
		Search = {}, -- Last search pattern highlighting (see 'hlsearch').  Also used for similar items that need to stand out.
		IncSearch = {}, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
		CurSearch = {},
		SpecialKey = {}, -- Unprintable characters: text displayed differently from what it really is.  But not 'listchars' whitespace. |hl-Whitespace|
		SpellBad = {}, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
		SpellCap = {}, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
		SpellLocal = {}, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
		SpellRare = {}, -- Word that is recognized by the spellchecker as one that is hardly ever used.  |spell| Combined with the highlighting used otherwise.
		StatusLine = {}, -- status line of current window
		StatusLineNC = {}, -- status lines of not-current windows Note: if this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
		TabLine = {}, -- tab pages line, not active tab page label
		TabLineFill = {}, -- tab pages line, where there are no labels
		TabLineSel = {}, -- tab pages line, active tab page label
		Title = {}, -- titles for output from ":set all", ":autocmd" etc.
		Visual = {}, -- Visual mode selection
		VisualNOS = {}, -- Visual mode selection when vim is "Not Owning the Selection".
		WarningMsg = {}, -- warning messages
		Whitespace = {}, -- "nbsp", "space", "tab" and "trail" in 'listchars'
		WildMenu = {}, -- current match in 'wildmenu' completion

		-- These groups are not listed as default vim groups,
		-- but they are defacto standard group names for syntax highlighting.
		-- commented out groups should chain up to their "preferred" group by
		-- default,
		-- Uncomment and edit if you want more specific syntax highlighting.

		Constant = {}, -- (preferred) any constant
		String = {}, --   a string constant: "this is a string"
		Character = {}, --  a character constant: 'c', '\n'
		-- Number        = { }, --   a number constant: 234, 0xff
		-- Boolean       = { }, --  a boolean constant: TRUE, false
		-- Float         = { }, --    a floating point constant: 2.3e10

		Identifier = {}, -- (preferred) any variable name
		Function = {}, -- function name (also: methods for classes)

		Statement = {}, -- (preferred) any statement
		-- Conditional   = { }, --  if, then, else, endif, switch, etc.
		-- Repeat        = { }, --   for, do, while, etc.
		-- Label         = { }, --    case, default, etc.
		Operator = {}, -- "sizeof", "+", "*", etc.
		Keyword = {}, --  any other keyword
		-- Exception     = { }, --  try, catch, throw

		PreProc = {}, -- (preferred) generic Preprocessor
		-- Include       = { }, --  preprocessor #include
		-- Define        = { }, --   preprocessor #define
		-- Macro         = { }, --    same as Define
		-- PreCondit     = { }, --  preprocessor #if, #else, #endif, etc.

		Type = {}, -- (preferred) int, long, char, etc.
		-- StorageClass  = { }, -- static, register, volatile, etc.
		-- Structure     = { }, --  struct, union, enum, etc.
		-- Typedef       = { }, --  A typedef

		Special = {}, -- (preferred) any special symbol
		-- SpecialChar   = { }, --  special character in a constant
		-- Tag           = { }, --    you can use CTRL-] on this
		-- Delimiter     = { }, --  character that needs attention
		-- SpecialComment= { }, -- special things inside a comment
		-- Debug         = { }, --    debugging statements

		Underlined = {}, -- (preferred) text that stands out, HTML links
		Bold = {},
		Italic = {},

		-- ("Ignore", below, may be invisible...)
		-- Ignore = { }, -- (preferred) left blank, hidden  |hl-Ignore|

		Error = {}, -- (preferred) any erroneous construct
		Todo = {}, -- (preferred) anything that needs extra attention; mostly the keywords TODO FIXME and XXX

		qfLineNr = {},
		qfFileName = {},

		htmlH1 = {},
		htmlH2 = {},

		-- mkdHeading = { },
		-- mkdCode = { },
		mkdCodeDelimiter = {},
		mkdCodeStart = {},
		mkdCodeEnd = {},
		-- mkdLink = { },

		markdownHeadingDelimiter = {},
		markdownCode = {},
		markdownCodeBlock = {},
		markdownH1 = {},
		markdownH2 = {},
		markdownLinkText = {},

		["@punctuation.special.markdown"] = {},
		["@text.literal.markdown_inline"] = {},

		debugPC = {}, -- used for highlighting the current line in terminal-debug
		debugBreakpoint = {}, -- used for breakpoint colors in terminal-debug

		-- These groups are for the native LSP client. Some other LSP clients may
		-- use these groups, or use their own. Consult your LSP client's
		-- documentation.
		LspReferenceText = {}, -- used for highlighting "text" references
		LspReferenceRead = {}, -- used for highlighting "read" references
		LspReferenceWrite = {}, -- used for highlighting "write" references

		DiagnosticError = {}, -- Used as the base highlight group. Other Diagnostic highlights link to this by default
		DiagnosticWarn = {}, -- Used as the base highlight group. Other Diagnostic highlights link to this by default
		DiagnosticInfo = {}, -- Used as the base highlight group. Other Diagnostic highlights link to this by default
		DiagnosticHint = {}, -- Used as the base highlight group. Other Diagnostic highlights link to this by default

		DiagnosticVirtualTextError = {}, -- Used for "Error" diagnostic virtual text
		DiagnosticVirtualTextWarn = {}, -- Used for "Warning" diagnostic virtual text
		DiagnosticVirtualTextInfo = {}, -- Used for "Information" diagnostic virtual text
		DiagnosticVirtualTextHint = {}, -- Used for "Hint" diagnostic virtual text

		DiagnosticUnderlineError = {}, -- Used to underline "Error" diagnostics
		DiagnosticUnderlineWarn = {}, -- Used to underline "Warning" diagnostics
		DiagnosticUnderlineInfo = {}, -- Used to underline "Information" diagnostics
		DiagnosticUnderlineHint = {}, -- Used to underline "Hint" diagnostics

		LspSignatureActiveParameter = {},
		LspCodeLens = {},

		LspInfoBorder = {},

		ALEErrorSign = {},
		ALEWarningSign = {},

		-- These groups are for the neovim tree-sitter highlights.
		-- As of writing, tree-sitter support is a WIP, group names may change.
		-- By default, most of these groups link to an appropriate Vim group,
		-- TSError -> Error for example, so you do not have to define these unless
		-- you explicitly want to support Treesitter's improved syntax awareness.

		-- TSAnnotation        = { };    -- For C++/Dart attributes, annotations that can be attached to the code to denote some kind of meta information.
		-- TSAttribute         = { };    -- (unstable) TODO: docs
		-- TSBoolean           = { };    -- For booleans.
		-- TSCharacter         = { };    -- For characters.
		-- TSComment           = { };    -- For comment blocks.
		TSNote = {},
		["@text.warning"] = {},
		["@text.danger"] = {},
		["@constructor"] = {}, -- in Lua, and Java constructors.
		-- TSConditional       = { };    -- For keywords related to conditionnals.
		-- TSConstant          = { };    -- For constants
		-- TSConstBuiltin      = { };    -- For constant that are built in the language: `nil` in Lua.
		-- TSConstMacro        = { };    -- For constants that are defined by macros: `NULL` in C.
		-- TSError             = { };    -- For syntax/parser errors.
		-- TSException         = { };    -- For exception related keywords.
		["@field"] = {}, -- For fields.
		-- TSFloat             = { };    -- For floats.
		-- TSFunction          = { };    -- For function (calls and definitions).
		-- TSFuncBuiltin       = { };    -- For builtin functions: `table.insert` in Lua.
		-- TSFuncMacro         = { };    -- For macro defined fuctions (calls and definitions): each `macro_rules` in Rust.
		-- TSInclude           = { };    -- For includes: `#include` in C, `use` or `extern crate` in Rust, or `require` in Lua.
		["@keyword"] = {}, -- For keywords that don't fall in previous categories.
		["@keyword.function"] = {}, -- For keywords used to define a fuction.
		["@label"] = {}, -- For labels: `label:` in C and `:label:` in Lua.
		-- TSMethod            = { };    -- For method calls and definitions.
		-- TSNamespace         = { };    -- For identifiers referring to modules and namespaces.
		-- TSNone              = { };    -- TODO: docs
		-- TSNumber            = { };    -- For all numbers
		["@operator"] = {}, -- For any operator: `+`, but also `->` and `*` in C.
		["@parameter"] = {}, -- For parameters of a function.
		-- TSParameterReference= { };    -- For references to parameters of a function.
		["@property"] = {}, -- Same as `TSField`.
		["@punctuation.delimiter"] = {}, -- For delimiters ie: `.`
		["@punctuation.bracket"] = {}, -- For brackets and parens.
		["@punctuation.special"] = {}, -- For special punctutation that does not fall in the catagories before.
		-- TSRepeat            = { };    -- For keywords related to loops.
		-- TSString            = { };    -- For strings.
		["@string.regex"] = {}, -- For regexes.
		["@string.escape"] = {}, -- For escape characters within a string.
		-- TSSymbol            = { };    -- For identifiers referring to symbols or atoms.
		-- TSType              = { };    -- For types.
		-- TSTypeBuiltin       = { };    -- For builtin types.
		["@variable"] = {}, -- Any variable name that does not have another highlight.
		["@variable.builtin"] = {}, -- Variable names that are defined by the languages, like `this` or `self`.

		-- TSTag               = { };    -- Tags like html tag names.
		-- TSTagDelimiter      = { };    -- Tag delimiter like `<` `>` `/`
		-- TSText              = { };    -- For strings considered text in a markup language.
		["@text.reference"] = {},
		-- TSEmphasis          = { };    -- For text to be represented with emphasis.
		-- TSUnderline         = { };    -- For text to be represented with an underline.
		-- TSStrike            = { };    -- For strikethrough text.
		-- TSTitle             = { };    -- Text that is part of a title.
		-- TSLiteral           = { };    -- Literal text.
		-- TSURI               = { };    -- Any URI like a link or email.
		["@text.diff.add"] = {},
		["@text.diff.delete"] = {},
	}

	return theme
end

return M
