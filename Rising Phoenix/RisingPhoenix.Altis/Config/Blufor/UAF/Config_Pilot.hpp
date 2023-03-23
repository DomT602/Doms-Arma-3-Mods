/*
	Faction: Pilot
	Author: SiegeSix
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
		{"rhs_weap_ak74n_2","","rhs_acc_perst1ik","rhs_acc_pkas",{"rhs_30Rnd_545x39_7N22_plum_AK",30},{},""},{},{},{"UK3CB_GAF_B_U_SF_CombatUniform_03_MULTICAM",{{"ACE_fieldDressing",5},{"ACE_elasticBandage",5},{"ACE_packingBandage",5},{"ACE_quikclot",5},{"ACE_CableTie",2},{"ACE_EarPlugs",1},{"ACE_epinephrine",2},{"ACE_Flashlight_XL50",1},{"ACE_morphine",2},{"ACE_splint",2},{"ACE_tourniquet",2}}},{"UK3CB_V_MBAV_RIFLEMAN_MULTI",{{"rhs_30Rnd_545x39_7N22_plum_AK",10,30},{"rhs_mag_m67",2,1},{"SmokeShell",2,1}}},{},"UK3CB_GAF_B_H_Opscore_Mar_TAN_02","",{"ACE_Vector","","","",{},{},""},{"ItemMap","ItemGPS","TFAR_anprc152","ItemCompass","ItemWatch",""}

	};

	arsenalItems[] = {
		"UK3CB_V_MBAV_LIGHT_MULTI",
		"UK3CB_V_MBAV_LIGHT_OLI",
		"UK3CB_GAF_B_MBAV_LIGHT_DIGI_OLI",
		"UK3CB_GAF_B_MBAV_LIGHT_DIGI",
		"UK3CB_AAF_O_V_Eagle_CREW_DIGI_GRN",
		"UK3CB_AAF_B_U_J_Pilot_NATO",
		"H_PilotHelmetFighter_O",
		"H_PilotHelmetHeli_O",
		"rhs_gssh18",
		"rhs_zsh7a_mike_green_alt",
		"UK3CB_GAF_B_B_RIF_Radio_TAN",
		"UK3CB_GAF_B_B_RIF_Radio_DIGI",
		"UK3CB_GAF_B_B_RIF_Radio_OLI"
	};
};