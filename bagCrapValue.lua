local goldCoinIcon = "|TInterface\\MONEYFRAME\\UI-GoldIcon:12:12:0:0:64:64:4:60:4:60|t"
local silverCoinIcon = "|TInterface\\MONEYFRAME\\UI-SilverIcon:12:12:0:0:64:64:4:60:4:60|t"
local copperCoinIcon = "|TInterface\\MONEYFRAME\\UI-CopperIcon:12:12:0:0:64:64:4:60:4:60|t"

local function calculateCrapValue()
    local totalGreysValue = 0
    for bagNumber = 0, 5, 1 do
        local slotsCount = GetContainerNumSlots(bagNumber);
        for slotNumber = 1, slotsCount+1, 1 do
            local itemId = GetContainerItemID(bagNumber, slotNumber);
            if (itemId ~= nil) then
                itemName, itemLink, itemRarity, itemLevel, itemMinLevel, itemType, itemSubType, itemStackCount, itemEquipLoc, itemTexture, itemSellPrice = GetItemInfo(itemId)
                texture, itemCount, locked, quality, readable, lootable, itemLink = GetContainerItemInfo(bagNumber, slotNumber);
                if (quality == 0) then
                    totalGreysValue = totalGreysValue + (itemCount*itemSellPrice)
                end
            end
        end
    end

    if (totalGreysValue > 0) then
        local goldValue = math.floor(totalGreysValue/10000);
        local silverValue = math.floor((totalGreysValue-(goldValue*10000))/100);
        local copperValue = totalGreysValue-(silverValue*100)-(goldValue*10000);

        local goldString = ""
        if (goldValue > 0) then goldString = goldValue..goldCoinIcon end
        local silverString = ""
        if (silverValue > 0) then silverString = silverValue..silverCoinIcon end
        local copperString = "" 
        if (copperValue > 0) then copperString = copperValue..copperCoinIcon end

        return "Crap: "..goldString.." "..silverString.." "..copperString
    end
    return "Crap: 0"..copperCoinIcon
end

local bagCrapValueBackground = CreateFrame("Frame", "SellCrap_BagCrapValueBackground", ContainerFrame1);
bagCrapValueBackground:SetSize(135, 32);
bagCrapValueBackground:SetPoint("TOP", 18, -29);
bagCrapValueBackground:SetFrameStrata("HIGH");
bagCrapValueBackground:SetBackdrop({
    bgFile   = "Interface\\MONEYFRAME\\UI-MONEYFRAME-BORDER"
});
bagCrapValueBackground:Hide();

bagCrapValueBackground.crapValue = CreateFrame("SimpleHTML", "SellCrap_BagCrapValue", SellCrap_BagCrapValueBackground);
bagCrapValueBackground.crapValue:SetSize(125, 30);
bagCrapValueBackground.crapValue:SetText(calculateCrapValue());
bagCrapValueBackground.crapValue:SetFont('Fonts\\FRIZQT__.TTF', 10);
bagCrapValueBackground.crapValue:SetPoint("LEFT", 5, -3);

local bagEventFrame = CreateFrame("Frame");
bagEventFrame:RegisterEvent("BAG_UPDATE")
bagEventFrame:SetScript("OnEvent", function()
        if (SELLCRAPVARS.showBagCrapValueCheckboxState) then
            bagCrapValueBackground.crapValue:SetText(calculateCrapValue());
            bagCrapValueBackground:Show();
        end
    end
)

-- public
function SELLCRAP:showBagCrapValue(showBagCrapValue) 
    if (showBagCrapValue) then
        bagCrapValueBackground:Show();
    else
        bagCrapValueBackground:Hide();
    end
end