/*
	Faction: Squad Leader
	Author: Dom
*/
class pilot {
	name = $STR_B_PILOT_F0;
	rank = "Lieutenant";
	description = $STR_DT_Pilot_Description;
	traits[] = {

	};
	customVariables[] = {
		{"ace_isEngineer",1,true}
	};
	icon = "a3\ui_f\data\map\vehicleicons\iconManOfficer_ca.paa";

	defaultLoadout[] = {
		{"SMG_01_Holo_F","","","optic_Holosight_smg",{"30Rnd_45ACP_Mag_SMG_01",30},{},""},
		{},
		{},
		{"U_B_HeliPilotCoveralls",{{"FirstAidKit",1},{"30Rnd_45ACP_Mag_SMG_01",2,30},{"Chemlight_green",1,1}}},
		{"V_TacVest_blk",{{"30Rnd_45ACP_Mag_SMG_01",1,30},{"SmokeShellGreen",1,1},{"SmokeShellBlue",1,1},{"SmokeShellOrange",1,1},{"Chemlight_green",1,1}}},
		{},
		"H_PilotHelmetHeli_B","",{},
		{"ItemMap","","ItemRadio","ItemCompass","ItemWatch","NVGoggles"}
	};

	arsenalWeapons[] = {
		
	};
	arsenalMagazines[] = {
		
	};
	arsenalItems[] = {
		"U_B_HeliPilotCoveralls", "U_B_PilotCoveralls",
		"U_I_HeliPilotCoveralls", "U_I_pilotCoveralls",
		"U_I_E_Uniform_01_coveralls_F", "U_O_R_Gorka_01_black_F",
		"U_B_GEN_Soldier_F", "U_B_GEN_Commander_F"

	};
	arsenalBackpacks[] = {
		
	};
};