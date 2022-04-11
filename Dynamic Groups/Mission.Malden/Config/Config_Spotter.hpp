/*
	Faction: Spotter
	Author: Dom
*/
class spotter {
	name = $STR_B_SPOTTER_F0;
	rank = "Private";
	description = $STR_DT_Spotter_Description;
	maxCount = 2;
	traits[] = { //format {"trait",value,isCustom}}

	};
	icon = "a3\ui_f\data\map\vehicleicons\iconMan_ca.paa";

	defaultLoadout[] = {
		{"arifle_MX_Hamr_pointer_F","","acc_pointer_IR","optic_Hamr",{"30Rnd_65x39_caseless_mag",30},{},""},
		{},
		{"hgun_P07_snds_F","muzzle_snds_L","","",{"16Rnd_9x21_Mag",16},{},""},
		{"U_B_GhillieSuit",{{"FirstAidKit",1},{"30Rnd_65x39_caseless_mag",4,30},{"Chemlight_green",1,1}}},
		{"V_Chestrig_rgr",{{"30Rnd_65x39_caseless_mag",1,30},{"16Rnd_9x21_Mag",2,16},{"ClaymoreDirectionalMine_Remote_Mag",1,1},{"APERSTripMine_Wire_Mag",1,1},{"MiniGrenade",2,1},{"B_IR_Grenade",2,1},{"SmokeShell",1,1},{"SmokeShellGreen",1,1},{"SmokeShellBlue",1,1},{"SmokeShellOrange",1,1},{"Chemlight_green",1,1}}},
		{},
		"","",{"Laserdesignator","","","",{"Laserbatteries",1},{},""},
		{"ItemMap","ItemGPS","ItemRadio","ItemCompass","ItemWatch","NVGoggles"}
	};

	arsenalWeapons[] = {
		"arifle_MX_ACO_pointer_F"
	};
	arsenalMagazines[] = {
		"30Rnd_65x39_caseless_mag"
	};
	arsenalItems[] = {
		
	};
	arsenalBackpacks[] = {
		
	};
};