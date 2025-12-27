local color_utils = require("colorly.utils.colors")

return function(C)
  local groups = {
    RenderMarkdownCode = {},
    RenderMarkdownCodeInline = {},
    RenderMarkdownBullet = { link = "Operator" },
    RenderMarkdownTableHead = { link = "Function" },
    RenderMarkdownTableRow = { link = "AltFunction" },
    RenderMarkdownSuccess = { link = "SuccessText" },
    RenderMarkdownInfo = { link = "InfoText" },
    RenderMarkdownHint = { link = "HintText" },
    RenderMarkdownWarn = { link = "WarningText" },
    RenderMarkdownError = { link = "ErrorText" },
  }

  for i = 1, 6 do
    groups["RenderMarkdownH" .. i] = { fg = C["Rainbow" .. i] }
    groups["RenderMarkdownH" .. i .. "Bg"] = {
      bg = color_utils.darken(C["Rainbow" .. i], 0.095, C.Bg1),
    }
  end

  return groups
end
