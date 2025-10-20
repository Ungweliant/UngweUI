UngweUI:RegisterModule("UnitFrames", function()
  local f = CreateFrame("Frame", "UngweUIPlayerFrame", UIParent)
  f:SetSize(200, 40)
  f:SetPoint("CENTER", 0, -150)
  
  local bg = f:CreateTexture(nil, "BACKGROUND")
  bg:SetAllPoints(true)
  bg:SetColorTexture(0.1, 0.1, 0.1, 0.8)

  local text = f:CreateFontString(nil, "OVERLAY", "GameFontNormal")
  text:SetPoint("CENTER", f)
  text:SetText("UngweUI PlayerFrame")

  -- Beispiel: HP-Anzeige aktualisieren
  local function UpdateHealth()
    local hp = UnitHealth("player")
    local maxHp = UnitHealthMax("player")
    text:SetText("HP: " .. hp .. " / " .. maxHp)
  end

  -- Update beim Spieler-Health-Event
  UngweUI:RegisterEvent("UNIT_HEALTH", function(unit)
    if unit == "player" then
      UpdateHealth()
    end
  end)

  -- Initiales Update
  UpdateHealth()
end)
