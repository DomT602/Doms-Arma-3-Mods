/*
	Faction: Crewman
	Author: Dom
*/
class crewman {
	name = $STR_B_CREW_F0;
	rank = "Private";
	description = $STR_DT_Crewman_Description;
	maxCount = 6;
	traits[] = {
		{"Engineer",true}
	};
	icon = "a3\ui_f\data\map\vehicleicons\iconMan_ca.paa";

	defaultLoadout[] = {
		{"arifle_MXC_F","","","",{"30Rnd_65x39_caseless_mag",30},{},""},
		{},
		{"hgun_P07_F","","","",{"16Rnd_9x21_Mag",16},{},""},
		{"U_B_CombatUniform_mcam_vest",{{"FirstAidKit",1},{"30Rnd_65x39_caseless_mag",2,30},{"Chemlight_green",1,1}}},
		{"V_BandollierB_rgr",{{"30Rnd_65x39_caseless_mag",3,30},{"16Rnd_9x21_Mag",2,16},{"HandGrenade",2,1},{"SmokeShell",1,1},{"SmokeShellGreen",1,1},{"Chemlight_green",1,1}}},
		{},
		"H_HelmetCrew_B","",{},
		{"ItemMap","ItemGPS","ItemRadio","ItemCompass","ItemWatch","NVGoggles"}
	};

	arsenalWeapons[] = {

	};
	arsenalMagazines[] = {

	};
	arsenalItems[] = {
		"ToolKit", "H_HelmetCrew_B", "H_HelmetCrew_I_E"
	};
	arsenalBackpacks[] = {
		
	};
};