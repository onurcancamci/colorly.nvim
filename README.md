# colorly.nvim
A color scheme creation utility with bundled themes for Neovim
Currently, work in progress.

## What is colorly.nvim
It is a Neovim plugin for adopting different colors 

This plugin exists to solve a single problem. If you have ever seen a color scheme, liked its colors. But you are very used to some things being specific colors. For example, functions being blue, strings being green, etc. And you tried to modify the color scheme by swapping colors. But then your error messages became something other than red. 

With this plugin, you can configure a small subset of highlight groups, assign your desired colors, and enjoy your theme with good integrations.

## How it works
The plugin works in stages. First, colors are determined. Second, highlight groups are assigned.

### How colors are determined
This is an unconventional way, but it starts with some abstract color names. Currently, it has 12 colors by default. You may add or remove as much as you like. If you do, you would need to override some highlight groups. I tried to make this process as easy as possible.

Currently, abstract colors look like this
```lua
local abstract_colors = {
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
}
```

One important note is, colors can refer to other colors. At the final stage, colors are resolved recursively and then assigned to hl groups.

These abstract color names would correspond to your concepts in the color scheme. In the default config, for example, Alpha color usually refers to functions.

Next, there are derived colors. I will put some snippets here, but refer to the default-colors.lua file for the rest.

These are for plugins that require certain colors.
```lua
local derived_colors = {
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
}
```

These are used for git signs, neogit, diffview, etc.
```lua
local derived_colors = {
  -- VCS
  VcsAdded = "Green",
  VcsIgnored = "TextDim1",
  VcsModified = "Yellow",
  VcsDeleted = "Red",
  VcsUntracked = "Magenta",
  VcsRenamed = "Magenta",
  VcsOther = "Iota",
}
```

These are used for diagnostics, notify plugins, todo comment plugins, etc.
```lua
local derived_colors = {
  -- Contextual Colors
  Error = "Red",
  Warning = "Yellow",
  Success = "Green",
  Hint = "Teal",
  Info = "Blue",
  Todo = "Mu",
  Trace = "Mu",
}
```

When you are making a colorsceheme, you dont need to provide the whole list. You would just need to provide the overrides. The plugin will merge them with the defaults.

Lastly, there is also a way to create colors programmatically. It looks like this.
```lua
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
```

### Assigning highlight groups
Work in progress

## Example configs
Work in progress

## Roadmap
- Better readme and a step-by-step guide for adopting a color scheme
- Example color schemes ported to this plugin
  - Adjust highlight groups to be more robust and concise

## Credits and inspirations

### catppuccin
I had used and modified [catppuccin](https://github.com/catppuccin/nvim) for a long time. Most of the integrations are taken from catppuccin's neovim theme. For this plugin to work, I needed to modify every highlight group to be a link. But most integrations still have comments from catppuccin.

Also, I have taken its color utility functions as well. 

### Color schemes used here

- [tokyodark.nvim](https://github.com/tiagovla/tokyodark.nvim)
- [onedark.nvim](https://github.com/navarasu/onedark.nvim)
