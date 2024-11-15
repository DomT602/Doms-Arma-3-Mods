/*
	Faction: Logistics setup
	Author: Dom
*/
class Logi_Setup {
	bluforLightVehicles[] = {
		"B_Quadbike_01_F",
		"AMF_GBC180_PERS_01",
		"amf_pvp_01_mag_CE_f",
		"amf_pvp_01_top_CE_f",
		"B_AMF_VAB_ULTIMA_X8_F",
		"B_AMF_VAB_ULTIMA_TOP_X8_F",
		"AMF_VBMR_L_CE_01"
	};

	bluforHeavyVehicles[] = {
		"AMF_VBMR_HMG_CE",
		"B_AMF_AMX10_RCR_01_F",
		"B_AMF_AMX10_RCR_SEPAR_01_F",
		"AMF_EBRC_CE_01",
		"AMF_VBCI_CE_01_F",
		"B_AMF_TANK_01",
		"B_AMF_TANK_CE_02_F"
	};

	bluforAirVehicles[] = {
		"AMF_panther_FRA",
		"AMF_gazelle_afte_f",
		"amf_cougar",
		"B_AMF_Heli_Transport_4RHFS_01_F",
		"amf_nh90_tth_transport",

		"AMF_gazelle_minigun_f",
		"AMF_TIGRE_01",

		"B_AMF_REAPER_dynamicLoadout_F",
		"B_AMF_PLANE_TRANSPORT_01_F",

		"B_AMF_PLANE_FIGHTER_02_F",
		"AMF_RAFALE_M_01_F"
	};

	bluforNavalVehicles[] = {
		"B_Boat_Transport_01_F"
	};

	supplyCrateTypes[] = { //crate types to be used below, format {sizeName, classname}
		{"medical","ACE_medicalSupplyCrate_advanced"},
		{"small","Box_NATO_Ammo_F"},
		{"medium","Box_NATO_Wps_F"},
		{"large","Box_NATO_WpsSpecial_F"},
	};
	//categories supported: medicalCrateCategory,lightWeaponCrateCategory,heavyWeaponCrateCategory,staticWeaponCrateCategory,miscWeaponCrateCategory
	supplyCrates[] = { //format {"category","title","box size",{contents}}
		{"medicalCrateCategory","Medical Crate","medical",{
			{"ACE_EarPlugs",10},
			{"ACE_packingBandage",50},
			{"ACE_fieldDressing",50},
			{"ACE_quikclot",50},
			{"ACE_elasticBandage",50},
			{"ACE_tourniquet",20},
			{"ACE_morphine",20},
			{"ACE_epinephrine",10},
			{"ACE_splint",20},
			{"ACE_salineIV",5},
			{"ACE_salineIV_500",8},
			{"ACE_salineIV_250",10},
			{"ACE_surgicalKit",5}
		}},
		{"medicalCrateCategory","Advanced Medical Crate","medical",{
			{"ACE_EarPlugs",10},
			{"ACE_packingBandage",100},
			{"ACE_fieldDressing",100},
			{"ACE_quikclot",100},
			{"ACE_elasticBandage",100},
			{"ACE_tourniquet",40},
			{"ACE_morphine",40},
			{"ACE_epinephrine",20},
			{"ACE_splint",40},
			{"ACE_salineIV",10},
			{"ACE_salineIV_500",16},
			{"ACE_salineIV_250",20},
			{"ACE_plasmaIV",10},
			{"ACE_plasmaIV_500",16},
			{"ACE_plasmaIV_250",20},
			{"ACE_bloodIV",10},
			{"ACE_bloodIV_500",16},
			{"ACE_bloodIV_250",20},
			{"ACE_surgicalKit",10}
		}},
		{"staticWeaponCrateCategory","Mk6 Mortar","large",{
			{"ACE_EarPlugs",2},
			{"ACE_MapTools",2},
			{"ACE_Vector",2},
			{"ACE_artilleryTable",2},
			{"B_Mortar_01_weapon_F",2},
			{"B_Mortar_01_support_F",2}
		}},
		{"staticWeaponCrateCategory","M2 HMG","large",{
			{"ACE_EarPlugs",2},
			{"I_G_HMG_02_high_weapon_F",1},
			{"I_G_HMG_02_weapon_F",1},
			{"I_G_HMG_02_support_high_F",1},
			{"I_C_HMG_02_support_F",1}
		}},
		{"lightWeaponCrateCategory","Standard Resupply","medium",{
			{"ACE_30Rnd_556x45_Stanag_Mk262_mag",25},
			{"ACE_30Rnd_556x45_Stanag_Mk318_mag",25},
			{"20Rnd_762x51_HK417_mag",20},
			{"150Rnd_MINI_MG_mag",10},
			{"20Rnd_762x51_Mag",20},

			{"HandGrenade",6},
			{"MiniGrenade",6},
			{"SmokeShell",4},
			{"SmokeShellBlue",4},
			{"SmokeShellOrange",4},
			{"1Rnd_HE_Grenade_shell",10},
			{"UGL_FlareGreen_F",10},
			{"UGL_FlareYellow_F",10},
			{"1Rnd_Smoke_Grenade_shell",5},
			{"1Rnd_SmokeRed_Grenade_shell",5}
		}},
		{"miscWeaponCrateCategory","Explosives","small",{
			{"DemoCharge_Remote_Mag",6},
			{"ACE_Clacker",2},
			{"ACE_DefusalKit",2},
			{"MineDetector",2}
		}},
		{"miscWeaponCrateCategory","Empty Crate (Small)","small",{

		}},
		{"miscWeaponCrateCategory","Empty Crate (Medium)","medium",{

		}}
	};
};