/*
	Faction: Rifleman
	Author: Dom
*/
class rifleman {
	name = $STR_DN_RIFLEMAN;
	rank = "Private";
	description = $STR_DT_Rifleman_Description;
	traits[] = {

	};
	customVariables[] = {

	};
	icon = "a3\ui_f\data\map\vehicleicons\iconMan_ca.paa";

	defaultLoadout[] = {
		{"AMF_614_long_01_F","","AMF_AN_PEQ_15_black","rhsusf_acc_su230",{"ACE_30Rnd_556x45_Stanag_Mk318_mag",30},{},""},
		{},
		{"AMF_Glock_17_TAN","","","",{"16Rnd_9x21_Mag",17},{},""},
		{"amf_uniform_02_CE_OD",{{"ACE_fieldDressing",4},{"ACE_elasticBandage",4},{"ACE_packingBandage",4},{"ACE_quikclot",4},{"ACE_EarPlugs",1},{"ACE_epinephrine",2},{"ACE_morphine",2},{"ACE_Flashlight_XL50",1},{"ACE_tourniquet",2},{"ACE_CableTie",4}}},
		{"amf_SMB_FUS_TAN",{{"ACE_30Rnd_556x45_Stanag_Mk318_mag",10,30},{"rhs_mag_m67",2,1},{"SmokeShell",2,1},{"SmokeShellBlue",2,1},{"16Rnd_9x21_Mag",3,17}}},
		{"AMF_rush24_01_TAN",{{"ACE_CableTie",10},{"ACE_IR_Strobe_Item",5}}},
		"AMF_FELIN_05_CE","",{"ACE_Vector","","","",{},{},""},
		{"ItemMap","ItemGPS","TFAR_anprc152","ItemCompass","ItemWatch",""}
	};

	arsenalItems[] = {
		"amf_mini_mg_01_f",
		"amf_mini_mg_tactical_mk3",
		"Eryx_HEAT",
		"AMF_AT4CS_Loaded",
		"AMF_LRAC89_F",
		"AMF_Eryx",
		"AMF_AC89mm_F1"
	};
};