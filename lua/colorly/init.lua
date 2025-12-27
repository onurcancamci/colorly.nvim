local dc = require("colorly.default-colors")
local dg = require("colorly.default-groups")
local resolve = require("colorly.utils.resolve")
local color_utils = require("colorly.utils.colors")

local M = {}

local default_opts = {
  colors_override = {},
  groups_override = function(C, opts, utils)
    return {}
  end,
  modified_colors = function(C, opts, utils)
    return {}
  end,
  use_syntax_colors_for_cmp_kinds = false,
}

local setup_opts = vim.tbl_deep_extend("force", default_opts, {})

function load_integrations()
  local modules = {}

  local glob = "lua/colorly/integration/*.lua"
  local match = "lua/colorly/integration/(.+)%.lua$"

  if vim.fn.has("win32") == 1 or vim.fn.has("win64") == 1 then
    glob = "lua\\colorly\\integration\\*.lua"
    match = "lua\\colorly\\integration\\(.+)%.lua$"
  end

  local files = vim.api.nvim_get_runtime_file(glob, true)

  for _, filepath in ipairs(files) do
    -- Extract module name
    local name = filepath:match(match)
    local modpath = "colorly.integration." .. name

    local ok, mod = pcall(require, modpath)
    if ok then
      modules[name] = mod
    else
      vim.notify(
        "integration load failed: " .. modpath .. "\n" .. mod,
        vim.log.levels.ERROR
      )
    end
  end

  return modules
end

function M.colorscheme(opts)
  -- order of operations here is quite important
  -- the purpose here is to get a good opts object combining colors from
  -- setup and current opts together
  -- this will be passed to the functions like modified_colors
  local combined_opts = vim.tbl_deep_extend("keep", opts, {
    use_syntax_colors_for_cmp_kinds = setup_opts.use_syntax_colors_for_cmp_kinds,
    colors_override = setup_opts.colors_override,
  }, default_opts)

  -- here we fill the opts with defaults so that there is no access to nil propery
  -- but we cant extend with setup opts because some it will contain functions
  opts = vim.tbl_deep_extend("force", default_opts, opts or {})

  if vim.version().minor < 8 then
    vim.notify(
      "Neovim 0.8+ is required for my-theme colorscheme",
      vim.log.levels.ERROR,
      { title = "Min Theme" }
    )
    return
  end

  vim.api.nvim_command("hi clear")
  if vim.fn.exists("syntax_on") then
    vim.api.nvim_command("syntax reset")
  end

  -- color overriding should go like this
  -- collect all the raw colors, these will be used for modified colors function
  -- if we dont collect all raw colors here, modified colors function will modifiy the wrong colors
  local colors_raw = vim.tbl_extend(
    "force",
    dc.colors,
    setup_opts.colors_override,
    opts.colors_override
  )
  local colors = resolve(colors_raw)

  local setup_modified_colors =
    setup_opts.modified_colors(colors, combined_opts, color_utils)
  local default_modified_colors =
    dc.modified_colors(colors, combined_opts, color_utils)

  local modified_colors = vim.tbl_extend(
    "force",
    default_modified_colors,
    setup_modified_colors,
    opts.modified_colors(colors, combined_opts, color_utils)
  )

  colors = vim.tbl_extend("force", colors, modified_colors)
  colors = resolve(colors)

  vim.g.VM_theme_set_by_colorscheme = true
  vim.o.background = color_utils.assert_brightness(colors.Bg1) and "light"
    or "dark"
  vim.o.termguicolors = true

  -- this is a hack to make lualine work
  -- lualine will load the "colorly" theme
  -- its hl groups are overridden here
  -- so users mode colors apply
  vim.g.colors_name = "colorly"

  local groups = {}
  local default_groups = dg(colors, combined_opts, color_utils)
  groups = vim.tbl_extend("force", groups, default_groups)

  local integration_modules = load_integrations()

  for mname, modulefn in pairs(integration_modules) do
    local int_groups = modulefn(colors, combined_opts, color_utils)
    groups = vim.tbl_extend("keep", groups, int_groups)
  end

  local setup_groups =
    setup_opts.groups_override(colors, combined_opts, color_utils)
  local opts_groups = opts.groups_override(colors, combined_opts, color_utils)

  -- opts > setup > default_groups > integrations
  groups = vim.tbl_extend("force", groups, setup_groups, opts_groups)

  for name, value in pairs(groups) do
    vim.api.nvim_set_hl(0, name, value)
  end
end

function M.setup(opts)
  setup_opts = vim.tbl_deep_extend("force", default_opts, opts or {})
end

return M
