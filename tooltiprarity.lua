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
    GameTooltip:AddLine("item is " .. rarity[itemRarity], 1, 1, 1)
end)