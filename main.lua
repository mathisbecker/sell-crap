function SELLCRAP:printSellValue(copperValue)
    if (copperValue > 0) then
        goldCoinIcon = "|TInterface\\Icons\\INV_Misc_Coin_01:12:12:0:0:64:64:4:60:4:60|t"
        silverCoinIcon = "|TInterface\\Icons\\INV_Misc_Coin_03:12:12:0:0:64:64:4:60:4:60|t"
        copperCoinIcon = "|TInterface\\Icons\\INV_Misc_Coin_05:12:12:0:0:64:64:4:60:4:60|t"

        local goldValue = math.floor(copperValue/10000);
        local silverValue = math.floor(copperValue/100-(goldValue*10000));
        local copperValue = math.floor(copperValue-(goldValue*10000)-(silverValue*100));

        local goldString = ""
        if (goldValue > 0) then goldString = goldValue..goldCoinIcon end
        local silverString = ""
        if (silverValue > 0) then silverString = silverValue..silverCoinIcon end
        local copperString = "" 
        if (copperValue > 0) then copperString = copperValue..copperCoinIcon end

        print("Selling crap for a total of "..goldString..silverString..copperString)
    end
end

function SELLCRAP:sellCrap()
    local totalGreysValue = 0
    for bagNumber = 0, 5, 1 do
        local slotsCount = GetContainerNumSlots(bagNumber);
        for slotNumber = 1, slotsCount+1, 1 do
            local itemId = GetContainerItemID(bagNumber, slotNumber);
            if (itemId ~= nil) then
                itemName, itemLink, itemRarity, itemLevel, itemMinLevel, itemType, itemSubType, itemStackCount, itemEquipLoc, itemTexture, itemSellPrice = GetItemInfo(itemId)
                texture, itemCount, locked, quality, readable, lootable, itemLink = GetContainerItemInfo(bagNumber, slotNumber);
                if (quality == 0) then
                    UseContainerItem(bagNumber, slotNumber);
                    totalGreysValue = totalGreysValue + (itemCount*itemSellPrice)
                end
            end
        end
    end
    SELLCRAP:printSellValue(totalGreysValue)
end


local sellCrapButton = CreateFrame("Button", nil, MerchantFrame)
sellCrapButton:SetPoint("TOP", MerchantFrame, "CENTER", 0, 195)
sellCrapButton:SetWidth(100)
sellCrapButton:SetHeight(30)

sellCrapButton:SetText("Sell Crap")
sellCrapButton:SetNormalFontObject("GameFontNormal")

local normalTexture = sellCrapButton:CreateTexture()
normalTexture:SetTexture("Interface/Buttons/UI-Panel-Button-Up")
normalTexture:SetTexCoord(0, 0.625, 0, 0.6875)
normalTexture:SetAllPoints()	
sellCrapButton:SetNormalTexture(normalTexture)

local highlightTexture = sellCrapButton:CreateTexture()
highlightTexture:SetTexture("Interface/Buttons/UI-Panel-Button-Highlight")
highlightTexture:SetTexCoord(0, 0.625, 0, 0.6875)
highlightTexture:SetAllPoints()
sellCrapButton:SetHighlightTexture(highlightTexture)

local pushedTexture = sellCrapButton:CreateTexture()
pushedTexture:SetTexture("Interface/Buttons/UI-Panel-Button-Down")
pushedTexture:SetTexCoord(0, 0.625, 0, 0.6875)
pushedTexture:SetAllPoints()
sellCrapButton:SetPushedTexture(pushedTexture)

sellCrapButton:SetScript("OnClick", function()
    SELLCRAP:sellCrap()
end)

local eventFrame = CreateFrame("Frame");
eventFrame:RegisterEvent("MERCHANT_SHOW")
eventFrame:SetScript("OnEvent", 
    function()
        if (AUTOSELLCHECKBOXSTATE) then
            print("auto")
            SELLCRAP:sellCrap()
        end
    end
)