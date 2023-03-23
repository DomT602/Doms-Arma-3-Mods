/*
	Faction: Rifleman
	Author: SiegeSix
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
		{"rhs_weap_ak74n_2","","rhs_acc_perst1ik","rhs_acc_pkas",{"rhs_30Rnd_545x39_7N22_plum_AK",30},{},""},{},{},{"UK3CB_GAF_B_U_SF_CombatUniform_03_MULTICAM",{{"ACE_fieldDressing",5},{"ACE_elasticBandage",5},{"ACE_packingBandage",5},{"ACE_quikclot",5},{"ACE_CableTie",2},{"ACE_EarPlugs",1},{"ACE_epinephrine",2},{"ACE_Flashlight_XL50",1},{"ACE_morphine",2},{"ACE_splint",2},{"ACE_tourniquet",2}}},{"UK3CB_V_MBAV_RIFLEMAN_MULTI",{{"rhs_30Rnd_545x39_7N22_plum_AK",10,30},{"rhs_mag_m67",2,1},{"SmokeShell",2,1}}},{},"UK3CB_GAF_B_H_Opscore_Mar_TAN_02","",{"ACE_Vector","","","",{},{},""},{"ItemMap","ItemGPS","TFAR_anprc152","ItemCompass","ItemWatch",""}

	};

	arsenalItems[] = {
		"rhs_weap_maaws",
		"rhs_optic_maaws",
		"rhs_mag_maaws_HEAT",
		"rhs_mag_maaws_HEDP",
		"rhs_mag_maaws_HE",
		"MRAWS_HEAT_F",
		"MRAWS_HE_F",
		"rhs_weap_M136_hedp",
		"rhs_weap_rpg7",
		"rhs_acc_pgo7v3",
		"rhs_rpg7_PG7VL_mag",
		"rhs_rpg7_TBG7V_mag",
		"rhs_rpg7_OG7V_mag"
	};
};