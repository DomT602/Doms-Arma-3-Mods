/*
	Written by Dom
	Made by SiegeSix
*/

class Dynamic_Roles {
	#include "Config_Officer.hpp"

	#include "Config_Rifleman.hpp"
	#include "Config_Medic.hpp"
	#include "Config_Engineer.hpp"
	#include "Config_TeamLeader.hpp"
	#include "Config_SquadLeader.hpp"
	#include "Config_Autorifleman.hpp"

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
		"ACE_surgicalKit",

		"ACE_Chemlight_HiBlue", "ACE_Chemlight_HiGreen", "ACE_Chemlight_HiRed", "ACE_Chemlight_HiWhite", "ACE_Chemlight_HiYellow", "ACE_Chemlight_UltraHiOrange",
		"Chemlight_blue", "Chemlight_green", "Chemlight_red", "Chemlight_yellow", "acc_flashlight_pistol", "ACE_Flashlight_XL50", "ACE_Flashlight_MX991", "ACE_Flashlight_KSF1",
		"ACE_Chemlight_IR", "ACE_Chemlight_Orange", "ACE_Chemlight_White", "ACE_Chemlight_Shield", "ACE_Chemlight_Shield_Blue", "ACE_Chemlight_Shield_Green", "ACE_Chemlight_Shield_Orange", "ACE_Chemlight_Shield_Red", "ACE_Chemlight_Shield_White", "ACE_Chemlight_Shield_Yellow",
		"ACE_HandFlare_Green", "ACE_HandFlare_Red", "ACE_HandFlare_White", "ACE_HandFlare_Yellow", "ACE_IR_Strobe_Item",
		"SmokeShell", "SmokeShellBlue", "SmokeShellGreen", "SmokeShellOrange", "SmokeShellPurple", "SmokeShellRed", "SmokeShellYellow",
		"rhs_mag_m67", "MiniGrenade","rhs_mag_an_m14_th3",

		"ACE_RangeTable_82mm", "ACE_artilleryTable", "ACE_RangeCard", "ACE_Tripod", "ACE_ATragMX", "ACE_SpareBarrel", "ACE_SpottingScope", "ACE_Kestrel4500",

		"ItemMap","ItemCompass", "ItemWatch", "ItemGPS", "ACE_Altimeter", "ACE_MapTools", "ACE_CableTie", "ACE_EarPlugs", "ACE_microDAGR", "ACE_DAGR",

		"ToolKit", "ACE_DefusalKit","ACE_wirecutter", "ACE_EntrenchingTool", "ACE_Clacker", "ACE_M26_Clacker", "MineDetector", "ACE_SpraypaintRed", "ACE_SpraypaintGreen", "ACE_SpraypaintBlue", "ACE_SpraypaintBlack",
		"ACE_rope12", "ACE_rope15", "ACE_rope18", "ACE_rope27", "ACE_rope36",

		"B_UavTerminal", "ACE_UAVBattery", "ACE_VectorDay", "ACE_Vector", "Laserdesignator", "Laserbatteries",

		"U_B_Wetsuit", "U_B_survival_uniform","V_RebreatherB", "G_B_Diving", "G_Diving",
		"U_B_PilotCoveralls",

		"V_Rangemaster_belt",

		"B_Carryall_cbr", "B_Kitbag_cbr", "B_AssaultPack_cbr", "B_LegStrapBag_coyote_F", "B_Parachute", "ACE_NonSteerableParachute",

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
		"B_UavTerminal",

		// Uniforms Common
		"UK3CB_GAF_B_U_CombatUniform_05_DIGI",
		"UK3CB_GAF_B_U_CombatUniform_06_DIGI",
		"UK3CB_GAF_B_U_CombatUniform_07_DIGI",
		"UK3CB_GAF_B_U_CombatUniform_08_DIGI",
		"UK3CB_GAF_B_U_SF_CombatUniform_03_MULTICAM",
		"UK3CB_GAF_B_U_SF_CombatUniform_01_MULTICAM",
		"UK3CB_GAF_B_U_SF_CombatUniform_04_MULTICAM",
		"UK3CB_GAF_B_U_SF_CombatUniform_02_MULTICAM",
		"UK3CB_GAF_B_U_SF_CombatSmock_08_MULTICAM_TAN",
		"UK3CB_GAF_B_U_SF_CombatSmock_08_MULTICAM",
		"UK3CB_GAF_B_U_SF_CombatSmock_08_MULTICAM_OLIVE",
		"UK3CB_GAF_B_U_SF_CombatSmock_07_MULTICAM",
		"UK3CB_GAF_B_U_SF_CombatSmock_07_MULTICAM_TAN",
		"UK3CB_GAF_B_U_SF_CombatSmock_07_MULTICAM_OLIVE",
		"UK3CB_GAF_B_U_SF_CombatSmock_04_MULTICAM",
		"UK3CB_GAF_B_U_SF_CombatSmock_03_MULTICAM",

