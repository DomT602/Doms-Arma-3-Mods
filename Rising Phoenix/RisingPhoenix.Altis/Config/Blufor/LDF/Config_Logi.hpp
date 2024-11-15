/*
	Faction: Logistics setup
	Author: SiegeSix
*/
class Logi_Setup {
	bluforLightVehicles[] = {
		"UK3CB_LDF_B_BRDM2_HQ",
		"UK3CB_LDF_B_BRDM2",
		"UK3CB_LDF_B_Tigr_FFV",
		"UK3CB_LDF_B_Tigr_STS",
		"UK3CB_LDF_B_M1151_OGPK_M2",
		"UK3CB_LDF_B_M1151_GPK_PKM",
		"UK3CB_LDF_B_M998_4DR",
		"UK3CB_LDF_B_Offroad_AT"
	};

	bluforHeavyVehicles[] = {
		"UK3CB_LDF_B_BMP1",
		"UK3CB_LDF_B_BMP2",
		"UK3CB_LDF_B_Marshall_Cage_Camo",
		"UK3CB_LDF_B_MTLB_Cannon",
		"UK3CB_LDF_B_MTLB_BMP",
		"UK3CB_LDF_B_MTLB_KPVT",
		"UK3CB_LDF_B_Leopard_Cage_Camo",
		"UK3CB_LDF_B_T72BB",
		"UK3CB_LDF_B_T72A",
		"UK3CB_LDF_B_RM70_MG"
	};

	bluforAirVehicles[] = {
		"UK3CB_LDF_B_Mi_24P",
		"UK3CB_LDF_B_Mi8AMTSh",
		"UK3CB_LDF_B_Mi8",
		"UK3CB_LDF_B_L39_PYLON",
		"UK3CB_LDF_B_MIG21",
		"UK3CB_LDF_B_C130J",
		"B_UAV_02_dynamicLoadout_F",
		"C_IDAP_UAV_06_antimine_F",
		"B_UAV_01_F"
	};

	bluforNavalVehicles[] = {
		"UK3CB_MDF_B_RHIB",
		"UK3CB_MDF_B_RHIB_Gunboat",
		"UK3CB_MDF_B_Rubber_Rhib"
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
			{"RHS_M2_MiniTripod_Bag",1},
			{"RHS_M2_Tripod_Bag",1},
			{"RHS_M2_Gun_Bag",1}
		}},
		{"staticWeaponCrateCategory","M240 MMG","large",{
			{"ACE_EarPlugs",2},
			{"UK3CB_Static_M240_Gun_Bag",1},
			{"UK3CB_B_Static_M240_Tripod_High_Bag",1},
			{"UK3CB_B_Static_M240_Tripod_Low_Bag",1}
		}},
		{"lightWeaponCrateCategory","Standard Resupply","medium",{
			{"rhs_mag_30Rnd_556x45_M855A1_Stanag_Pull",35},
			{"rhsusf_200Rnd_556x45_box",8},
			{"UK3CB_ACR_30rnd_556x45_R",35},
			{"rhsusf_100Rnd_556x45_soft_pouch",12},

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