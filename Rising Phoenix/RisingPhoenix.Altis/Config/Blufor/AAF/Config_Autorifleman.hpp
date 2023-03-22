/*
	Faction: Rifleman
	Author: SiegeSix
*/
class autorifleman {
	name = "Autorifleman";
	rank = "Private";
	description = $STR_DT_Rifleman_Description;
	traits[] = {

	};
	customVariables[] = {

	};
	icon = "a3\ui_f\data\map\vehicleicons\iconManMG_ca.paa";

	defaultLoadout[] = {
		{"UK3CB_G3A3V","","","",{"ACE_20Rnd_762x51_M993_AP_Mag",20},{},""},{"rhs_weap_m72a7","","","",{},{},""},{"rhsusf_weap_m9","","","",{"rhsusf_mag_15Rnd_9x19_JHP",15},{},""},{"UK3CB_AAF_B_U_CombatUniform_Shortsleeve_DIGI_BRN",{{"ACE_fieldDressing",5},{"ACE_elasticBandage",5},{"ACE_packingBandage",5},{"ACE_quikclot",5},{"ACE_CableTie",2},{"ACE_EarPlugs",1},{"ACE_epinephrine",2},{"ACE_Flashlight_XL50",1},{"ACE_IR_Strobe_Item",2},{"ACE_splint",2},{"ACE_tourniquet",2}}},{"UK3CB_AAF_O_V_Eagle_RIF_DIGI_BRN",{{"20Rnd_762x51_Mag",8,20},{"rhsusf_mag_15Rnd_9x19_JHP",2,15},{"rhs_mag_m67",2,1},{"SmokeShell",2,1},{"SmokeShellBlue",2,1}}},{},"UK3CB_AAF_I_H_MKVI_Helmet_A_BRN","",{"ACE_Vector","","","",{},{},""},{"ItemMap","ItemGPS","TFAR_anprc152","ItemCompass","ItemWatch",""}
	};

	arsenalItems[] = {
		"UK3CB_MG3_Railed",
		"rhsusf_acc_eotech_552",
		"UK3CB_MG3_50rnd_762x51_Y",
		"UK3CB_MG3_250rnd_762x51_Y",
		"UK3CB_MG3_100rnd_762x51_Y",
		"UK3CB_MG3_50rnd_762x51_YM",
		"UK3CB_AAF_O_V_Eagle_MG_DIGI_BRN",
		"UK3CB_AAF_O_V_Eagle_MG_DIGI_GRN"
	};
};