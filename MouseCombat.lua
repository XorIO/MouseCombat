--[[
Mouse Combat by Xor 2005-2009

    Version 1.4.0RC1

	How-to:
	Assign mouse look toggle binding in the standard blizzard UI. (My personal favorite is CTRL-SPACE)
	In order to make changes or add classes/spec edit config.lua

    TODO:
    1. Config UI
	2. Probably split configs per class/spec in order to allow users to simply add new configs.
--]]


BINDING_HEADER_MouseCombat            = 'MouseCombat'
BINDING_NAME_MC_MouseLook_mode_toggle  = "MouseCombat toggle"
BINDING_NAME_MC_MouseLook_mode_release  = "MouseCombat temorary release"

MC_BUTTONS_LIST = {};
MC_ML_BUTTONS_LIST = {};

--------------- Shared variables ---------------
MC_DEBUG = true;


--------------- Saved variables ---------------
MC_Config = { };

--------------- Local variables ---------------
local MC_VERSION = "1.4.0RC1";

MC_BindingFrame = CreateFrame("Frame", "MC_BindingFrame", UIParent, "SecureFrameTemplate");

function MC_SetButtons()

    ClearOverrideBindings(MC_BindingFrame);

    local playerClass, englishClass = UnitClass("player");

    MouseCombat_Apply_Bindings("DEFAULT");

    MouseCombat_Apply_Bindings(englishClass);

    if ( GetNumTalentGroups() > 1 )
    then
        MC_ChatPrint("Dual-spec found, active profiles: DEFAULT, " .. englishClass .. " and Spec=".. GetActiveTalentGroup() .. " (" .. MouseCombat_getCurrentBuildName() .. ")");
	MouseCombat_Apply_Bindings(englishClass .. GetActiveTalentGroup());
    else
        MC_ChatPrint("NO Dual-spec found, active profiles: DEFAULT and " .. englishClass);
    end
end

function MouseCombat_Apply_Bindings(englishClass)
    MC_DebugPrint("Applying bindings for " .. englishClass);

    if not MC_BUTTONS_LIST[englishClass] then
        MC_ChatPrint('NO BUTTONS_LIST defined for : ' .. englishClass .. '.');
    else
	    MC_DebugPrint('Found BUTTONS_LIST for : ' .. englishClass .. '.');

	    for j=1,getn(MC_BUTTONS_LIST[englishClass]), 1 do
		    local button = CreateFrame("Button", "MouseCombatBTN"..englishClass.."_"..j, UIParent,"SecureActionButtonTemplate");
		    button:SetAttribute("type", "macro");
		    button:SetAttribute("macrotext", MC_BUTTONS_LIST[englishClass][j][2]);
		    button:RegisterForClicks("LeftButtonDown");
		   -- SetBinding(MC_BUTTONS_LIST[englishClass][j][1],MC_BUTTONS_LIST[englishClass][j][2]);
		    SetOverrideBinding(MC_BindingFrame, true, MC_BUTTONS_LIST[englishClass][j][1], "CLICK MouseCombatBTN"..englishClass.."_"..j..":LeftButton");
	    end
    end

    if not MC_ML_BUTTONS_LIST[englishClass] then
	    MC_ChatPrint('NO ML_BUTTONS_LIST defined for : ' .. englishClass .. '.');
    else
	    MC_DebugPrint('Found ML_BUTTONS_LIST for : ' .. englishClass .. '.');

	    for j=1,getn(MC_ML_BUTTONS_LIST[englishClass]), 1 do
    		local button = CreateFrame("Button", "MLMouseCombatBTN"..englishClass.."_"..j, UIParent,"SecureActionButtonTemplate");
		    button:SetAttribute("type", "macro");
		    button:SetAttribute("macrotext", MC_ML_BUTTONS_LIST[englishClass][j][2]);
		    button:RegisterForClicks("LeftButtonDown");
		    SetMouselookOverrideBinding(MC_ML_BUTTONS_LIST[englishClass][j][1], "CLICK MLMouseCombatBTN"..englishClass.."_"..j..":LeftButton");
	    end
    end
end

function MouseCombat_OnLoad()
	MC_ChatPrint("[MouseCombat] Version "..MC_VERSION.." loaded");

--	this:RegisterEvent("PLAYER_ENTERING_WORLD")
--	this:RegisterEvent("PLAYER_TALENT_UPDATE")

	--UIFrameFadeOut(TargetFrame,0,1,0)

	MC_SetButtons();
end


function MC_ChatPrint(str)
	if(DEFAULT_CHAT_FRAME)
	then
		DEFAULT_CHAT_FRAME:AddMessage("MouseCombat : "..str, 1.0, 0.7, 0.15);
	end
end

function MC_DebugPrint(str)
	if(MC_DEBUG)
	then
		if(DEFAULT_CHAT_FRAME)
		then
			DEFAULT_CHAT_FRAME:AddMessage("MouseCombat Debug : "..tostring(str), 1.0, 0, 0);
		end
	end
end

function MC_Toggle()
	if not MouseLookOn then
		GameTooltip:Hide();
		MouselookStart();
		MouseLookOn = true;
	else
		MouselookStop();
		MouseLookOn = false;
	end
end

function MouseCombat_OnEvent(event)
	if event == "PLAYER_ENTERING_WORLD" then
		if MouseLookOn then
			MouselookStart();
		end
	elseif event == "PLAYER_TALENT_UPDATE" then
		MC_ChatPrint("PLAYER_TALENT_UPDATE: reloading bindings");
		MC_SetButtons();
	end
end

function MouseCombat_getCurrentBuildName() 
	local b1,_,t1,_ = GetTalentTabInfo(1, false, false);
	local b2,_,t2,_ = GetTalentTabInfo(2, false, false);
	local b3,_,t3,_ = GetTalentTabInfo(3, false, false);
		
	local threshold = (t1 + t2 + t3) * 40 / 71;
	local buildTree = "Hybrid";
	if ( t1 > threshold ) then
		buildTree = b1;
	elseif ( t2 > threshold ) then
		buildTree = b2;
	elseif ( t3 > threshold ) then
		buildTree = b3;
	end	
	MC_DebugPrint("buildTree="..buildTree);
	return buildTree;
end

local frame = CreateFrame( "Frame", "MOUSE_COMBAT", UIParent )
MC_BindingFrame:SetScript("OnEvent", onEvent)
MC_BindingFrame:RegisterEvent("PLAYER_TALENT_UPDATE")
MC_BindingFrame:RegisterEvent("PLAYER_ENTERING_WORLD")