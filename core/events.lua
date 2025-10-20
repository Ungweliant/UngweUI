local EventFrame = CreateFrame("Frame")
local handlers = {}

EventFrame:SetScript("OnEvent", function(_, event, ...)
  UngweUI:Debug("Event empfangen:", event)

  if handlers[event] then
    for _, callback in ipairs(handlers[event]) do
      callback(...)
    end
  end
end)


EventFrame:SetScript("OnEvent", function(_, event, ...)
  if handlers[event] then
    for _, callback in ipairs(handlers[event]) do
      callback(...)
    end
  end
end)
