/*
	Faction: CTRG
	Author: Dom
*/
class squadlead {
	name = $STR_B_SOLDIER_SL_F0;
	rank = "Lieutenant";
	description = $STR_DT_SqLe_Description;
	traits[] = {

	};
	customVariables[] = {

	};
	icon = "a3\ui_f\data\map\vehicleicons\iconManLeader_ca.paa";

	defaultLoadout[] = {
		{"arifle_MX_Hamr_pointer_F","","acc_pointer_IR","optic_Hamr",{"30Rnd_65x39_caseless_mag",30},{},""},
		{},
		{"hgun_P07_F","","","",{"16Rnd_9x21_Mag",16},{},""},
		{"U_B_CTRG_3",{{"FirstAidKit",1},{"30Rnd_65x39_caseless_mag",2,30},{"Chemlight_green",1,1}}},
		{"V_PlateCarrierH_CTRG",{{"30Rnd_65x39_caseless_mag",1,30},{"30Rnd_65x39_caseless_mag_Tracer",2,30},{"16Rnd_9x21_Mag",2,16},{"HandGrenade",2,1},{"B_IR_Grenade",2,1},{"SmokeShell",1,1},{"SmokeShellGreen",1,1},{"SmokeShellBlue",1,1},{"SmokeShellOrange",1,1},{"Chemlight_green",1,1}}},
		{},
		"H_HelmetB_desert","",{"Binocular","","","",{},{},""},
		{"ItemMap","ItemGPS","ItemRadio","ItemCompass","ItemWatch","NVGoggles"}
	};

	arsenalWeapons[] = {
		"arifle_SPAR_01_GL_blk_F",
		"arifle_SPAR_01_GL_snd_F",
		"arifle_MX_GL_Black_F",
		"arifle_MX_GL_F"
	};
	arsenalMagazines[] = {

	};
	arsenalItems[] = {

	};
	arsenalBackpacks[] = {

	};
};