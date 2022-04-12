/*
	Faction: EOD
	Author: Dom
*/
class eod {
	name = $STR_B_SOLDIER_EXP_F0;
	rank = "Corporal";
	description = $STR_DT_EOD_Description;
	traits[] = {
		{"ExplosiveSpecialist",true}
	};
	customVariables[] = {
		{"ace_isEOD",1,true}
	};
	icon = "a3\ui_f\data\map\vehicleicons\iconManExplosive_ca.paa";

	defaultLoadout[] = {
		{"arifle_MXC_Holo_pointer_F","","acc_pointer_IR","optic_Holosight",{"30Rnd_65x39_caseless_mag",30},{},""},
		{},
		{"hgun_P07_F","","","",{"16Rnd_9x21_Mag",16},{},""},
		{"U_B_CombatUniform_mcam",{{"FirstAidKit",1},{"30Rnd_65x39_caseless_mag",2,30},{"Chemlight_green",1,1}}},
		{"V_PlateCarrierGL_rgr",{{"30Rnd_65x39_caseless_mag",3,30},{"16Rnd_9x21_Mag",2,16},{"APERSMine_Range_Mag",3,1},{"HandGrenade",2,1},{"SmokeShell",1,1},{"SmokeShellGreen",1,1},{"Chemlight_green",1,1}}},
		{"B_Kitbag_rgr_Exp",{{"ToolKit",1},{"MineDetector",1},{"APERSBoundingMine_Range_Mag",3,1},{"ClaymoreDirectionalMine_Remote_Mag",2,1},{"SLAMDirectionalMine_Wire_Mag",2,1},{"DemoCharge_Remote_Mag",1,1}}},
		"H_HelmetSpecB","G_Combat",{},
		{"ItemMap","","ItemRadio","ItemCompass","ItemWatch","NVGoggles"}
	};

	arsenalWeapons[] = {

	};
	arsenalMagazines[] = {

	};
	arsenalItems[] = {
		"ToolKit", "MineDetector",

		"APERSBoundingMine_Range_Mag", "APERSMine_Range_Mag", "APERSTripMine_Wire_Mag", "ATMine_Range_Mag", "ClaymoreDirectionalMine_Remote_Mag",
		"IEDLandBig_Remote_Mag", "IEDLandSmall_Remote_Mag", "IEDUrbanBig_Remote_Mag", "IEDUrbanSmall_Remote_Mag", "SatchelCharge_Remote_Mag", "SLAMDirectionalMine_Wire_Mag",
		"TrainingMine_Mag"

	};
	arsenalBackpacks[] = {
		
	};
};