/*
	Faction: CTRG
	Author: Dom
*/
class paratrooper {
	name = $STR_B_SOLDIER_PG_F0;
	rank = "Private";
	description = $STR_DT_Paratrooper_Description;
	traits[] = {

	};
	customVariables[] = {

	};
	icon = "a3\ui_f\data\map\vehicleicons\iconMan_ca.paa";

	defaultLoadout[] = {
		{"arifle_MX_ACO_pointer_F","","acc_pointer_IR","optic_Aco",{"30Rnd_65x39_caseless_mag",30},{},""},
		{},
		{"hgun_P07_F","","","",{"16Rnd_9x21_Mag",16},{},""},
		{"U_B_CTRG_3",{{"FirstAidKit",1},{"30Rnd_65x39_caseless_mag",2,30},{"Chemlight_green",1,1},{"HandGrenade",1,1}}},
		{"V_PlateCarrierH_CTRG",{{"30Rnd_65x39_caseless_mag",7,30},{"16Rnd_9x21_Mag",2,16},{"SmokeShell",1,1},{"SmokeShellGreen",1,1},{"Chemlight_green",1,1}}},
		{"B_Parachute",{}},
		"H_HelmetB","",{},
		{"ItemMap","ItemGPS","ItemRadio","ItemCompass","ItemWatch","NVGoggles"}
	};

	arsenalWeapons[] = {
		"launch_B_Titan_short_F",
		"launch_B_Titan_F",
		"launch_MRAWS_green_rail_F",
		"launch_MRAWS_olive_rail_F",
		"launch_MRAWS_sand_rail_F",

		"launch_RPG32_green_F",
		"launch_RPG7_F",
		"launch_MRAWS_green_F",
		"launch_MRAWS_olive_F",
		"launch_MRAWS_sand_F",
		"launch_NLAW_F",

		"launch_B_Titan_F",
		"launch_B_Titan_olive_F",
		"launch_B_Titan_short_F",
		"launch_B_Titan_short_tna_F",
		"launch_B_Titan_tna_F"
	};
	arsenalMagazines[] = {

	};
	arsenalItems[] = {
		"optic_AMS",
		"optic_AMS_snd",
		"optic_LRPS"
	};
	arsenalBackpacks[] = {

	};
};