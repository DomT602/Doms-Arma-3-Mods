/*
	Faction: Diver
	Author: Dom
*/
class diver {
	name = $STR_B_DIVER_F0;
	rank = "Private";
	description = $STR_DT_Diver_Description;
	traits[] = {

	};
	customVariables[] = {

	};
	icon = "a3\ui_f\data\map\vehicleicons\iconMan_ca.paa";

	defaultLoadout[] = {
		{"arifle_SDAR_F","","","",{"20Rnd_556x45_UW_mag",20},{},""},
		{},
		{"hgun_P07_F","muzzle_snds_L","","",{"16Rnd_9x21_Mag",16},{},""},
		{"U_B_Wetsuit",{{"FirstAidKit",1},{"30Rnd_556x45_Stanag_red",3,30},{"20Rnd_556x45_UW_mag",2,20},{"16Rnd_9x21_Mag",2,16},{"SmokeShellBlue",2,1},{"Chemlight_blue",4,1}}},
		{"V_RebreatherB",{}},
		{"B_Assault_Diver",{{"30Rnd_556x45_Stanag_red",2,30},{"20Rnd_556x45_UW_mag",2,20},{"SatchelCharge_Remote_Mag",1,1},{"MiniGrenade",3,1},{"SmokeShellBlue",2,1},{"Chemlight_blue",4,1},{{"Rangefinder","","","",{},{},""},1}}},
		"","G_B_Diving",{},
		{"ItemMap","ItemGPS","ItemRadio","ItemCompass","ItemWatch",""}
	};

	arsenalWeapons[] = {
		"arifle_SDAR_F"
	};
	arsenalMagazines[] = {

	};
	arsenalItems[] = {
		"U_B_survival_uniform", "U_B_Wetsuit", "V_RebreatherB", "G_B_Diving"
	};
	arsenalBackpacks[] = {
		
	};
};