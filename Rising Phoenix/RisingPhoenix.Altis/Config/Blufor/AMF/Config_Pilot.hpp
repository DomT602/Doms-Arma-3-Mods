/*
	Faction: Pilot
	Author: Dom
*/
class pilot {
	name = $STR_B_PILOT_F0;
	rank = "Lieutenant";
	description = $STR_DT_Pilot_Description;
	traits[] = {

	};
	customVariables[] = {
		{"ace_isEngineer",1,true},
		{"ACE_GForceCoef",0.55,false}
	};
	icon = "a3\ui_f\data\map\vehicleicons\iconManOfficer_ca.paa";

	defaultLoadout[] = {
		{"AMF_614_long_01_F","","AMF_AN_PEQ_15_black","rhsusf_acc_su230",{"ACE_30Rnd_556x45_Stanag_Mk318_mag",30},{},""},
		{},
		{"AMF_Glock_17_TAN","","","",{"16Rnd_9x21_Mag",17},{},""},
		{"amf_pilot_01_f",{{"ACE_fieldDressing",4},{"ACE_elasticBandage",4},{"ACE_packingBandage",4},{"ACE_quikclot",4},{"ACE_EarPlugs",1},{"ACE_epinephrine",2},{"ACE_morphine",2},{"ACE_Flashlight_XL50",1},{"ACE_tourniquet",2},{"ACE_CableTie",4}}},
		{"amf_SMB_FUS_TAN",{{"ACE_30Rnd_556x45_Stanag_Mk318_mag",10,30},{"rhs_mag_m67",2,1},{"SmokeShell",2,1},{"SmokeShellBlue",2,1},{"16Rnd_9x21_Mag",3,17}}},
		{"AMF_rush24_01_TAN",{{"ToolKit",1}}},
		"AMF_ALPHA900","",{"ACE_Vector","","","",{},{},""},
		{"ItemMap","ItemGPS","TFAR_anprc152","ItemCompass","ItemWatch",""}
	};

	arsenalItems[] = {
		"amf_pilot_01_f",
		"AMF_ALPHA900",
		"AMF_ALPHA900_02",
		"AMF_LA100",
		"AMF_topowl",
		"amf_hk_mp5_02_f",
		"30Rnd_9x19_mag"
	};
};