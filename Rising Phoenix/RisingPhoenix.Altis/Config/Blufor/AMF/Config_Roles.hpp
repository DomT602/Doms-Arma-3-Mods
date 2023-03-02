class Dynamic_Roles {
	#include "Config_Officer.hpp"

	#include "Config_Rifleman.hpp"
	#include "Config_Medic.hpp"
	#include "Config_Engineer.hpp"
	#include "Config_TeamLeader.hpp"
	#include "Config_SquadLeader.hpp"
	#include "Config_Marksman.hpp"

	#include "Config_Pilot.hpp"
	#include "Config_UAVOp.hpp"

	#include "Config_Crewman.hpp"
	#include "Config_Commander.hpp"
};

class Common_Arsenal {
	items[] = {
		"ACE_adenosine", "ACE_epinephrine", "ACE_morphine",
		"ACE_fieldDressing", "ACE_elasticBandage", "ACE_packingBandage", "ACE_quikclot",
		"ACE_bloodIV", "ACE_bloodIV_250", "ACE_bloodIV_500",
		"ACE_plasmaIV", "ACE_plasmaIV_250", "ACE_plasmaIV_500",
		"ACE_salineIV", "ACE_salineIV_250", "ACE_salineIV_500",
		"ACE_tourniquet", "ACE_splint",
		"ACE_surgicalKit", "ACE_Canteen",

		"ACE_Chemlight_HiBlue", "ACE_Chemlight_HiGreen", "ACE_Chemlight_HiRed", "ACE_Chemlight_HiWhite", "ACE_Chemlight_HiYellow", "ACE_Chemlight_UltraHiOrange",
		"Chemlight_blue", "Chemlight_green", "Chemlight_red", "Chemlight_yellow", "acc_flashlight_pistol", "ACE_Flashlight_XL50", "ACE_Flashlight_MX991", "ACE_Flashlight_KSF1",
		"ACE_Chemlight_IR", "ACE_Chemlight_Orange", "ACE_Chemlight_White", "ACE_Chemlight_Shield", "ACE_Chemlight_Shield_Blue", "ACE_Chemlight_Shield_Green", "ACE_Chemlight_Shield_Orange", "ACE_Chemlight_Shield_Red", "ACE_Chemlight_Shield_White", "ACE_Chemlight_Shield_Yellow",
		"ACE_HandFlare_Green", "ACE_HandFlare_Red", "ACE_HandFlare_White", "ACE_HandFlare_Yellow", "ACE_IR_Strobe_Item",
		"SmokeShell", "SmokeShellBlue", "SmokeShellGreen", "SmokeShellOrange", "SmokeShellPurple", "SmokeShellRed", "SmokeShellYellow",
		"rhs_mag_m67", "MiniGrenade", "rhs_mag_mk84",

		"ACE_RangeTable_82mm", "ACE_artilleryTable", "ACE_RangeCard", "ACE_Tripod", "ACE_ATragMX", "ACE_SpareBarrel", "ACE_SpottingScope", "ACE_Kestrel4500",

		"ItemMap","ItemCompass", "ItemWatch", "ItemGPS", "ACE_Altimeter", "ACE_MapTools", "ACE_CableTie", "ACE_EarPlugs", "ACE_microDAGR", "ACE_DAGR",

		"ToolKit", "ACE_DefusalKit","ACE_wirecutter", "ACE_EntrenchingTool", "ACE_Clacker", "ACE_M26_Clacker", "MineDetector", "ACE_SpraypaintRed", "ACE_SpraypaintGreen", "ACE_SpraypaintBlue", "ACE_SpraypaintBlack",
		"ACE_rope12", "ACE_rope15", "ACE_rope18", "ACE_rope27", "ACE_rope36",

		"ACE_UAVBattery", "ACE_VectorDay", "ACE_Vector", "Laserdesignator", "Laserbatteries",

		"U_B_Wetsuit", "U_B_survival_uniform","V_RebreatherB", "G_B_Diving", "G_Diving",
		"U_B_PilotCoveralls",
		
		"DemoCharge_Remote_Mag",
		"SatchelCharge_Remote_Mag",
		"B_IR_Grenade",

		"ACE_NVG_Wide_Black",
		"ACE_NVG_Wide",
		"ACE_NVG_Wide_Green",
		"ACE_NVG_Gen4_Green",
		"ACE_NVG_Gen4",
		"ACE_NVG_Gen4_Black",

		"Binocular",
		"Laserdesignator",
		"Laserdesignator_03",
		"ACE_Vector",
		"ItemMap",
		"ItemCompass",
		"TFAR_anprc152",
		"ACE_Altimeter",
		"ItemWatch",
		"ItemGPS",

		"amf_uniform_01_CE_OD",
		"amf_uniform_01_CE_OD_2",
		"amf_uniform_02_CE_OD",
		"amf_uniform_02_CE_OD_2",
		"amf_uniform_03_MTP",
		"amf_uniform_03_MTP_2",
		"amf_uniform_01_DA",
		"amf_uniform_01_DA_2",
		"amf_uniform_02_DA",
		"amf_uniform_02_DA_2",
		
		"amf_SMB_FUS_BME",
		"amf_SMB_FUS_TAN",
		"amf_SMB_FUS_TDF",
		"amf_SMB_FUS_FAMAS_TAN",
		"amf_SMB_FUS_FAMAS_TDF",
		"amf_SMB_GRE_BME",
		"amf_SMB_GRE_TAN",
		"amf_SMB_GRE_TDF",
		"amf_SMB_GRE_FAMAS_TAN",
		"amf_SMB_GRE_FAMAS_TDF",
		"amf_SMB_LEADER_BME",
		"amf_SMB_LEADER_TAN",
		"amf_SMB_LEADER_TDF",
		"amf_SMB_AUXSAN_BME",
		"amf_SMB_AUXSAN_TAN",
		"amf_SMB_AUXSAN_TDF",
		
		"AMF_rush24_01_MTP",
		"AMF_rush24_01_TAN",
		"AMF_rush24_01_TDF",
		"AMF_Bergen_F2",
		"AMF_Bergen_F2_DA",
		"AMF_FELIN_BACKPACK",
		"AMF_FELIN_BACKPACK_TAN",
		"AMF_FELIN_BACKPACK_MEDIC",
		"AMF_FELIN_BACKPACK_TAN_MEDIC",
		"TFAR_rt1523g_sage",
		"B_Parachute",
		
		"AMF_FELIN_05_CE",
		"AMF_FELIN_05_TAN",
		"AMF_FELIN_L05_CE",
		"AMF_FELIN_L05_TAN",
		"AMF_FELIN_06_CE",
		"AMF_FELIN_06_TAN",
		"AMF_FELIN_L06_CE",
		"AMF_FELIN_L06_TAN",
		
		"AMF_Samas_F1_01_F",
		"AMF_Samas_FELIN_01_F",
		"AMF_Samas_G2_01_F",
		"AMF_Samas_VALO_01_F",
		"AMF_614_short_01_F",
		"AMF_614_long_HK269_01_F",
		
		"rhsusf_acc_g33_xps3",
		"rhsusf_acc_su230",
		"rhsusf_acc_compm4",
		"rhsusf_acc_eotech_552",
		"amf_wmx200",
		"amf_an_peq_15_black",
		"amf_an_peq_15_tan",
		"amf_rotex_v",
		"amf_acc_614_grip3",
		"amf_acc_614_grip2",
		
		"ACE_30Rnd_556x45_Stanag_Mk262_mag",
		"ACE_30Rnd_556x45_Stanag_Mk318_mag",
		"rhs_mag_30Rnd_556x45_Mk262_Stanag",
		"rhs_mag_30Rnd_556x45_Mk318_Stanag",
		"rhs_mag_M433_HEDP",
		"rhs_mag_M583A1_white",
		"rhs_mag_M585_white_cluster",
		"rhs_mag_m713_Red",
		"rhs_mag_m714_White",
		"rhs_mag_m715_Green",
		"rhs_mag_m716_yellow",
		"ACE_HuntIR_M203",
		"ACE_HuntIR_monitor",
		"bipod_01_f_snd",
		"muzzle_snds_b",
		"20Rnd_762x51_Mag",
		"20Rnd_762x51_HK417_mag",
		"bipod_01_f_blk",
		"rhsusf_acc_aac_762sdn6_silencer",
		"30Rnd_9x19_mag",
		"150Rnd_MINI_MG_mag",
		"30Rnd_556x45_Stanag",
		"25Rnd_samas_f1_mag",
		"ACE_40mm_Flare_ir",
		"ACE_40mm_Flare_white",
		"ACE_40mm_Flare_green",
		"ACE_40mm_Flare_red",
		
		"AMF_Glock_17_TAN",
		"acc_flashlight_pistol",
		"16Rnd_9x21_Mag",
		
		"ACE_VMH3",
		"ACE_VMM3",
		"AMF_RFG_AC58",
		"AMF_RFG_APAV40",
		
		"amf_balaclava_ranger",
		"amf_balaclava_blk",
		"amf_balaclava_goggles_blk",
		"amf_balaclava_goggles_ranger",
		"G_Shades_Black",
		"ACE_NVG_Wide_Black",
		"ACE_NVG_Wide",
		"rhsusf_ANPVS_15"
	};
};