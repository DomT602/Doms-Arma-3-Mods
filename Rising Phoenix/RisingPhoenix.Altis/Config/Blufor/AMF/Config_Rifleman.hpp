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
		{"AMF_614_short_01_F","","AMF_WMX200","AMF_specter",{"ACE_30Rnd_556x45_Stanag_Mk318_mag",30},{},""},
		{},
		{"AMF_Glock_17_TAN","","acc_flashlight_pistol","",{"16Rnd_9x21_Mag",17},{},""},
		{"amf_uniform_02_CE_OD",{{"ACE_EarPlugs",30}}},
		{"amf_SMB_FUS_TDF",{}},
		{},
		"AMF_FELIN_05_CE","G_Shades_Black",
		{"ACE_Vector","","","",{},{},""},
		{"ItemMap","ItemGPS","TFAR_anprc152","ItemCompass","ItemWatch",""}
	};

	arsenalItems[] = {
		"amf_mini_mg_01_f",
		"amf_mini_mg_tactical_mk3"
	};
};