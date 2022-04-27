/*
	Faction: Example
	Author: Dom
*/
class roleClassname { //this class is used when defining which roles are in what group
	name = "Example Role"; //this is the name of the role as shown in the menu, can either be plain string or found in a stringtable using $ e.g $STR_B_DIVER_F0
	rank = "Private"; //can be one of the following "Private", "Corporal", "Sergeant", "Lieutenant", "Captain", "Major", "Colonel"
	description = $STR_DT_Diver_Description; //this is the description of the role shown in the menu, can be plain string or found in stringtable
	traits[] = { //these are specific traits to the unit in the following format {"trait",value,isCustom}}, more information here: https://community.bistudio.com/wiki/setUnitTrait

	};
	customVariables[] = { //these variables are set on the player object once the role is taken in format {"variable",value,global}

	};
	icon = "a3\ui_f\data\map\vehicleicons\iconMan_ca.paa"; //this icon is shown on the menu when picking a role

	defaultLoadout[] = { //this is the default loadout the player will get when selecting the role, can be acquired by using getUnitLoadout player
		{"arifle_SDAR_F","","","",{"20Rnd_556x45_UW_mag",20},{},""},
		{},
		{"hgun_P07_snds_F","muzzle_snds_L","","",{"16Rnd_9x21_Mag",16},{},""},
		{"U_B_Wetsuit",{{"FirstAidKit",1},{"30Rnd_556x45_Stanag_red",3,30},{"20Rnd_556x45_UW_mag",2,20},{"16Rnd_9x21_Mag",2,16},{"SmokeShellBlue",2,1},{"Chemlight_blue",4,1}}},
		{"V_RebreatherB",{}},
		{"B_Assault_Diver",{{"30Rnd_556x45_Stanag_red",2,30},{"20Rnd_556x45_UW_mag",2,20},{"SatchelCharge_Remote_Mag",1,1},{"MiniGrenade",3,1},{"SmokeShellBlue",2,1},{"Chemlight_blue",4,1},{{"Rangefinder","","","",{},{},""},1}}},
		"","G_B_Diving",{},
		{"ItemMap","ItemGPS","ItemRadio","ItemCompass","ItemWatch",""}
	};

	arsenalWeapons[] = { //weapons that will be in the arsenal specific to this role
		"arifle_SDAR_F"
	};
	arsenalMagazines[] = { //magazines that will be in the arsenal specific to this role

	};
	arsenalItems[] = { //any item not covered by other categories that will be in the arsenal specific to this role
		"U_B_survival_uniform", "U_B_Wetsuit", "V_RebreatherB", "G_B_Diving"
	};
	arsenalBackpacks[] = { //backpacks that will be in the arsenal specific to this role
		
	};
};