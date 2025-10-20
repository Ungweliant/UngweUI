Ungwe = {}
Ungwe.name = "UngweUI"

local frame = CreateFrame("Frame")
frame:RegisterEvent("ADDON_LOADED")
frame:SetScript("OnEvent", function(_, event, arg1)
  if arg1 == "UngweUI" then
    print("UngweUI geladen!")
  end
end)
