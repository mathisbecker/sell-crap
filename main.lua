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

local htex = sellCrapButton:CreateTexture()
htex:SetTexture("Interface/Buttons/UI-Panel-Button-Highlight")
htex:SetTexCoord(0, 0.625, 0, 0.6875)
htex:SetAllPoints()
sellCrapButton:SetHighlightTexture(htex)

local ptex = sellCrapButton:CreateTexture()
ptex:SetTexture("Interface/Buttons/UI-Panel-Button-Down")
ptex:SetTexCoord(0, 0.625, 0, 0.6875)
ptex:SetAllPoints()
sellCrapButton:SetPushedTexture(ptex)

sellCrapButton:SetScript("OnClick", function()
    sellCrap()
end)