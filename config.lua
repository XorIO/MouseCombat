--[[
Mouse Combat by Xor 2005-2009

    Version 1.3.0SP1

	There are 2 arrays: 
	MC_BUTTONS_LIST for the usual bindings associated with the class
	MC_ML_BUTTONS_LIST for the mouse look override bindings associated with the class. As you can see I'm using it only for the button1 and button2 with modifiers.

	In order to add new default class bindings (persist through dual-spec change) just add:
	["CLASS"] = {
		{"SOME_BUTTON", "/cast Something"}, 
		{"SOME_BUTTON2", "/cast Something2"}, 
	},

	to the both lists and assign your key bindings.


	Check 2 different ways to add modifiers binding, both works fine:
	["CLASS"] = {
		{"SOME_BUTTON", "/cast Something"}, 
		{"CTRL-SOME_BUTTON", "/cast Something2"}, 
	},

	and 

	["CLASS"] = {
		{"SOME_BUTTON", "/cast [nomodifier] Something1; [modifier:ctrl] Something2;"}, 
	},

	For the dual-spec specific bindings add englishclassname+specnum, e.g.:
	["ROGUE1"] = {
		{"SOME_BUTTON", "/cast [nomodifier] SomethingSpec1_1; [modifier:ctrl] SomethingSpec1_2;"}, 

	},
	["ROGUE2"] = {
		{"SOME_BUTTON", "/cast [nomodifier] SomethingSpec2_1; [modifier:ctrl] SomethingSpec2_2;"}, 

	},

	Or use default (ENGLISHCLASSNAME) for one spec and overriding (ENGLISHCLASSNAME1 or ENGLISHCLASSNAME2) for the second spec.

	P.S. You may notice Left and Right buttons bindings in the config - it is back and forward button on my VX revolution mouse
    reassigned to left/right in the logitech SetPoint utility.

--]]



