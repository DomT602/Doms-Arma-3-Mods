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
		"UK3CB_LDF_B_U_CombatUniform_GEO",
		"UK3CB_LDF_B_U_CombatUniform_Shortsleeve_WDL_01",
		"UK3CB_LDF_B_U_CombatUniform_WDL_01",
		"U_I_E_Uniform_01_sweater_F",

		//Vests Common
		"UK3CB_LDF_B_V_RIF_ALT_Vest_KKZ10_GEO",
		"UK3CB_LDF_B_V_RIF_ALT_Vest_KKZ10_OLI",
		"UK3CB_LDF_B_V_RIF_Vest_KKZ10_GEO",
		"UK3CB_LDF_B_V_RIF_Vest_KKZ10_OLI",

		//Backpacks Common
		"UK3CB_LDF_B_B_ASS_GEO",
		"UK3CB_LDF_B_B_ASS_OLI",
		"UK3CB_LDF_B_B_ASS_WDL",
		"B_Kitbag_rgr",
		"B_Kitbag_sgg",

		//Helmets Common
		"UK3CB_LDF_B_H_HB97_GEO",
		"UK3CB_LDF_B_H_HB97_ESS_GEO",
		"UK3CB_LDF_B_H_HB97_ESS_Cover_GEO",
		"UK3CB_LDF_B_H_UHB13_GEO",
		"UK3CB_LDF_B_H_UHB13_Headset_GEO",

		//Weapons Common
		//Rifles
		"UK3CB_ACR_Carbine",
		"UK3CB_ACR_Crew",
		"UK3CB_ACR_Rifle",
		"UK3CB_ACR_Rifle_Long",
		//Rifle Ammo
		"UK3CB_ACR_30rnd_556x45_R",
		"rhs_mag_30Rnd_556x45_M855A1_Stanag_Pull",
		//Attachments
		"rhsusf_acc_eotech_552",
		"rhsusf_acc_acog",
		"rhsusf_acc_g33_t1",
		"rhsusf_acc_su230",
		"rhsusf_acc_anpeq15side_bk",
		"rhsusf_acc_rotex5_grey",
		//Pistols
		"rhsusf_weap_m9",
		//Pistol Ammo
		"rhsusf_mag_15Rnd_9x19_JHP",

		//Launchers
		"rhs_weap_m72a7"
	};
};