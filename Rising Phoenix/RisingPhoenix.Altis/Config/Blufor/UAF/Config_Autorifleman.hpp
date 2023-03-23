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
		{"rhs_weap_ak74n_2","","rhs_acc_perst1ik","rhs_acc_pkas",{"rhs_30Rnd_545x39_7N22_plum_AK",30},{},""},{},{},{"UK3CB_GAF_B_U_SF_CombatUniform_03_MULTICAM",{{"ACE_fieldDressing",5},{"ACE_elasticBandage",5},{"ACE_packingBandage",5},{"ACE_quikclot",5},{"ACE_CableTie",2},{"ACE_EarPlugs",1},{"ACE_epinephrine",2},{"ACE_Flashlight_XL50",1},{"ACE_morphine",2},{"ACE_splint",2},{"ACE_tourniquet",2}}},{"UK3CB_V_MBAV_RIFLEMAN_MULTI",{{"rhs_30Rnd_545x39_7N22_plum_AK",10,30},{"rhs_mag_m67",2,1},{"SmokeShell",2,1}}},{},"UK3CB_GAF_B_H_Opscore_Mar_TAN_02","",{"ACE_Vector","","","",{},{},""},{"ItemMap","ItemGPS","TFAR_anprc152","ItemCompass","ItemWatch",""}
	};

	arsenalItems[] = {
		"UK3CB_MG3_Railed",
		"rhsusf_acc_eotech_552",
		"UK3CB_MG3_50rnd_762x51_Y",
		"UK3CB_MG3_250rnd_762x51_Y",
		"UK3CB_MG3_100rnd_762x51_Y",
		"UK3CB_MG3_50rnd_762x51_YM",
		"UK3CB_V_MBAV_MG_MULTI",
		"UK3CB_AAF_O_V_Eagle_MG_DIGI_GRN",
		"UK3CB_GAF_B_MBAV_MG_DIGI_OLI_03",
		"UK3CB_GAF_B_MBAV_MG_DIGI_03",
		"UK3CB_GAF_B_MBAV_MG_OLI_02",
		"UK3CB_GAF_B_MBAV_MG_TAN_02"
	};
};