MC_BUTTONS_LIST = {
	["DEFAULT"] = {
	    {"C", "/target focustarget"}, 
	    {"CTRL-C", "/focus"}, 
	    {"ALT-C", "/clearfocus"}, 
	},
	["DEATHKNIGHT"] = {
        -- Come Here, Slow, Silence
	     {"DOWN", "/cast Death Grip;"}, 
	     {"CTRL-DOWN", "/cast Chains of Ice;"}, 
	     {"SHIFT-DOWN", "/cast Strangulate\n/cast Mind Freeze"}, 
         
         --
	     {"UP", "/cast Raise Dead"},  
	     {"CTRL-UP", "/cast Insignia of the Scourge"}, 
	     {"SHIFT-UP", "/cast "},
         -- DRW
	     {"BUTTON3", "/cast Berserking"},
	     {"CTRL-BUTTON3", "/cast [target=player] Hysteria"},
	     {"SHIFT-BUTTON3", "/cast Dancing Rune Weapon"},
        -- AOE
	     {"F", "/cast Pestilence;"}, 
             {"CTRL-F", "/cast Blood Boil;"}, 
             {"SHIFT-F", "/cast Death and Decay;"}, 
         
        -- Mount
	     {"G", "/script local m=GetZoneText() if (m==\"Dalaran\" or m==\"Wintergrasp\") and (GetSubZoneText()~=\"Krasus' Landing\") then CallCompanion(\"MOUNT\", 1);end\n/use [nomounted] Acherus Deathcharger\n/dismount"}, 
         --/use [flyable,nomounted] Violet Netherwing Drake; [nomounted] Acherus Deathcharger\n/dismount"}, 
	     {"E", "/cast Icy Touch;"}, 
	     {"Q", "/cast Plague Strike;"},
        -- Taunt/Parry Strike
	     {"R", "/cast [nomodifier] Dark Command; [modifier:ctrl] Rune Strike;"}
	},

	["HUNTER"] = {
	     {"DOWN", "/cast Concussive Shot"}, 
	     {"CTRL-DOWN", "/cast Wing Clip"}, 
	     {"SHIFT-DOWN", "/cast Scatter Shot\n/stopcasting\n/stopattack"}, 
	     {"UP", "/cast Freezing Trap\n/stopcasting\n/stopattack"},  
	     {"CTRL-UP", "/cast Immolation Trap"}, 
	     {"SHIFT-UP", "/cast Frost Trap"},
	     {"BUTTON3", "/cast Hunter's Mark"},
	     {"CTRL-BUTTON3", "/cast Distracting Shot\n/stopcasting\n/stopattack"},
	     {"SHIFT-BUTTON3", "/cast Silencing Shot\n/stopcasting\n/stopattack"},

	     {"F", "/cast Flare"}, 
	     {"G", "/script local m=GetZoneText() if (m==\"Dalaran\" or m==\"Wintergrasp\") and (GetSubZoneText()~=\"Krasus' Landing\") then CallCompanion(\"MOUNT\", 1);end\n/use [flyable,nomounted] Violet Netherwing Drake; [nomounted] Swift Timber Wolf\n/dismount"}, 
	     {"E", "/cast [nomodifier] Aspect of the Monkey; [modifier:ctrl] Aspect of the Pack"}, 
	     {"Q", "/cast [nomodifier] Aspect of the Hawk; [modifier:ctrl] Aspect of the Viper"},

	     {"R", "/cast [nomodifier] Feign Death; [modifier:ctrl] Disengage"}
	},
	["SHAMAN"] = {
	     {"DOWN", "/cast "}, 
	     {"CTRL-DOWN", "/cast "}, 
	     {"SHIFT-DOWN", "/cast "}, 
	     {"ALT-DOWN", ""}, 
	     {"UP", "/cast "},  
	     {"CTRL-UP", "/cast "}, 
	     {"SHIFT-UP", "/cast "},
	     {"LEFT", "/cast "}, 

	     
	     {"BUTTON3", "/cast Blood Fury"},
	     {"CTRL-BUTTON3", "/cast Stormstrike"},
	     {"SHIFT-BUTTON3", "/cast [target=player] Lesser Healing wave"},
	     {"ALT-BUTTON3", "/cast "},

	     {"CTRL-G", "/cast Ghost Wolf"},



	     {"F5", "/cast [target=player] Lesser Healing Wave"},
	     {"F6", "/cast [target=player] Healing Wave"}, 


	     {"C", "/cast Lightning Shield"},
	     {"CTRL-C", "/cast Water Shield;"}, 
	     {"F", "/cast Earthbind Totem;"}, 
	     {"SHIFT-F", "/cast Stoneclaw Totem;"}, 
	     {"CTRL-F", "/cast Strength of Earth Totem;"}, 
	     {"ALT-F", "/cast Stoneskin Totem;"}, 
	     {"ALT-CTRL-F", "/cast Tremor Totem;"}, 
	     {"G", "/script local m=GetZoneText() if (m==\"Dalaran\" or m==\"Wintergrasp\") and (GetSubZoneText()~=\"Krasus' Landing\") then CallCompanion(\"MOUNT\", 6);end\n/use [flyable,nomounted] Swift Green Wind Rider; [nomounted] Swift Timber Wolf\n/dismount"}, 
	     {"E", "/startattack\n/cast [nomodifier] Call of the Elements; [modifier:alt] Magma Totem; [modifier:ctrl] Call of the Ancestors; [modifier:shift] Mana Spring Totem; "}, 
	     {"Q", "/cast Lava Lash;"},
	     {"R", "/cast "},
	     {"CTRL-R", "/cast "},
	},

	-- Spec1 PVP sub expiriment
	["ROGUE"] = {
	     {"DOWN", "/cast Gouge"}, 
	     {"CTRL-DOWN", "/cast [target=focus,harm,nodead] Blind; Blind;"}, 
	     {"SHIFT-DOWN", "/cast Gouge\n/stopcasting\n/use [target=player] Heavy Netherweave Bandage"}, 
	     {"ALT-DOWN", "/startattack\n/cast Fan of Knives"}, 
	     {"UP", "/cast Escape Artist"},  
	     {"CTRL-UP", "/cast Cloak of Shadows"}, 
	     {"SHIFT-UP", "/cast Sprint"}, 

	     
	     {"BUTTON3", "/cast Ghostly Strike\n/stopcasting\n/cast Evasion"},
	     {"CTRL-BUTTON3", "/cast Shadowstep"},
	     {"SHIFT-BUTTON3", "/cast Premeditation"},
	     {"ALT-BUTTON3", "/cast Shadow Dance"},

	     {"SHIFT-F1", "/focus arena1"},
	     {"SHIFT-F2", "/focus arena2"},
	     {"SHIFT-F3", "/focus arena3"},
	     {"SHIFT-F4", "/focus arena4"},
	     {"SHIFT-F5", "/focus arena5"},

	     {"F", "/cast [nomodifier] Kick; [modifier:ctrl] Dismantle;"}, 
	     
	     {"G", "/use [nomounted, flyable] Swift Green Wind Rider; [nomounted, noflyable] Green Mechanostrider\n/dismount"}, 
	     {"E", "/cast [nostance, nomodifier] Stealth; [nostance, modifier:ctrl] Vanish ;[stance:1, nomodifier] Cheap Shot;[stance:1, modifier:alt] Stealth;"}, 
	     {"SHIFT-E", "/castsequence Shadowstep, Cheap Shot"},
		
	     {"Q", "/cast Gouge"},

	     {"CTRL-Q", "/cast Feint"},

	     {"X", "/cast Shoot"},
	     {"CTRL-X", "/cast deadly throw\n/cast throw"},
	     {"R", "/script SetCVar('AutoLootDefault', 1) \n/cast Pick Pocket\n/in 1 /script SetCVar('AutoLootDefault', 0);"},
	},
	["ROGUE1"] = {
	     {"LEFT", "/cast [target=Mirial] Tricks of the Trade;"}, 
	     {"CTRL-LEFT", "/cast Garrote;"}, 
	     {"SHIFT-LEFT", "/castsequence Shadowstep, Garrote;"}, 
	     {"RIGHT", "/cast [nostealth] Evasion\n/stopcasting\n/cast sprint\n/stopcasting\n/cast preparation;"},
	     {"R", "/castsequence Distract;"},

	 },
	-- This will override default settings for the 2nd spec = Mutilate. 
	["ROGUE2"] = {
	     {"DOWN", "/cast Gouge;"}, 
	     {"LEFT", "/cast [target=target,help,nodead] Tricks of the Trade; [target=focus,help,nodead] Tricks of the Trade; [target=targettarget,help,nodead] Tricks of the Trade;"}, 
	     {"CTRL-LEFT", "/cast Garrote;"}, 
	     {"SHIFT-LEFT", "/cast ;"}, 
	     {"RIGHT", "/cast ;"}, 

	     {"BUTTON3", "/cast Evasion"},
	     {"CTRL-BUTTON3", "/cast Cold Blood"},
	     {"SHIFT-BUTTON3", "/cast Garrote"},
	     {"ALT-BUTTON3", "/cast Hunger for Blood"},
	},
};

