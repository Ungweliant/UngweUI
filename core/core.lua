UngweUI = {}

UngweUI.debug = false  -- Debug standardmäßig aus

function UngweUI:Debug(...)
  if self.debug then
    local msg = "[UngweUI Debug] "
    for i = 1, select("#", ...) do
      msg = msg .. tostring(select(i, ...)) .. " "
    end
    DEFAULT_CHAT_FRAME:AddMessage(msg, 0.6, 0.8, 1.0)
  end
end


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

-- Starte Module nach Login
local f = CreateFrame("Frame")
f:RegisterEvent("PLAYER_LOGIN")
f:SetScript("OnEvent", function()
  print("UngweUI geladen.")
  UngweUI:InitializeModules()
end)


SLASH_UNGWEUI = "/ungweui"
SlashCmdList["UNGWEUI"] = function(msg)
  local command = string.lower(msg)

  if command == "debug" then
    UngweUI.debug = not UngweUI.debug
    print("UngweUI Debugmodus: " .. (UngweUI.debug and "Aktiviert" or "Deaktiviert"))
  else
    print("UngweUI Befehle:")
    print("/ungeui debug - Debugmodus ein/aus")
  end
end
