/*
	Faction: Marksman
	Author: SiegeSix
*/
class marksman {
	name = "Marksman";
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
		"AMF_SCAR_H_painted",
		"AMF_SCAR_H_02_F",
		
		"amf_SMB_TP_HK417_BME",
		"amf_SMB_TP_HK417_TAN",
		"amf_SMB_TP_HK417_TDF",
		"amf_SMB_TP_SCAR_BME",
		"amf_SMB_TP_SCAR_TAN",
		"amf_SMB_TP_SCAR_TDF",
		"AMF_714_Long_01_F",

		"amf_schmidt_benderx4_tan",
		"amf_schmidt_benderx4",
		"10Rnd_762x51_Mag",
		"optic_lrps",
		
		"AMF_PGM_ULTIMA_RATIO_01_F"
	};
};