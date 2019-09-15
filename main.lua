function sellCrap()
    for bagNumber = 0, 5, 1 do
        local slotsCount = GetContainerNumSlots(bagNumber);
        for slotNumber = 1, slotsCount+1, 1 do
            local rawItemLink = GetContainerItemLink(bagNumber, slotNumber);
            if (rawItemLink ~= nil) then
                local itemString = string.match(rawItemLink, "item[%-?%d:]+")
                itemName, itemLink, itemRarity, itemLevel, itemMinLevel, itemType, itemSubType, itemStackCount, itemEquipLoc, itemTexture, itemSellPrice = GetItemInfo(itemString);
                if (itemRarity == 0) then
                    UseContainerItem(bagNumber, slotNumber);
                end
            end
        end
    end
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
    sellCrap()
end)