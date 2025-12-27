function starts_with(str, start)
  return string.sub(str, 1, #start) == start
end

function shallow_copy(tbl)
  local copy = {}
  for k, v in pairs(tbl) do
    copy[k] = v
  end
  return copy
end

return function(colors)
  colors = shallow_copy(colors)
  local out = {}

  while next(colors) do
    local didProcess = false
    for key, value in pairs(colors) do
      if starts_with(value, "#") then
        out[key] = value
        colors[key] = nil
        didProcess = true
      elseif out[value] then
        out[key] = out[value]
        colors[key] = nil
        didProcess = true
      end
    end

    if not didProcess then
      for key, value in pairs(colors) do
        out[key] = out.error or colors.error
        colors[key] = nil
      end
    end
  end

  return out
end
