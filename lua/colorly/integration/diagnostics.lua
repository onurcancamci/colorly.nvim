return function(C)
  return {
    DiagnosticError = { link = "ErrorText" },
    DiagnosticWarn = {
      link = "WarningText",
    },
    DiagnosticInfo = {
      link = "InfoText",
    },
    DiagnosticHint = { link = "HintText" },
    DiagnosticOk = { link = "SuccessText" },

    DiagnosticUnderlineError = { underline = true, sp = C.Error },
    DiagnosticUnderlineWarn = { underline = true, sp = C.Warning },
    DiagnosticUnderlineInfo = { underline = true, sp = C.Info },
    DiagnosticUnderlineHint = { underline = true, sp = C.Hint },
    DiagnosticUnderlineOk = { underline = true, sp = C.Success },

    LspInlayHint = { link = "InlayHint" }, -- virtual text of the inlay hints
  }
end
