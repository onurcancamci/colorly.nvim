return function(C)
  return {
    diffAdded = { link = "VcsAdded" },
    diffRemoved = { link = "VcsDeleted" },
    diffChanged = { link = "VcsModified" },
    diffOldFile = { link = "VcsModified" },
    diffNewFile = { link = "VcsUntracked" },
    diffFile = { link = "Files" }, -- maybe accent?
    diffLine = { link = "Comment" },
    diffIndexLine = { link = "Accent1" }, -- used to be "teal"

    DiffAdd = { link = "VcsAddedBg" }, -- diff mode: Added line |diff.txt|
    DiffChange = { link = "VcsModifiedBg" }, -- diff mode: Changed line |diff.txt|
    DiffDelete = { link = "VcsDeletedBg" }, -- diff mode: Deleted line |diff.txt|
    DiffText = { link = "VcsDiffTextBg" }, -- diff mode: Changed text within a changed line |diff.txt|
  }
end