MC_ML_BUTTONS_LIST = {
	["DEFAULT"] = {
	},
	["DEATHKNIGHT"] = {
    -- Rotation IT-PS-HS-HS-DS-Raise Ghoul-DC-DS-HS-HS-HS-HS -Dump-
    -- Advanced 
    -- DS-IT-PS-HS-HS--Raise Ghoul-DC-HS-HS-DS-HS-HS -Dump- then return to:
    -- IT-PS-HS-HS-DS-Raise Ghoul-DC-DS-HS-HS-HS-HS -Dump-
	     {"BUTTON1", "/cast [nomodifier] Heart Strike; [modifier:ctrl] Death Coil; [modifier:shift] Death Coil; [modifier:alt] Death Coil;"},
	     {"BUTTON2", "/cast [nomodifier] Death Strike;[modifier:ctrl] Death Coil; [modifier:shift] ;"}
	},

	["HUNTER"] = {
	     {"BUTTON1", "/console Sound_EnableSFX 0\n/cast !auto shot\n/castrandom Arcane Shot, Steady Shot\n/console Sound_EnableSFX 1\n/script UIErrorsFrame:Clear()"},
	     {"CTRL-BUTTON1", "/cast Raptor Strike\n/cast Mongoose Bite"},
	     {"SHIFT-BUTTON1", "/cast Multi-Shot;"},
	     
	     {"BUTTON2", "/cast [nomodifier] Black Arrow; [modifier:shift] Viper Sting; [modifier:ctrl] Serpent Sting; [modifier:alt] Scorpid Sting"}
	},
	["SHAMAN"] = {
	     {"BUTTON1", "/startattack\n/cast Earth Shock"},
	     {"CTRL-BUTTON1", "/startattack\n/cast Frost Shock"},
	     {"SHIFT-BUTTON1", "/startattack\n/cast Flame Shock"},
	     {"ALT-BUTTON1", "/cast "},
	     {"ALT-CTRL-BUTTON1", "/cast "},
	     
	     {"BUTTON2", "/cast Stormstrike"},
	     {"CTRL-BUTTON2", "/cast Lava Lash"},
	},	-- Spec1 PVP Sab test
	["ROGUE"] = {
	     {"BUTTON1", "/startattack\n/cast Cold Blood\n/cast Mutilate;"},
	     {"CTRL-BUTTON1", "/cast [stance:1] Garrote; [nostance] Backstab;"},
	     {"ALT-BUTTON1", "/console SET targetNearestDistance 10.000000\n/targetenemy [noharm][dead]\n/console SET targetNearestDistance 41.000000\n/cast [harm,nodead] Sap"},
	     {"SHIFT-BUTTON1", "/cast Cold Blood\n/cast Ambush"},
	     
	     {"BUTTON2", "/cast Eviscerate;"},
	     {"SHIFT-BUTTON2", "/cast Slice and Dice;"},
	     {"ALT-BUTTON2", "/cast Rupture;"},
	     {"CTRL-BUTTON2", "/cast Kidney Shot;"},
	     {"ALT-CTRL-BUTTON2", "/cast Recuperate;"},
	},
	["ROGUE1"] = {

	     {"BUTTON1", "/startattack\n/cast Cold Blood\n/cast Mutilate;"},
	     {"CTRL-BUTTON1", "/cast Garrote;"},
	     {"SHIFT-BUTTON1", "/cast Cold Blood\n/cast Ambush;"},
	     {"ALT-BUTTON1", "/console SET targetNearestDistance 10.000000\n/targetenemy [noharm][dead]\n/console SET targetNearestDistance 41.000000\n/cast [harm,nodead] Sap"},
	     {"ALT-CTRL-BUTTON1", "/cast Shiv"},

	     {"BUTTON2", "/cast Envenom;"},
	     {"SHIFT-BUTTON2", "/cast Slice and Dice;"},
	     {"ALT-BUTTON2", "/cast Rupture;"},
	     {"CTRL-BUTTON2", "/cast Kidney Shot;"},
	     {"ALT-CTRL-BUTTON2", "/cast Eviscerate;"},
	},
	-- This will override default settings for the 2nd spec = Mutilate. 
	["ROGUE2"] = {
	     {"BUTTON1", "/startattack\n/cast Cold Blood\n/cast Mutilate;"},
	     {"CTRL-BUTTON1", "/cast Garrote;"},
	     {"SHIFT-BUTTON1", "/cast Cold Blood\n/cast Ambush;"},
	     {"ALT-BUTTON1", "/console SET targetNearestDistance 10.000000\n/targetenemy [noharm][dead]\n/console SET targetNearestDistance 41.000000\n/cast [harm,nodead] Sap;"},
	     
	     {"BUTTON2", "/cast Envenom;"},
	     {"SHIFT-BUTTON2", "/cast Slice and Dice;"},
	     {"ALT-BUTTON2", "/cast Rupture;"},
	     {"CTRL-BUTTON2", "/cast Kidney Shot;"},
	     {"ALT-CTRL-BUTTON2", "/cast Eviscerate;"},
	},
}; 