/*
	Faction: Logistics setup
	Author: SiegeSix
*/
class Logi_Setup {
	bluforLightVehicles[] = {
		"B_Quadbike_01_F",
		"rhsusf_m998_d_4dr",
		"rhsusf_M1238A1_socom_d",
		"rhsusf_M1238A1_M2_socom_d",
		"rhsusf_M1238A1_Mk19_socom_d",
		"rhsusf_M1239_M2_Deploy_socom_d",
		"rhsusf_M1239_MK19_Deploy_socom_d",
		"rhsusf_m1245_m2crows_socom_d",
		"rhsusf_m1245_mk19crows_socom_d",
		"rhsusf_M1078A1R_SOV_M2_D_fmtv_socom",
		"rhsusf_m1240a1_mk19_uik_usarmy_d",
		"rhsusf_m1240a1_m240_uik_usarmy_d",
		"rhsusf_m1240a1_m2_uik_usarmy_d",
		"rhsusf_m1165a1_gmv_mk19_m240_socom_d",
		"rhsusf_m1165a1_gmv_m2_m240_socom_d",
		"rhsusf_m1165a1_gmv_m134d_m240_socom_d",
		"rhsusf_mrzr4_d"
	};

	bluforHeavyVehicles[] = {
		"rhsusf_stryker_m1127_m2_d",
		"rhsusf_stryker_m1132_m2_d",
		"rhsusf_m1a2sep1tuskiid_usarmy",
		"rhsusf_m1a2sep2d_usarmy"
	};

	bluforAirVehicles[] = {
		"RHS_MELB_MH6M",
		"RHS_UH60M_d",
		"RHS_CH_47F_10",
		"RHS_MELB_AH6M",
		"RHS_AH64D",

		"RHS_A10",
		"RHS_C130J",

		"B_UAV_05_F",
		"B_UAV_02_dynamicLoadout_F"
	};

	bluforNavalVehicles[] = {
		"B_Boat_Transport_01_F",
		"rhsusf_mkvsoc",
		"B_SDV_01_F"
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
		{"staticWeaponCrateCategory","Mk30 HMG","large",{
			{"ACE_EarPlugs",2},
			{"B_HMG_01_weapon_F",1},
			{"B_HMG_01_high_weapon_F",1},
			{"B_HMG_01_support_F",1},
			{"B_HMG_01_support_high_F",1}
		}},
		{"staticWeaponCrateCategory","Mk32 GMG","large",{
			{"ACE_EarPlugs",2},
			{"B_GMG_01_high_weapon_F",1},
			{"B_GMG_01_weapon_F",1},
			{"B_HMG_01_support_F",1},
			{"B_HMG_01_support_high_F",1}
		}},
		{"lightWeaponCrateCategory","Standard Resupply","medium",{
			{"30Rnd_65x39_caseless_mag",25},
			{"30Rnd_556x45_Stanag_Sand",25},
			{"20Rnd_762x51_Mag",20},
			{"100Rnd_65x39_caseless_mag",10},
			{"150Rnd_556x45_Drum_Mag_F",8},
						
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