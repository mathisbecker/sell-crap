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


local button = CreateFrame("Button", nil, MerchantFrame)
button:SetPoint("TOP", MerchantFrame, "CENTER", 0, 195)
button:SetWidth(100)
button:SetHeight(30)

button:SetText("Sell Crap")
button:SetNormalFontObject("GameFontNormal")

local ntex = button:CreateTexture()
ntex:SetTexture("Interface/Buttons/UI-Panel-Button-Up")
ntex:SetTexCoord(0, 0.625, 0, 0.6875)
ntex:SetAllPoints()	
button:SetNormalTexture(ntex)

local htex = button:CreateTexture()
htex:SetTexture("Interface/Buttons/UI-Panel-Button-Highlight")
htex:SetTexCoord(0, 0.625, 0, 0.6875)
htex:SetAllPoints()
button:SetHighlightTexture(htex)

local ptex = button:CreateTexture()
ptex:SetTexture("Interface/Buttons/UI-Panel-Button-Down")
ptex:SetTexCoord(0, 0.625, 0, 0.6875)
ptex:SetAllPoints()
button:SetPushedTexture(ptex)

button:SetScript("OnClick", function()
    sellCrap()
end)