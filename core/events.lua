local EventFrame = CreateFrame("Frame")
local handlers = {}

function UngweUI:RegisterEvent(event, callback)
  if not handlers[event] then
    handlers[event] = {}
    EventFrame:RegisterEvent(event)
  end
  table.insert(handlers[event], callback)
end

EventFrame:SetScript("OnEvent", function(self, event, arg1, arg2, arg3)
  if handlers[event] then
    for _, callback in ipairs(handlers[event]) do
      callback(arg1, arg2, arg3)
    end
  end
end)
