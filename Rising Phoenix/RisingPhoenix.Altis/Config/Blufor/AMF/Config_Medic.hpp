/*
	Faction: Medic
	Author: Dom
*/
class medic {
	name = $STR_B_MEDIC_F0;
	rank = "Corporal";
	description = $STR_DT_Medic_Description;
	traits[] = {
		{"Medic",true}
	};
	customVariables[] = {
		{"ace_medical_medicClass",2,true}
	};
	icon = "a3\ui_f\data\map\vehicleicons\iconManMedic_ca.paa";

	defaultLoadout[] = {
		{"AMF_614_long_01_F","","AMF_AN_PEQ_15_black","rhsusf_acc_su230",{"ACE_30Rnd_556x45_Stanag_Mk318_mag",30},{},""},
		{},
		{"AMF_Glock_17_TAN","","","",{"16Rnd_9x21_Mag",17},{},""},
		{"amf_uniform_02_CE_OD",{{"ACE_fieldDressing",4},{"ACE_elasticBandage",4},{"ACE_packingBandage",4},{"ACE_quikclot",4},{"ACE_EarPlugs",1},{"ACE_epinephrine",2},{"ACE_morphine",2},{"ACE_Flashlight_XL50",1},{"ACE_tourniquet",2},{"ACE_CableTie",4}}},
		{"amf_SMB_FUS_TAN",{{"ACE_30Rnd_556x45_Stanag_Mk318_mag",10,30},{"rhs_mag_m67",2,1},{"SmokeShell",2,1},{"SmokeShellBlue",2,1},{"16Rnd_9x21_Mag",3,17}}},
		{"AMF_rush24_01_TAN",{{"ACE_epinephrine",10},{"ACE_bloodIV",7},{"ACE_bloodIV_500",8},{"ACE_fieldDressing",30},{"ACE_elasticBandage",25},{"ACE_packingBandage",30},{"ACE_quikclot",25},{"ACE_morphine",10},{"ACE_surgicalKit",1},{"ACE_splint",10},{"ACE_tourniquet",5}}},
		"AMF_FELIN_05_CE","",{"ACE_Vector","","","",{},{},""},
		{"ItemMap","ItemGPS","TFAR_anprc152","ItemCompass","ItemWatch",""}
	};

	arsenalItems[] = {
		
	};
};