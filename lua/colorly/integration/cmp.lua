return function(C, opts)
  local groups = {

    CmpLabelMatch = { link = "Normal" },
    CmpLabelDeprecated = { link = "Deprecated" },

    BlinkCmpLabelMatch = { fg = C.Text }, -- unfortunate hack, link doesn't work
    -- BlinkCmpLabelMatch = { link = "CmpLabelMatch" },

    BlinkCmpLabelDeprecated = { link = "CmpLabelDeprecated" },
    BlinkCmpKindText = { link = "KindText" },
    BlinkCmpKindField = { link = "KindField" },
    BlinkCmpKindUnit = { link = "KindUnit" },
    BlinkCmpKindMethod = { link = "KindMethod" },
    BlinkCmpKindFunction = { link = "KindFunction" },
    BlinkCmpKindConstructor = { link = "KindConstructor" },
    BlinkCmpKindModule = { link = "KindModule" },
    BlinkCmpKindProperty = { link = "KindProperty" },
    BlinkCmpKindFile = { link = "KindFile" },
    BlinkCmpKindFolder = { link = "KindFolder" },
    BlinkCmpKindStruct = { link = "KindStruct" },
    BlinkCmpKindEvent = { link = "KindEvent" },
    BlinkCmpKindSnippet = { link = "KindSnippet" },
    BlinkCmpKindVariable = { link = "KindVariable" },
    BlinkCmpKindClass = { link = "KindClass" },
    BlinkCmpKindInterface = { link = "KindInterface" },
    BlinkCmpKindEnum = { link = "KindEnum" },
    BlinkCmpKindValue = { link = "KindValue" },
    BlinkCmpKindConstant = { link = "KindConstant" },
    BlinkCmpKindKeyword = { link = "KindKeyword" },
    BlinkCmpKindColor = { link = "KindColor" },
    BlinkCmpKindReference = { link = "KindReference" },
    BlinkCmpKindEnumMember = { link = "KindEnumMember" },
    BlinkCmpKindCopilot = { link = "KindCopilot" },
    BlinkCmpKindOperator = { link = "KindOperator" },
    BlinkCmpKindTypeParameter = { link = "KindTypeParameter" },

    CmpItemAbbrDeprecated = { link = "CmpLabelDeprecated" },
    CmpItemAbbrMatch = { link = "CmpLabelMatch" },
    CmpItemAbbrMatchFuzzy = { link = "CmpLabelMatch" },
    CmpItemKindSnippet = { link = "KindSnippet" },
    CmpItemKindKeyword = { link = "KindKeyword" },
    CmpItemKindText = { link = "KindText" },
    CmpItemKindMethod = { link = "KindMethod" },
    CmpItemKindConstructor = { link = "KindConstructor" },
    CmpItemKindFunction = { link = "KindFunction" },
    CmpItemKindFolder = { link = "KindFolder" },
    CmpItemKindModule = { link = "KindModule" },
    CmpItemKindConstant = { link = "KindConstant" },
    CmpItemKindField = { link = "KindField" },
    CmpItemKindProperty = { link = "KindProperty" },
    CmpItemKindEnum = { link = "KindEnum" },
    CmpItemKindUnit = { link = "KindUnit" },
    CmpItemKindClass = { link = "KindClass" },
    CmpItemKindVariable = { link = "KindVariable" },
    CmpItemKindFile = { link = "KindFile" },
    CmpItemKindInterface = { link = "KindInterface" },
    CmpItemKindColor = { link = "KindColor" },
    CmpItemKindReference = { link = "KindReference" },
    CmpItemKindEnumMember = { link = "KindEnumMember" },
    CmpItemKindStruct = { link = "KindStruct" },
    CmpItemKindValue = { link = "KindValue" },
    CmpItemKindEvent = { link = "KindEvent" },
    CmpItemKindOperator = { link = "KindOperator" },
    CmpItemKindTypeParameter = { link = "KindTypeParameter" },
    CmpItemKindCopilot = { link = "KindCopilot" },
  }

  local kinds = {}
  if opts.use_syntax_colors_for_cmp_kinds then
    kinds = {
      KindText = { link = "Normal" },
      KindField = { link = "@field" },
      KindUnit = { link = "Special" },

      KindMethod = { link = "Function" },
      KindFunction = { link = "Function" },
      KindConstructor = { link = "Constructor" },
      KindModule = { link = "Module" },
      KindProperty = { link = "Property" },
      KindFile = { link = "Files" },
      KindFolder = { link = "Files" },
      KindStruct = { link = "Struct" },
      KindEvent = { link = "Function" },

      KindSnippet = { link = "Macro" },
      KindVariable = { link = "Variable" },

      KindClass = { link = "Class" },
      KindInterface = { link = "Interface" },
      KindEnum = { link = "Enum" },

      KindValue = { link = "Primitive" },
      KindConstant = { link = "Constant" },
      KindKeyword = { link = "Keyword" },
      KindColor = { link = "Special" },
      KindReference = { link = "Struct" },
      KindEnumMember = { link = "Enum" },
      KindCopilot = { link = "Special" },
      KindOperator = { link = "Operator" },
      KindTypeParameter = { link = "Parameter" },
    }
  else
    kinds = {
      KindText = { fg = C.Green },
      KindField = { fg = C.Green },
      KindUnit = { fg = C.Green },

      KindMethod = { fg = C.Blue },
      KindFunction = { fg = C.Blue },
      KindConstructor = { fg = C.Blue },
      KindModule = { fg = C.Blue },
      KindProperty = { fg = C.Blue },
      KindFile = { fg = C.Blue },
      KindFolder = { fg = C.Blue },
      KindStruct = { fg = C.Blue },
      KindEvent = { fg = C.Blue },

      KindSnippet = { fg = C.AltText },
      KindVariable = { fg = C.AltText },

      KindClass = { fg = C.Yellow },
      KindInterface = { fg = C.Yellow },
      KindEnum = { fg = C.Yellow },

      KindValue = { fg = C.Orange },
      KindConstant = { fg = C.Orange },
      KindKeyword = { fg = C.Red },
      KindColor = { fg = C.Red },
      KindReference = { fg = C.Red },
      KindEnumMember = { fg = C.Cyan },
      KindCopilot = { fg = C.Cyan },
      KindOperator = { fg = C.Blue },
      KindTypeParameter = { fg = C.REd },
    }
  end

  groups = vim.tbl_extend("force", groups, kinds)

  return groups
end
