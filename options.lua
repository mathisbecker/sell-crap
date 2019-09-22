if (SELLCRAP == nil) then 
    SELLCRAP = {}

    local frame = CreateFrame("Frame");
    frame:RegisterEvent("ADDON_LOADED")
    frame:SetScript("OnEvent", 
        function(self, event, addonName)
            if (event == "ADDON_LOADED" and addonName == "SellCrap") then
                if (AUTOSELLCHECKBOXSTATE == nil) then
                    handleSavedVars(false);  
                else
                    handleSavedVars(AUTOSELLCHECKBOXSTATE);
                end
            end
        end
    )
end

local optionspanel = CreateFrame("Frame", "SellCrapOptionsPanel", UIParent);
optionspanel.name = "SellCrap";

optionspanel.headline = CreateFrame("SimpleHTML", "SellCrapOptionsPanelHeadline", optionspanel);
optionspanel.headline:SetText("SellCrap");
optionspanel.headline:SetTextColor(1, 0.82, 0);
optionspanel.headline:SetSize(50, 50);
optionspanel.headline:SetFont('Fonts\\FRIZQT__.TTF', 16);
optionspanel.headline:SetPoint("TOPLEFT", 20, -20);

optionspanel.autoSellCheckbox = CreateFrame("CheckButton", "SellCrapOptionsPanelCheckBox1", optionspanel, "ChatConfigCheckButtonTemplate");
optionspanel.autoSellCheckbox:SetPoint("TOPLEFT", 20, -45);
optionspanel.autoSellCheckbox:SetText("Auto-sell on Merchant visit");
optionspanel.autoSellCheckbox:SetScript("OnClick", function()
    AUTOSELLCHECKBOXSTATE = optionspanel.autoSellCheckbox:GetChecked()
end);

optionspanel.autoSellCheckbox.text = CreateFrame("SimpleHTML", "SellCrapOptionsPanelCheckBox1Text", optionspanel);
optionspanel.autoSellCheckbox.text:SetText("Auto-sell on Merchant visit");
optionspanel.autoSellCheckbox.text:SetSize(50, 50);
optionspanel.autoSellCheckbox.text:SetFont('Fonts\\FRIZQT__.TTF', 12);
optionspanel.autoSellCheckbox.text:SetPoint("TOPLEFT", 50, -50);

InterfaceOptions_AddCategory(optionspanel);

function handleSavedVars(var)
    optionspanel.autoSellCheckbox:SetChecked(var)
end