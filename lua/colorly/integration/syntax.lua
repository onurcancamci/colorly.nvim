-- Most of these are taken from catppuccin
-- https://github.com/catppuccin/nvim/blob/main/lua/catppuccin/groups/syntax.lua
-- https://github.com/catppuccin/nvim/blob/main/lua/catppuccin/groups/treesitter.lua
local color_utils = require("colorly.utils.colors")

return function(C)
  local groups = {
    NonText = { link = "Comment" }, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
    NormalNC = { link = "Normal" }, -- normal text in non-current windows
    NormalSB = { fg = C.Text, bg = C.Bg3 }, -- normal text in non-current windows
    NormalFloat = { fg = C.Text, bg = C.Bg2 }, -- Normal text in floating windows.

    SpecialComment = { link = "Special" }, -- special things inside a comment

    Statement = { link = "Keyword" }, -- (preferred) any statement
    Conditional = { link = "ConditionalKeyword" }, --  if, then, else, endif, switch, etc.
    Repeat = { link = "LoopKeyword" }, --   for, do, while, etc.
    Label = { link = "Keyword" }, --    case, default, etc.
    Exception = { link = "ExceptionKeyword" }, --  try, catch, throw

    PreProc = { fg = C.macro }, -- (preferred) generic Preprocessor
    Include = { link = "IncludeKeyword" }, --  preprocessor #include
    Define = { link = "PreProc" }, -- preprocessor #define
    Macro = { link = "Macro" }, -- same as Define
    PreCondit = { link = "PreProc" }, -- preprocessor #if, #else, #endif, etc.

    StorageClass = { link = "Modifier" }, -- static, register, volatile, etc.
    Structure = { link = "Struct" }, --  struct, union, enum, etc.
    Special = { link = "Special" }, -- (preferred) any special symbol
    Type = { link = "BuiltinType" }, -- (preferred) int, long, char, etc.
    Typedef = { link = "Type" }, --  A typedef
    SpecialChar = { link = "Special" }, -- special character in a constant

    Tag = { link = "Type" }, -- you can use CTRL-] on this

    Delimiter = { link = "Punctuation" },
    Debug = { link = "Special" }, -- debugging statements

    Underlined = { underline = true },
    Bold = { bold = true },
    Italic = { italic = true },

    Error = { link = "ErrorText" }, -- (preferred) any erroneous construct
    Todo = { link = "TodoText" }, -- (preferred) anything that needs extra attention; mostly the keywords TODO FIXME and XXX

    qfLineNr = { link = "QfListLineNumber" },
    qfFileName = { link = "QfListFileName" },

    -- debugging
    debugPC = { bg = C.Bg3 }, -- used for highlighting the current line in terminal-debug
    debugBreakpoint = { bg = C.Bg, fg = C.Error }, -- used for breakpoint colors in terminal-debug
    -- NeoVim
    healthError = { link = "ErrorText" },
    healthSuccess = { link = "SuccessText" },
    healthWarning = { link = "WarningText" },

    -- glyphs
    GlyphPalette1 = { fg = C.Red },
    GlyphPalette2 = { fg = C.Green },
    GlyphPalette3 = { fg = C.Yellow },
    GlyphPalette4 = { fg = C.Blue },
    GlyphPalette6 = { fg = C.Cyan },
    GlyphPalette7 = { fg = C.Text },
    GlyphPalette9 = { fg = C.Magenta },

    -- csv
    csvCol0 = { link = "Rainbow1" },
    csvCol1 = { link = "Rainbow2" },
    csvCol2 = { link = "Rainbow3" },
    csvCol3 = { link = "Rainbow4" },
    csvCol4 = { link = "Rainbow5" },
    csvCol5 = { link = "Rainbow6" },
    csvCol6 = { link = "Rainbow7" },
    csvCol7 = { link = "Rainbow8" },
    csvCol8 = { link = "Rainbow9" },

    ["@variable"] = { link = "Variable" }, -- Any variable name that does not have another highlight.
    ["@variable.builtin"] = { link = "This" }, -- Variable names that are defined by the languages, like this or self.
    ["@variable.parameter"] = { link = "Parameter" }, -- For parameters of a function.
    ["@variable.member"] = { link = "Member" }, -- For fields.

    ["@constant"] = { link = "Constant" }, -- For constants
    ["@constant.builtin"] = { link = "BuiltinConstant" }, -- For constant that are built in the language: nil in Lua.
    ["@constant.macro"] = { link = "Macro" }, -- For constants that are defined by macros: NULL in C.

    ["@module"] = { link = "Module" }, -- For identifiers referring to modules and namespaces.
    ["@label"] = { link = "GotoLabel" }, -- For labels: label: in C and :label: in Lua.

    -- Literals
    ["@string"] = { link = "String" }, -- For strings.
    ["@string.documentation"] = { link = "DocString" }, -- For strings documenting code (e.g. Python docstrings).
    ["@string.regexp"] = { link = "Regexp" }, -- For regexes.
    ["@string.escape"] = { link = "Special" }, -- For escape characters within a string.
    ["@string.special"] = { link = "Special" }, -- other special strings (e.g. dates)
    ["@string.special.path"] = { link = "Special" }, -- filenames
    ["@string.special.symbol"] = { link = "Special" }, -- symbols or atoms
    ["@string.special.url"] = { link = "Url" }, -- urls, links and emails

    ["@character"] = { link = "Character" }, -- character literals
    ["@character.special"] = { link = "SpecialChar" }, -- special characters (e.g. wildcards)

    ["@boolean"] = { link = "Boolean" }, -- For booleans.
    ["@number"] = { link = "Number" }, -- For all numbers
    ["@number.float"] = { link = "Float" }, -- For floats.

    -- Types
    ["@type"] = { link = "Type" }, -- For types.
    ["@type.builtin"] = { link = "BuiltinType" }, -- For builtin types.
    ["@type.definition"] = { link = "Type" }, -- type definitions (e.g. `typedef` in C)

    ["@attribute"] = { link = "Constant" }, -- attribute annotations (e.g. Python decorators)
    ["@property"] = { link = "Property" }, -- Same as TSField.

    -- Functions
    ["@function"] = { link = "Function" }, -- For function (calls and definitions).
    ["@function.builtin"] = { link = "BuiltinFunction" }, -- For builtin functions: table.insert in Lua.
    ["@function.call"] = { link = "Function" }, -- function calls
    ["@function.macro"] = { link = "Macro" }, -- For macro defined functions (calls and definitions): each macro_rules in Rust.

    ["@function.method"] = { link = "Function" }, -- For method definitions.
    ["@function.method.call"] = { link = "Function" }, -- For method calls.

    ["@constructor"] = { link = "Constructor" }, -- For constructor calls and definitions: = { } in Lua, and Java constructors.
    ["@operator"] = { link = "Operator" }, -- For any operator: +, but also -> and * in C.

    -- Keywords
    ["@keyword"] = { link = "Keyword" }, -- For keywords that don't fall in previous categories.
    ["@keyword.modifier"] = { link = "Modifier" }, -- For keywords modifying other constructs (e.g. `const`, `static`, `public`)
    ["@keyword.type"] = { link = "Keyword" }, -- For keywords describing composite types (e.g. `struct`, `enum`)
    ["@keyword.coroutine"] = { link = "Keyword" }, -- For keywords related to coroutines (e.g. `go` in Go, `async/await` in Python)
    ["@keyword.function"] = { link = "Keyword" }, -- For keywords used to define a function.
    ["@keyword.operator"] = { link = "Operator" }, -- For new keyword operator
    ["@keyword.import"] = { link = "Include" }, -- For includes: #include in C, use or extern crate in Rust, or require in Lua.
    ["@keyword.repeat"] = { link = "Repeat" }, -- For keywords related to loops.
    ["@keyword.return"] = { link = "ReturnKeyword" },
    ["@keyword.debug"] = { link = "Exception" }, -- For keywords related to debugging
    ["@keyword.exception"] = { link = "Exception" }, -- For exception related keywords.

    ["@keyword.conditional"] = { link = "Conditional" }, -- For keywords related to conditionnals.
    ["@keyword.conditional.ternary"] = { link = "Operator" }, -- For ternary operators (e.g. `?` / `:`)

    ["@keyword.directive"] = { link = "PreProc" }, -- various preprocessor directives & shebangs
    ["@keyword.directive.define"] = { link = "Define" }, -- preprocessor definition directives
    -- JS & derivative
    ["@keyword.export"] = { link = "ExportKeyword" },

    -- Punctuation
    ["@punctuation.delimiter"] = { link = "Punctuation" }, -- For delimiters (e.g. `;` / `.` / `,`).
    ["@punctuation.bracket"] = { link = "Punctuation" }, -- For brackets and parenthesis.
    ["@punctuation.special"] = { link = "Special" }, -- For special punctuation that does not fall in the categories before (e.g. `{}` in string interpolation).

    -- Comment
    ["@comment"] = { link = "Comment" },
    ["@comment.documentation"] = { link = "Comment" }, -- For comments documenting code

    ["@comment.error"] = { fg = C.Bg, bg = C.Error },
    ["@comment.warning"] = { fg = C.Bg, bg = C.Warning },
    ["@comment.hint"] = { fg = C.Bg, bg = C.Hint },
    ["@comment.todo"] = { fg = C.Bg, bg = C.Info },
    ["@comment.note"] = { fg = C.Bg, bg = C.Info },

    -- Markup
    ["@markup"] = { link = "Normal" }, -- For strings considerated text in a markup language.
    ["@markup.strong"] = { link = "MarkupStrong" }, -- bold
    ["@markup.italic"] = { link = "MarkupItalic" }, -- italic
    ["@markup.strikethrough"] = { link = "MarkupStrike" }, -- strikethrough text
    ["@markup.underline"] = { link = "MarkupUnderline" }, -- underlined text

    ["@markup.heading"] = { fg = C.Rainbow1 }, -- titles like: # Example

    ["@markup.math"] = { link = "MarkupMath" }, -- math environments (e.g. `$ ... $` in LaTeX)
    ["@markup.quote"] = { link = "MarkupQuote" }, -- block quotes
    ["@markup.environment"] = { link = "Special" }, -- text environments of markup languages
    ["@markup.environment.name"] = { link = "Special" }, -- text indicating the type of an environment

    ["@markup.link"] = { link = "Struct" }, -- text references, footnotes, citations, etc.
    ["@markup.link.label"] = { link = "Label" }, -- link, reference descriptions
    ["@markup.link.url"] = { link = "Url" }, -- urls, links and emails

    ["@markup.raw"] = { link = "DocString" }, -- used for inline code in markdown and for doc in python (""")

    ["@markup.list"] = { link = "Special" },
    ["@markup.list.checked"] = { link = "SuccessText" }, -- todo notes
    ["@markup.list.unchecked"] = { link = "Comment" }, -- todo notes

    -- Diff
    ["@diff.plus"] = { link = "diffAdded" }, -- added text (for diff files)
    ["@diff.minus"] = { link = "diffRemoved" }, -- deleted text (for diff files)
    ["@diff.delta"] = { link = "diffChanged" }, -- deleted text (for diff files)

    -- Tags
    ["@tag"] = { link = "HtmlTag" }, -- Tags like html tag names.
    ["@tag.tsx"] = { link = "ReactTag" }, -- Tags like html tag names.
    ["@tag.attribute"] = { link = "Attribute" }, -- Tags like html tag names.
    ["@tag.delimiter"] = { link = "TagDelimiter" }, -- Tag delimiter like < > /

    -- Misc
    ["@error"] = { link = "Error" },

    -- Language specific:
    -- bash
    ["@function.builtin.bash"] = {
      link = "Error",
    },

    -- markdown
    ["@markup.heading.1.markdown"] = { link = "rainbow1" },
    ["@markup.heading.2.markdown"] = { link = "rainbow2" },
    ["@markup.heading.3.markdown"] = { link = "rainbow3" },
    ["@markup.heading.4.markdown"] = { link = "rainbow4" },
    ["@markup.heading.5.markdown"] = { link = "rainbow5" },
    ["@markup.heading.6.markdown"] = { link = "rainbow6" },

    -- java
    ["@constant.java"] = { link = "Constant" },

    -- css
    ["@property.css"] = { link = "Property" },
    ["@property.id.css"] = { link = "CssId" },
    ["@property.class.css"] = { link = "CssClass" },
    ["@type.css"] = { link = "CssType" },
    ["@type.tag.css"] = { link = "CssTag" },
    ["@string.plain.css"] = { link = "CssValue" },
    ["@number.css"] = { link = "Number" },

    -- toml
    ["@property.toml"] = { link = "Function" }, -- Differentiates between string and properties

    -- json
    ["@label.json"] = { link = "Function" }, -- For labels: label: in C and :label: in Lua.

    -- lua
    ["@constructor.lua"] = { link = "Constructor" }, -- flamingo -- For constructor calls and definitions: = { } in Lua.

    -- typescript
    ["@property.typescript"] = { link = "Property" },
    ["@constructor.typescript"] = { link = "Constructor" },

    -- TSX (Typescript React)
    ["@constructor.tsx"] = { link = "Constructor" },
    ["@tag.attribute.tsx"] = { link = "Attribute" },

    -- yaml
    ["@variable.member.yaml"] = { link = "Function" }, -- For fields.

    -- Ruby
    ["@string.special.symbol.ruby"] = { link = "Identifier" },

    -- PHP
    ["@function.method.php"] = { link = "Function" },
    ["@function.method.call.php"] = { link = "Function" },

    -- C/CPP
    ["@type.builtin.c"] = { link = "Type" },
    ["@property.cpp"] = { link = "Property" },
    ["@type.builtin.cpp"] = { link = "BuiltinType" },

    -- gitcommit
    ["@comment.warning.gitcommit"] = { link = "WarningText" },

    -- gitignore
    ["@string.special.path.gitignore"] = { link = "Normal" },

    ["@lsp.type.boolean"] = { link = "@boolean" },
    ["@lsp.type.builtinType"] = { link = "@type.builtin" },
    ["@lsp.type.comment"] = { link = "@comment" },
    ["@lsp.type.enum"] = { link = "Enum" },
    ["@lsp.type.enumMember"] = { link = "@constant" },
    ["@lsp.type.escapeSequence"] = { link = "@string.escape" },
    ["@lsp.type.formatSpecifier"] = { link = "@punctuation.special" },
    ["@lsp.type.interface"] = { link = "Interface" },
    ["@lsp.type.keyword"] = { link = "@keyword" },
    ["@lsp.type.namespace"] = { link = "@module" },
    ["@lsp.type.number"] = { link = "@number" },
    ["@lsp.type.operator"] = { link = "@operator" },
    ["@lsp.type.parameter"] = { link = "@parameter" },
    ["@lsp.type.property"] = { link = "@property" },
    ["@lsp.type.selfKeyword"] = { link = "@variable.builtin" },
    ["@lsp.type.typeAlias"] = { link = "@type.definition" },
    ["@lsp.type.unresolvedReference"] = { link = "@error" },
    ["@lsp.type.variable"] = {}, -- use treesitter styles for regular variables
    ["@lsp.type.class"] = { link = "Class" },
    ["@lsp.typemod.class.defaultLibrary"] = { link = "@type.builtin" },
    ["@lsp.typemod.enum.defaultLibrary"] = { link = "@type.builtin" },
    ["@lsp.typemod.enumMember.defaultLibrary"] = { link = "@constant.builtin" },
    ["@lsp.typemod.function.defaultLibrary"] = { link = "@function.builtin" },
    ["@lsp.typemod.keyword.async"] = { link = "@keyword.coroutine" },
    ["@lsp.typemod.macro.defaultLibrary"] = { link = "@function.builtin" },
    ["@lsp.typemod.method.defaultLibrary"] = { link = "@function.builtin" },
    ["@lsp.typemod.operator.injected"] = { link = "@operator" },
    ["@lsp.typemod.string.injected"] = { link = "@string" },
    ["@lsp.typemod.type.defaultLibrary"] = { link = "@type.builtin" },
    ["@lsp.typemod.variable.defaultLibrary"] = { link = "@variable.builtin" },
    ["@lsp.typemod.variable.injected"] = { link = "@variable" },
  }

  groups["@parameter"] = groups["@variable.parameter"]
  groups["@field"] = groups["@variable.member"]
  groups["@namespace"] = groups["@module"]
  groups["@float"] = groups["@number.float"]
  groups["@symbol"] = groups["@string.special.symbol"]
  groups["@string.regex"] = groups["@string.regexp"]

  groups["@text"] = groups["@markup"]
  groups["@text.strong"] = groups["@markup.strong"]
  groups["@text.emphasis"] = groups["@markup.italic"]
  groups["@text.underline"] = groups["@markup.underline"]
  groups["@text.strike"] = groups["@markup.strikethrough"]
  groups["@text.uri"] = groups["@markup.link.url"]
  groups["@text.math"] = groups["@markup.math"]
  groups["@text.environment"] = groups["@markup.environment"]
  groups["@text.environment.name"] = groups["@markup.environment.name"]

  groups["@text.title"] = groups["@markup.heading"]
  groups["@text.literal"] = groups["@markup.raw"]
  groups["@text.reference"] = groups["@markup.link"]

  groups["@text.todo.checked"] = groups["@markup.list.checked"]
  groups["@text.todo.unchecked"] = groups["@markup.list.unchecked"]

  groups["@comment.note"] = groups["@comment.hint"]

  -- @text.todo is now for todo comments, not todo notes like in markdown
  groups["@text.todo"] = groups["@comment.todo"]
  groups["@text.warning"] = groups["@comment.warning"]
  groups["@text.note"] = groups["@comment.note"]
  groups["@text.danger"] = groups["@comment.error"]

  -- @text.uri is now
  -- > @markup.link.url in markup links
  -- > @string.special.url outside of markup
  groups["@text.uri"] = groups["@markup.link.uri"]

  groups["@method"] = groups["@function.method"]
  groups["@method.call"] = groups["@function.method.call"]

  groups["@text.diff.add"] = groups["@diff.plus"]
  groups["@text.diff.delete"] = groups["@diff.minus"]

  groups["@type.qualifier"] = groups["@keyword.modifier"]
  groups["@keyword.storage"] = groups["@keyword.modifier"]
  groups["@define"] = groups["@keyword.directive.define"]
  groups["@preproc"] = groups["@keyword.directive"]
  groups["@storageclass"] = groups["@keyword.storage"]
  groups["@conditional"] = groups["@keyword.conditional"]
  groups["@exception"] = groups["@keyword.exception"]
  groups["@include"] = groups["@keyword.import"]
  groups["@repeat"] = groups["@keyword.repeat"]

  groups["@symbol.ruby"] = groups["@string.special.symbol.ruby"]

  groups["@variable.member.yaml"] = groups["@field.yaml"]

  groups["@text.title.1.markdown"] = groups["@markup.heading.1.markdown"]
  groups["@text.title.2.markdown"] = groups["@markup.heading.2.markdown"]
  groups["@text.title.3.markdown"] = groups["@markup.heading.3.markdown"]
  groups["@text.title.4.markdown"] = groups["@markup.heading.4.markdown"]
  groups["@text.title.5.markdown"] = groups["@markup.heading.5.markdown"]
  groups["@text.title.6.markdown"] = groups["@markup.heading.6.markdown"]

  groups["@method.php"] = groups["@function.method.php"]
  groups["@method.call.php"] = groups["@function.method.call.php"]

  return groups
end
