-- Modified version of https://github.com/navarasu/onedark.nvim (Darker)
local color_utils = require("colorly.utils.colors")

local colors_override = {

  Text = "#a0a8b7", -- text
  TextDim2 = "#7a818e", -- comments

  Bg1 = "#1f2329", -- normal bg
  Bg2 = "#282c34", -- lualine, tabline
  Bg3 = "#30363f", -- inactive tab bg,
  Bg4 = "#323641", --  lualine fg

  Alpha = "#4fa6ed",
  Beta = "#48b0bd",

  Gamma = "#e55561",
  Delta = "Gamma",

  Epsilon = "#e2b86b",
  Zeta = "#cc9057",

  Eta = "#8ebd6b",
  Theta = "Beta",

  Iota = "#bf68d9",
  Kappa = "Iota",

  Lambda = "#61afef",
  Mu = "#e5c07b",

  AltText = "Mu",

  -- Standard colors
  Black = "#0e1013",

  -- Misc
  Accent1 = "Blue",
  Accent2 = "Iota",
  MatchParen = "Zeta",
}

require("colorly").colorscheme {
  colors_override = colors_override,
}
