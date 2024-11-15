/*
	Faction: UAV Operator
	Author: SiegeSix
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
		{"UK3CB_ACR_Carbine","","rhsusf_acc_anpeq15side_bk","rhsusf_acc_su230",{"UK3CB_ACR_30rnd_556x45",30},{},""},{"rhs_weap_m72a7","","","",{},{},""},{"rhsusf_weap_m9","","","",{"rhsusf_mag_15Rnd_9x19_JHP",15},{},""},{"UK3CB_LDF_B_U_CombatUniform_Shortsleeve_WDL_01",{{"ACE_fieldDressing",5},{"ACE_elasticBandage",5},{"ACE_packingBandage",5},{"ACE_quikclot",5},{"ACE_CableTie",2},{"ACE_EarPlugs",1},{"ACE_epinephrine",2},{"ACE_Flashlight_XL50",1},{"ACE_morphine",2},{"ACE_splint",2},{"ACE_tourniquet",2}}},{"UK3CB_LDF_B_V_RIF_Vest_KKZ10_GEO",{{"rhs_mag_30Rnd_556x45_M855A1_Stanag_Pull",10,30},{"rhs_mag_m67",2,1},{"SmokeShell",2,1},{"rhsusf_mag_15Rnd_9x19_JHP",2,15}}},{},"UK3CB_LDF_B_H_UHB13_GEO","",{"ACE_Vector","","","",{},{},""},{"ItemMap","ItemGPS","TFAR_anprc152","ItemCompass","ItemWatch",""}
	};

	arsenalItems[] = {

	};
};