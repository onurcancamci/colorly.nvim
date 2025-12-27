return function(C)
  return {
    LualineNormalA = { bg = C.ModeNormal, fg = C.Bg2 },
    LualineNormalB = { bg = C.Bg4, fg = C.ModeNormal },
    LualineNormalC = { link = "StatusLine" },

    LualineInsertA = { bg = C.ModeInsert, fg = C.Bg2 },
    LualineInsertB = { bg = C.Bg4, fg = C.ModeInsert },
    LualineInsertC = { link = "LualineNormalC" },

    LualineTerminalA = { bg = C.ModeTerminal, fg = C.Bg2 },
    LualineTerminalB = { bg = C.Bg4, fg = C.ModeTerminal },
    LualineTerminalC = { link = "LualineNormalC" },

    LualineCommandA = { bg = C.ModeCommand, fg = C.Bg2 },
    LualineCommandB = { bg = C.Bg4, fg = C.ModeCommand },
    LualineCommandC = { link = "LualineNormalC" },

    LualineVisualA = { bg = C.ModeVisual, fg = C.Bg2 },
    LualineVisualB = { bg = C.Bg4, fg = C.ModeVisual },
    LualineVisualC = { link = "LualineNormalC" },

    LualineReplaceA = { bg = C.ModeReplace, fg = C.Bg2 },
    LualineReplaceB = { bg = C.Bg4, fg = C.ModeReplace },
    LualineReplaceC = { link = "LualineNormalC" },

    LualineInactiveA = { link = "StatusLineNC" },
    LualineInactiveB = { link = "StatusLineNC" },
    LualineInactiveC = { link = "StatusLineNC" },
  }
end
