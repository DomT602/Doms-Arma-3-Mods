/*
	Faction: Engineer
	Author: Dom
*/
class engineer {
	name = $STR_B_ENGINEER_F0;
	rank = "Corporal";
	description = $STR_DT_Engineer_Description;
	maxCount = 5;
	traits[] = { //format {"trait",value,isCustom}}
		{"Engineer",true}
	};
	icon = "a3\ui_f\data\map\vehicleicons\iconManEngineer_ca.paa";

	defaultLoadout[] = {
		{"arifle_MXC_Holo_pointer_F","","acc_pointer_IR","optic_Holosight",{"30Rnd_65x39_caseless_mag",30},{},""},
		{},
		{"hgun_P07_F","","","",{"16Rnd_9x21_Mag",16},{},""},
		{"U_B_CombatUniform_mcam_vest",{{"FirstAidKit",1},{"30Rnd_65x39_caseless_mag",2,30},{"Chemlight_green",1,1}}},
		{"V_Chestrig_rgr",{{"30Rnd_65x39_caseless_mag",3,30},{"16Rnd_9x21_Mag",2,16},{"HandGrenade",2,1},{"SmokeShell",1,1},{"SmokeShellGreen",1,1},{"SmokeShellBlue",1,1},{"SmokeShellOrange",1,1},{"Chemlight_green",1,1}}},
		{"B_Kitbag_mcamo_Eng",{{"ToolKit",1},{"MineDetector",1},{"SatchelCharge_Remote_Mag",1,1},{"DemoCharge_Remote_Mag",2,1}}},
		"H_HelmetB_desert","G_Tactical_Clear",{},
		{"ItemMap","","ItemRadio","ItemCompass","ItemWatch","NVGoggles"}
	};

	arsenalWeapons[] = {

	};
	arsenalMagazines[] = {

	};
	arsenalItems[] = {
		"ToolKit", "MineDetector"
	};
	arsenalBackpacks[] = {
		
	};
};