if (SELLCRAP == nil) then 
    SELLCRAP = {}

    local frame = CreateFrame("Frame");
    frame:RegisterEvent("ADDON_LOADED")
    frame:SetScript("OnEvent", 
        function(self, event, addonName)
            if (event == "ADDON_LOADED" and addonName == "SellCrap") then
                handleSavedVars();
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

-- Auto Sell
optionspanel.autoSellCheckbox = CreateFrame("CheckButton", "SellCrapOptionsPanelCheckBox1", optionspanel, "ChatConfigCheckButtonTemplate");
optionspanel.autoSellCheckbox:SetPoint("TOPLEFT", 20, -44);
optionspanel.autoSellCheckbox:SetScript("OnClick", function()
    SELLCRAPVARS.autoSellCheckboxState = optionspanel.autoSellCheckbox:GetChecked()
end);

optionspanel.autoSellCheckbox.text = CreateFrame("SimpleHTML", "SellCrapOptionsPanelCheckBox1Text", optionspanel);
optionspanel.autoSellCheckbox.text:SetText("Auto-sell on Merchant visit");
optionspanel.autoSellCheckbox.text:SetSize(50, 50);
optionspanel.autoSellCheckbox.text:SetFont('Fonts\\FRIZQT__.TTF', 12);
optionspanel.autoSellCheckbox.text:SetPoint("TOPLEFT", 50, -50);

-- Auto Repair
optionspanel.autoRepairCheckbox = CreateFrame("CheckButton", "SellCrapOptionsPanelCheckBox2", optionspanel, "ChatConfigCheckButtonTemplate");
optionspanel.autoRepairCheckbox:SetPoint("TOPLEFT", 20, -70);
optionspanel.autoRepairCheckbox:SetScript("OnClick", function()
    SELLCRAPVARS.autoRepairCheckboxState = optionspanel.autoRepairCheckbox:GetChecked()
end);

optionspanel.autoRepairCheckbox.text = CreateFrame("SimpleHTML", "SellCrapOptionsPanelCheckBox2Text", optionspanel);
optionspanel.autoRepairCheckbox.text:SetText("Auto-repair on Merchant visit");
optionspanel.autoRepairCheckbox.text:SetSize(50, 50);
optionspanel.autoRepairCheckbox.text:SetFont('Fonts\\FRIZQT__.TTF', 12);
optionspanel.autoRepairCheckbox.text:SetPoint("TOPLEFT", 50, -75);

-- Show Bag Crap Value
optionspanel.showBagCrapValueCheckbox = CreateFrame("CheckButton", "SellCrapOptionsPanelCheckBox3", optionspanel, "ChatConfigCheckButtonTemplate");
optionspanel.showBagCrapValueCheckbox:SetPoint("TOPLEFT", 20, -96);
optionspanel.showBagCrapValueCheckbox:SetScript("OnClick", function()
    SELLCRAPVARS.showBagCrapValueCheckboxState = optionspanel.showBagCrapValueCheckbox:GetChecked()
    SELLCRAP:showBagCrapValue(SELLCRAPVARS.showBagCrapValueCheckboxState)
end);

optionspanel.showBagCrapValueCheckbox.text = CreateFrame("SimpleHTML", "SellCrapOptionsPanelCheckBox3Text", optionspanel);
optionspanel.showBagCrapValueCheckbox.text:SetText("Show Crap value in Bagpack");
optionspanel.showBagCrapValueCheckbox.text:SetSize(50, 50);
optionspanel.showBagCrapValueCheckbox.text:SetFont('Fonts\\FRIZQT__.TTF', 12);
optionspanel.showBagCrapValueCheckbox.text:SetPoint("TOPLEFT", 50, -100);

InterfaceOptions_AddCategory(optionspanel);

function handleSavedVars()
    if (SELLCRAPVARS == nil) then
        SELLCRAPVARS = {};
        optionspanel.autoSellCheckbox:SetChecked(false);
        optionspanel.autoRepairCheckbox:SetChecked(false);
        optionspanel.showBagCrapValueCheckbox:SetChecked(true);
        SELLCRAPVARS.autoSellCheckboxState = false;
        SELLCRAPVARS.autoRepairCheckboxState = false;
        SELLCRAPVARS.showBagCrapValueCheckboxState = true;
    else
        if (SELLCRAPVARS.autoSellCheckboxState == nil) then
            optionspanel.autoSellCheckbox:SetChecked(false);
        end
        if (SELLCRAPVARS.autoRepairCheckboxState == nil) then
            optionspanel.autoSellCheckbox:SetChecked(false);
        end
        if (SELLCRAPVARS.showBagCrapValueCheckboxState == nil) then
            optionspanel.autoSellCheckbox:SetChecked(true);
        end
        optionspanel.autoSellCheckbox:SetChecked(SELLCRAPVARS.autoSellCheckboxState);
        optionspanel.autoRepairCheckbox:SetChecked(SELLCRAPVARS.autoRepairCheckboxState);
        optionspanel.showBagCrapValueCheckbox:SetChecked(SELLCRAPVARS.showBagCrapValueCheckboxState);
    end
end