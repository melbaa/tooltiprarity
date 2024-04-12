local tooltip = CreateFrame("Frame", "tooltiprarity", GameTooltip)

local rarity = {
    "poor",
    "common",
    "uncommon",
    "rare",
    "epic",
    "legendary",
    "artifact",
}


tooltip:SetScript("OnShow", function()
    if not GameTooltip.itemLink then return end

    local _, _, itemLink = string.find(GameTooltip.itemLink, "(item:%d+:%d+:%d+:%d+)");

    if not itemLink then
        return false
    end

    local itemName, _, itemRarity = GetItemInfo(itemLink)
    local raritytxt = 'unknown'
    if itemRarity ~= nil then
        raritytxt = rarity[itemRarity+1]
    end
    -- GameTooltip:AddLine("item is " .. raritytxt , 1, 1, 1)
    local textleft1=getglobal("GameTooltipTextLeft1");
    local textleft1txt = textleft1:GetText()
    textleft1:SetText(textleft1txt .. '   [' .. raritytxt .. ']')
end)
