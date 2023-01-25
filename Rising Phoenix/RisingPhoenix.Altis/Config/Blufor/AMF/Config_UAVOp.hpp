/*
	Faction: UAV Operator
	Author: Dom
*/
class uavop {
	name = $STR_A3_B_SOLDIER_UAV_F0;
	rank = "Sergeant";
	description = $STR_DT_UAVOp_Description;
	traits[] = {
		{"UAVHacker",true}
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
		"B_UavTerminal"
	};
};