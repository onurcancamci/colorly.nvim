local color_utils = require("colorly.utils.colors")

return function(C, opts)
  ---@type table<string, Highlight>
  return {
    -- Syntax ---------------------------------
    Normal = { fg = C.Text, bg = C.Bg1 }, -- normal text
    NormalDim = { fg = C.TextDim1, bg = C.Bg1 }, -- normal text
    NormalAlt = { fg = C.AltText }, -- normal text
    Function = { fg = C.Alpha },
    AltFunction = { fg = C.Beta }, -- builtins, constructor etc

    Constant = { fg = C.Beta },
    Operator = { fg = C.Lambda },
    Punctuation = { fg = C.TextDim2 },

    Special = { fg = C.Iota },

    This = { fg = C.Delta }, -- this keyword (@variable.builtin)
    Identifier = { fg = C.Text },

    Keyword = { fg = C.Gamma },
    AltKeyword = { fg = C.Iota },

    Comment = { fg = C.TextDim2 },
    String = { fg = C.Eta },
    AltString = { fg = C.Theta },

    Type = { fg = C.Epsilon },
    Struct = { fg = C.Epsilon },
    Module = { fg = C.Beta },

    Macro = { fg = C.Iota },

    -- Css
    CssId = { fg = C.Alpha },
    CssType = { fg = C.Beta },
    CssTag = { fg = C.Gamma },
    CssValue = { fg = C.Eta },
    CssClass = { fg = C.Iota },

    -- Html/React
    HtmlTag = { fg = C.Gamma },
    ReactTag = { fg = C.Lambda },
    Attribute = { fg = C.Zeta },
    TagDelimiter = { fg = C.Lambda },

    -- Search
    Search = { bg = C.SearchBg, fg = C.Text }, -- Last search pattern highlighting
    IncSearch = {
      bg = C.Delta,
      fg = C.Bg2,
    }, -- Current search while searching
    Substitute = { bg = C.Bg4, fg = C.Pink }, -- |:substitute| replacement text highlighting

    -- Markup
    MarkupStrong = { fg = C.Gamma, bold = true },
    MarkupItalic = { fg = C.Gamma, italic = true },
    MarkupStrike = { fg = C.Text, strikethrough = true },
    MarkupUnderline = { fg = C.Text, underline = true },
    MarkupMath = { fg = C.Alpha },
    MarkupQuote = { fg = C.Gamma },

    -- Misc
    Url = { fg = C.Eta, underline = true },
    Regexp = { fg = C.Zeta },
    InlayHint = { fg = C.Bg4 },

    -- Misc Opinionated
    Parameter = { fg = C.Iota },

    SuccessText = { fg = C.Success },
    WarningText = { fg = C.Warning },
    InfoText = { fg = C.Info },
    HintText = { fg = C.Hint },
    ErrorText = { fg = C.Error },
    TodoText = { bg = C.Todo, fg = C.Bg1 },

    -- Editor -----------------------------------

    QfListLineNumber = { fg = C.Accent2 },
    QfListFileName = { fg = C.Accent1 },

    ColorColumn = { bg = C.Bg2 },
    CursorColumn = { bg = C.Bg2 },
    CursorLine = { bg = C.Bg2 },
    Cursor = { fg = C.Bg1, bg = C.Mu },
    Visual = { bg = C.Bg4 }, -- Visual mode selection

    LineNrBelow = { fg = C.Bg4 },
    LineNrAbove = { fg = C.Bg4 },
    LineNr = { fg = C.Accent1 },
    CursorLineNr = { link = "LineNr" },

    WinSeparator = { fg = C.Bg3, bg = C.Bg3 },
    MenuSelectedItem = { bg = C.Bg4 },
    Pmenu = { bg = C.Bg3, fg = C.TextDim2 },

    IndentLine = { fg = C.Bg4 },
    IndentLineActive = { fg = C.TextDim1 },

    MatchParen = { fg = C.MatchParen, bg = C.Bg4 },

    Files = { fg = C.Files },
    Accent1 = { fg = C.Accent1 },
    Accent2 = { fg = C.Accent2 },

    Deprecated = { fg = C.TextDim2, strikethrough = true },

    Illuminate = { bg = C.IlluminateBg },

    Rainbow1 = { fg = C.Rainbow1 },
    Rainbow2 = { fg = C.Rainbow2 },
    Rainbow3 = { fg = C.Rainbow3 },
    Rainbow4 = { fg = C.Rainbow4 },
    Rainbow5 = { fg = C.Rainbow5 },
    Rainbow6 = { fg = C.Rainbow6 },
    Rainbow7 = { fg = C.Rainbow7 },
    Rainbow8 = { fg = C.Rainbow8 },
    Rainbow9 = { fg = C.Rainbow9 },

    VcsAdded = { fg = C.VcsAdded },
    VcsIgnored = { fg = C.VcsIgnored },
    VcsModified = { fg = C.VcsModified },
    VcsDeleted = { fg = C.VcsDeleted },
    VcsUntracked = { fg = C.VcsUntracked },
    VcsRenamed = { fg = C.VcsRenamed },
    VcsOther = { fg = C.VcsOther },

    VcsAddedBg = { bg = C.VcsAddedBg },
    VcsModifiedBg = { bg = C.VcsModifiedBg },
    VcsDeletedBg = { bg = C.VcsDeletedBg },
    VcsDiffTextBg = { bg = C.VcsDiffTextBg },

    SnacksPickerBorder = { link = "FloatBorder" },
    SnacksPickerInputBorder = { fg = C.Accent2, bg = C.Bg2 },

    StatusLine = { fg = C.Text, bg = C.Bg2 },
    StatusLineNC = { fg = C.TextDim2, bg = C.Bg2 },

    TabLine = { fg = C.TextDim2, bg = C.Bg3 }, -- tabline
    TabLineFill = { bg = C.Bg2 }, -- inactive tab
    TabLineSel = { fg = C.Bg1, bg = C.TextDim2 }, -- selected tab

    ----------------------------------------------------
    -- Derived -----------------------------------------
    ----------------------------------------------------

    CurSearch = { link = "IncSearch" }, -- Current selected search (after search complete)

    -- Syntax ---------------------------

    BuiltinConstant = { link = "Special" },
    Primitive = { link = "Special" },
    Number = { link = "Primitive" },
    Boolean = { link = "Primitive" },
    Float = { link = "Number" },

    BuiltinFunction = { link = "AltFunction" },
    BuiltinType = { link = "AltFunction" },
    Constructor = { link = "AltFunction" },
    MacroFunction = { link = "AltFunction" },

    IncludeKeyword = { link = "Keyword" },
    ExceptionKeyword = { link = "Keyword" },
    LoopKeyword = { link = "Keyword" },
    ReturnKeyword = { link = "Keyword" },
    ConditionalKeyword = { link = "Keyword" },
    ExportKeyword = { link = "Keyword" },

    Enum = { link = "Struct" },

    Modifier = { link = "Keyword" },

    DocString = { link = "AltString" },
    Character = { link = "AltString" },

    Variable = { link = "Identifier" },

    Property = { link = "Identifier" },
    Member = { link = "Property" },
    GotoLabel = { link = "Property" }, -- goto label

    Class = { link = "Struct" },
    Interface = { link = "Struct" },
  }
end
