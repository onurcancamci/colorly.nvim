local color_utils = require("colorly.utils.colors")
-- Colors are just our base colors

---@type table<string, string>
local C = {
  Text = "#C1C9E6", -- text
  TextDim1 = "#A3AAC2", -- slightly dim text (properies)
  TextDim2 = "#7D8296", -- comments

  Bg1 = "#0b0b12", -- normal bg
  Bg2 = "#10111a", -- lualine, tabline
  Bg3 = "#171a26", -- inactive tab bg,
  Bg4 = "#2F313D", -- visual selection, lualine fg

  Alpha = "#00BFFF",
  Beta = "#00BBCC",

  Gamma = "#ff8696",
  Delta = "#E66767",

  Epsilon = "#fbc773",
  Zeta = "#ffb454",

  Eta = "#70CF67",
  Theta = "#4CD4BD",

  Iota = "#d2a6ff",
  Kappa = "#AD6FF7",

  Lambda = "#61BDFF",
  Mu = "#F5B8AB",

  AltText = "Mu",

  -- Standard colors
  Black = "Bg1",
  White = "Text",
  Red = "Delta",
  Green = "Eta",
  Yellow = "Epsilon",
  Blue = "Alpha",
  Magenta = "Kappa",
  Pink = "Iota",
  Cyan = "Beta",
  LightBlue = "Lambda",

  -- Addditional Colors
  Teal = "Theta",
  Orange = "Zeta",

  -- Contextual Colors
  Error = "Red",
  Warning = "Yellow",
  Success = "Green",
  Hint = "Teal",
  Info = "Blue",
  Todo = "Mu",
  Trace = "Mu",

  -- Modes
  ModeNormal = "Blue",
  ModeInsert = "Green",
  ModeVisual = "Magenta",
  ModeReplace = "Red",
  ModeCommand = "Orange",
  ModeTerminal = "Red",

  -- VCS
  VcsAdded = "Green",
  VcsIgnored = "TextDim1",
  VcsModified = "Yellow",
  VcsDeleted = "Red",
  VcsUntracked = "Magenta",
  VcsRenamed = "Magenta",
  VcsOther = "Iota",

  -- Misc
  Files = "Blue", -- file and folder color for file browsers
  Accent1 = "Blue",
  Accent2 = "Red",
  MatchParen = "Zeta",

  -- Rainbow
  Rainbow1 = "Delta",
  Rainbow2 = "Eta",
  Rainbow3 = "Theta",
  Rainbow4 = "Lambda",
  Rainbow5 = "Iota",
  Rainbow6 = "Mu",
  Rainbow7 = "Gamma",
  Rainbow8 = "Epsilon",
  Rainbow9 = "Epsilon",
}

local function modified_colors(C, opts)
  return {
    SearchBg = color_utils.darken(C.Lambda, 0.30, C.Bg1),
    VcsAddedBg = color_utils.darken(C.VcsAdded, 0.18, C.Bg1),
    VcsModifiedBg = color_utils.darken(C.VcsModified, 0.07, C.Bg1),
    VcsDeletedBg = color_utils.darken(C.VcsDeleted, 0.18, C.Bg1),
    VcsDiffTextBg = color_utils.darken(C.Info, 0.30, C.Bg1),

    IlluminateBg = color_utils.darken(C.Bg4, 0.7, C.Bg1),
  }
end

return { colors = C, modified_colors = modified_colors }
