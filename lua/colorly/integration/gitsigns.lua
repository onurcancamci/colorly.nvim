return function(C)
  return {
    MiniDiffSignAdd = { link = "VcsAdded" },
    MiniDiffSignChange = { link = "VcsModified" },
    MiniDiffSignDelete = { link = "VcsDeleted" },

    GitSignsAdd = { link = "VcsAdded" },
    GitSignsChange = { link = "VcsModified" }, -- diff mode: Changed line |diff.txt|
    GitSignsDelete = { link = "VcsDeleted" }, -- diff mode: Deleted line |diff.txt|

    GitSignsCurrentLineBlame = { link = "InlayHint" },

    GitSignsAddPreview = { link = "DiffAdd" },
    GitSignsDeletePreview = { link = "DiffDelete" },

    GitSignsAddInline = { link = "VcsAddedBg" },
    GitSignsChangeInline = {
      link = "VcsModifiedBg",
    },
    GitSignsDeleteInline = {
      link = "VcsDeletedBg",
    },
  }
end
