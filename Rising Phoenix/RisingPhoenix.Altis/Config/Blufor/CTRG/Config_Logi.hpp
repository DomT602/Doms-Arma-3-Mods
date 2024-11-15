/*
	Faction: Logistics setup
	Author: Dom
*/
class Logi_Setup {
	bluforLightVehicles[] = {
		"B_Quadbike_01_F",
		"B_Truck_01_transport_F",
		"B_MRAP_01_F",
		"B_MRAP_01_gmg_F",
		"B_MRAP_01_hmg_F",
		"B_CTRG_LSV_01_light_F"
	};

	bluforHeavyVehicles[] = {
		"B_UGV_01_rcws_F",
		"B_APC_Tracked_01_CRV_F",
		"B_APC_Wheeled_01_cannon_F",
		"B_APC_Tracked_01_AA_F"
	};

	bluforAirVehicles[] = {
		"B_UAV_01_F",
		"B_UAV_06_F",
		"B_UAV_02_dynamicLoadout_F",
		"B_UAV_05_F",
		"B_T_UAV_03_dynamicLoadout_F",

		"B_Heli_Light_01_F",
		"B_Heli_Light_01_dynamicLoadout_F",

		"B_Heli_Transport_03_F",
		"B_Heli_Transport_01_F",
		"B_CTRG_Heli_Transport_01_sand_F",
		"B_CTRG_Heli_Transport_01_tropic_F",

		"B_T_VTOL_01_infantry_F",
		"B_T_VTOL_01_vehicle_F",
		"B_T_VTOL_01_armed_F",

		"B_Plane_Fighter_01_F",
		"B_Plane_CAS_01_dynamicLoadout_F"
	};

	bluforNavalVehicles[] = {
		"B_Boat_Armed_01_minigun_F",
		"B_Boat_Transport_01_F",
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