		//Vests Common
		"UK3CB_GAF_B_MBAV_RIFLEMAN_DIGI_OLI",
		"UK3CB_GAF_B_MBAV_RIFLEMAN_DIGI",
		"UK3CB_V_MBAV_RIFLEMAN_MULTI",

		//Backpacks Common
		"UK3CB_GAF_B_B_ASS_DIGI",
		"UK3CB_GAF_B_B_ASS_MULTICAM_02",
		"UK3CB_GAF_B_B_ASS_MULTICAM_01",
		"UK3CB_GAF_B_B_ENG_MULTICAM_02",
		"UK3CB_GAF_B_B_ENG_MULTICAM_01",
		"UK3CB_GAF_B_B_ENG_OLI",
		"UK3CB_GAF_B_B_RIF_DIGI",

		//Helmets Common
		"UK3CB_GAF_B_H_Opscore_Mar_OLI_02",
		"UK3CB_GAF_B_H_Opscore_Mar_TAN_02",
		"UK3CB_GAF_B_H_6b27m_DIGI",
		"UK3CB_GAF_B_H_6b27m_GRN",
		"rhs_6b47",

		//Weapons Common
		//Rifles
		"rhs_weap_m21a",
		"rhs_weap_m21a_pr",
		"rhs_weap_m4a1_carryhandle",
		"rhs_weap_hk416d10_LMT",
		"rhs_weap_hk416d145",
		"rhs_weap_ak74",
		"rhs_weap_ak74_2",
		"rhs_weap_aks74n_2_npz",
		"rhs_weap_mk17_CQC",
		"rhs_weap_m249_pip_S",
		"rhs_weap_m240B",
		"rhs_weap_m16a4",
		"rhs_weap_m14ebrri",
		"rhs_weap_m14_ris",
		"rhs_weap_g36c",
		"rhs_weap_vhsd2_ct15x",
		"rhs_weap_svdp_wd",
		"rhs_weap_svdp_wd_npz",
		"rhs_weap_pkm",
		"arifle_MSBS65_black_F",
		"uk3cb_auga1_carb_tan",
		"UK3CB_ACR_Carbine",
		"UK3CB_MP5N",
		//Rifle Ammo
		"UK3CB_MP5_30Rnd_9x19_Magazine",
		"rhsgref_30rnd_556x45_m21",
		"rhs_mag_30Rnd_556x45_M855A1_Stanag_Pull",,
		"rhs_30Rnd_545x39_7N6M_AK",
		"rhs_30Rnd_545x39_7N22_plum_AK",
		"rhs_mag_20Rnd_SCAR_762x51_m61_ap",
		"rhsusf_200Rnd_556x45_box",
		"rhsusf_100Rnd_556x45_M995_soft_pouch",
		"rhsusf_100Rnd_762x51_m80a1epr",
		"UK3CB_MG3_250rnd_762x51_W",
		"rhsusf_20Rnd_762x51_m118_special_Mag",
		"rhssaf_30rnd_556x45_EPR_G36",
		"rhsgref_30rnd_556x45_vhs2",
		"rhs_10Rnd_762x54mmR_7N14",
		"rhs_100Rnd_762x54mmR",
		"30Rnd_65x39_caseless_msbs_mag",
		"UK3CB_AUG_30Rnd_556x45_Magazine",
		//Attachments
		"rhsusf_acc_rotex5_grey",
		"rhs_acc_perst1ik",
		"rhs_acc_pkas",
		"rhs_acc_pso1m2",
		"rhs_acc_1p78",
		"rhs_acc_pgo7v3",
		"rhsusf_acc_g33_xps3",
		"rhsusf_acc_acog",
		"rhsusf_acc_eotech_552",
		"rhsusf_acc_compm4",
		"rhsusf_acc_su230_mrds",
		"optic_dms",
		"optic_hamr",
		"rhs_acc_1p87",
		"rhsusf_acc_anpeq15side",
		"rhsusf_acc_rvg_blk",
		"rhsusf_acc_tacsac_blue",
		"rhsusf_acc_grip1",
		"rhs_acc_dtk4short",
		"optic_ico_01_black_f",
		//Pistols
		"rhsusf_weap_m9",
		//Pistol Ammo
		"rhsusf_mag_15Rnd_9x19_JHP",

		//Launchers
		"rhs_weap_m72a7"
	};
};