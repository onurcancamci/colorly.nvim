local colors_override = {

  Text = "#A0A8CD", -- text
  TextDim1 = "#838AAA",
  TextDim2 = "#5e666f", -- comments

  Bg1 = "#11121D", -- normal bg
  Bg2 = "#1A1B2A", -- lualine, tabline
  Bg3 = "#212234", -- inactive tab bg,
  Bg4 = "#353945", --  lualine fg, visual selection

  Alpha = "#7199EE",
  Beta = "#38A89D",

  Gamma = "#EE6D85",
  Delta = "#dd4a6c",

  Epsilon = "#D7A65F",
  Zeta = "#F6955B",

  Eta = "#95C561",
  Theta = "Beta",

  Iota = "#A485DD",
  Kappa = "#cd7fd1",

  Lambda = "#7badee",
  Mu = "#ca978c",

  AltText = "Mu",

  -- Standard colors
  Black = "#06080A",
  Red = "Gamma",

  -- Misc
  Accent1 = "Blue",
  Accent2 = "Red",
  MatchParen = "Zeta",

  Magenta = "Iota",
  Pink = "Kappa",
}

local groups_override = function(C)
  return {}
end

local function modified_colors(C)
  return {}
end

require("colorly").colorscheme {
  colors_override = colors_override,
  groups_override = groups_override,
  modified_colors = modified_colors,
}
