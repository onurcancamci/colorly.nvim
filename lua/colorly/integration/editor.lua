return function(C)
  return {
    Conceal = { link = "Comment" }, -- placeholder characters substituted for concealed text (see 'conceallevel')
    lCursor = { link = "Cursor" },
    CursorIM = { link = "Cursor" },
    Directory = { link = "Files" }, -- directory names (and other special names in listings)
    EndOfBuffer = { link = "Comment" }, -- filler lines (~) after the end of the buffer.  By default, this is highlighted like |hl-NonText|.
    ErrorMsg = { link = "ErrorText" }, -- error messages on the command line
    Folded = { link = "Search" }, -- line used for closed folds
    SignColumn = { link = "NormalAlt" }, -- column where |signs| are displayed
    FoldColumn = { link = "SignColumn" }, -- 'foldcolumn'
    CursorLineNr = { link = "LineNr" }, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line. highlights the number in numberline.

    ModeMsg = { link = "Normal" }, -- 'showmode' message (e.g., "-- INSERT -- ")
    MsgSeparator = {}, -- Separator for scrolled messages, `msgsep` flag of 'display'
    MoreMsg = { link = "Accent1" }, -- |more-prompt|
    NonText = { link = "Comment" }, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.

    FloatBorder = { fg = C.Accent1, bg = C.Bg2 },
    PmenuBorder = { fg = C.Accent1, bg = C.Bg2 },

    -- FloatBorder = { link = "Accent1" },
    FloatTitle = { fg = C.TextDim1, bg = C.Bg2 }, -- Title of floating windows
    Pmenu = { link = "PopupMenu" }, -- Popup menu: normal item.

    PmenuSel = { link = "MenuSelectedItem" }, -- Popup menu: selected item.

    PmenuSbar = { bg = C.Bg4 }, -- Popup menu: scrollbar.
    PmenuThumb = { bg = C.TextDim2 }, -- Popup menu: Thumb of the scrollbar.
    PmenuExtra = { link = "Comment" }, -- Popup menu: normal item extra text.
    PmenuExtraSel = { link = "Comment" }, -- Popup menu: selected item extra text.
    Question = { link = "Accent1" }, -- |hit-enter| prompt and yes/no questions
    QuickFixLine = { link = "MenuSelectedItem" }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
    WildMenu = { link = "PmenuSel" }, -- current match in 'wildmenu' completion

    SpecialKey = { link = "NonText" }, -- Unprintable characters: text displayed differently from what it really is.  But not 'listchars' textspace. |hl-Whitespace|
    SpellBad = { link = "DiagnosticUnderlineError" }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
    SpellCap = { link = "DiagnosticUnderlineWarning" }, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
    SpellLocal = { link = "DiagnosticUnderlineInfo" }, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
    SpellRare = { link = "DiagnosticUnderlineOk" }, -- Word that is recognized by the spellchecker as one that is hardly ever used.  |spell| Combined with the highlighting used otherwise.

    TermCursor = { link = "Cursor" }, -- cursor in a focused terminal
    TermCursorNC = { fg = C.Bg1, bg = C.TextDim2 }, -- cursor in unfocused terminals
    Title = { link = "Accent1" }, -- titles for output from ":set all", ":autocmd" etc.
    VisualNOS = { link = "Visual" }, -- Visual mode selection when vim is "Not Owning the Selection".
    WarningMsg = { link = "WarningText" }, -- warning messages
    Whitespace = { link = "Comment" }, -- "nbsp", "space", "tab" and "trail" in 'listchars'
    WinBar = { link = "Files" }, -- if used, top of the file, `set winbar=%f`
    WinBarNC = { link = "WinBar" },
  }
end
