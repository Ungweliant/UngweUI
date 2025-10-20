UngweUI = UngweUI or {}
UngweUI.modules = {}
UngweUI.registered = {}

function UngweUI:RegisterModule(name, initFunc)
  if not self.modules[name] then
    self.modules[name] = {
      init = initFunc,
      enabled = true,
    }
    table.insert(self.registered, name)
  end
end

function UngweUI:InitializeModules()
  for _, name in ipairs(self.registered) do
    local mod = self.modules[name]
    if mod.enabled and type(mod.init) == "function" then
      mod.init()
    end
  end
end

local f = CreateFrame("Frame")
f:RegisterEvent("PLAYER_LOGIN")
f:SetScript("OnEvent", function()
  print("UngweUI geladen.")
  UngweUI:InitializeModules()
end)
