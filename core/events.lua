local EventFrame = CreateFrame("Frame")
local handlers = {}

function UngweUI:RegisterEvent(event, callback)
  if not handlers[event] then
    handlers[event] = {}
    EventFrame:RegisterEvent(event)
  end
  table.insert(handlers[event], callback)
end

EventFrame:SetScript("OnEvent", function(_, event, ...)
  if handlers[event] then
    for _, callback in ipairs(handlers[event]) do
      callback(...)
    end
  end
end)
