/*
	Faction: CTRG
	Author: Dom
*/
class sniper {
	name = $STR_B_SNIPER_F0;
	rank = "Corporal";
	description = $STR_DT_Sniper_Description;
	traits[] = {

	};
	customVariables[] = {

	};
	icon = "a3\ui_f\data\map\vehicleicons\iconMan_ca.paa";

	defaultLoadout[] = {
		{"srifle_LRR_camo_LRPS_F","","","optic_LRPS",{"7Rnd_408_Mag",7},{},""},
		{},
		{"hgun_P07_snds_F","muzzle_snds_L","","",{"16Rnd_9x21_Mag",16},{},""},
		{"U_B_GhillieSuit",{{"FirstAidKit",1},{"7Rnd_408_Mag",2,7},{"SmokeShell",1,1}}},
		{"V_TacVest_khk",{{"7Rnd_408_Mag",3,7},{"16Rnd_9x21_Mag",2,16},{"ClaymoreDirectionalMine_Remote_Mag",1,1},{"APERSTripMine_Wire_Mag",1,1},{"SmokeShellGreen",1,1},{"SmokeShellBlue",1,1},{"SmokeShellOrange",1,1},{"Chemlight_green",2,1}}},
		{},
		"","",{"Rangefinder","","","",{},{},""},
		{"ItemMap","ItemGPS","ItemRadio","ItemCompass","ItemWatch","NVGoggles"}
	};

	arsenalWeapons[] = {
		"srifle_DMR_02_camo_F", "srifle_DMR_02_F", "srifle_DMR_02_sniper_F", "srifle_GM6_F", "srifle_LRR_camo_F", "srifle_LRR_F", "srifle_LRR_tna_F"
	};
	arsenalMagazines[] = {

	};
	arsenalItems[] = {
		"optic_LRPS", "optic_LRPS_tna_F",
		"optic_Nightstalker",
		"optic_tws",
		"optic_tws_mg",
		"Rangefinder",

		"U_B_GhillieSuit", "U_B_T_Sniper_F", "U_B_FullGhillie_ard", "U_B_FullGhillie_lsh", "U_B_FullGhillie_sard", "U_B_T_FullGhillie_tna_F"
	};
	arsenalBackpacks[] = {

	};
};