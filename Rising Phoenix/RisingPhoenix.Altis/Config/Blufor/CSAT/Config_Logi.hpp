/*
	Faction: Logistics setup
	Author: Dom
*/
class Logi_Setup {
	bluforLightVehicles[] = {
		"O_Quadbike_01_F",
		"O_Truck_03_transport_F",
		"O_MRAP_02_F",
		"O_MRAP_02_gmg_F",
		"O_MRAP_02_hmg_F",
		"O_LSV_02_unarmed_F",
		"O_LSV_02_armed_F",
		"O_LSV_02_AT_F"
	};

	bluforHeavyVehicles[] = {
		"O_APC_Wheeled_02_rcws_v2_F",
		"O_APC_Tracked_02_cannon_F",
		"O_APC_Tracked_02_AA_F",
		"O_MBT_02_cannon_F",
		"O_MBT_04_cannon_F",
		"O_MBT_04_command_F",
		"O_MBT_02_arty_F"
	};

	bluforAirVehicles[] = {
		"O_UAV_01_F",
		"O_UAV_06_F",
		"O_UAV_02_dynamicLoadout_F",
		"O_T_UAV_04_CAS_F",

		"O_Heli_Light_02_unarmed_F",
		"O_Heli_Light_02_dynamicLoadout_F",

		"O_Heli_Transport_04_covered_F",
		"O_Heli_Transport_04_bench_F",

		"O_Heli_Attack_02_dynamicLoadout_F",

		"O_T_VTOL_02_infantry_dynamicLoadout_F",
		"O_T_VTOL_02_vehicle_dynamicLoadout_F",

		"O_Plane_Fighter_02_F",
		"O_Plane_CAS_02_dynamicLoadout_F"
	};

	bluforNavalVehicles[] = {
		"O_Boat_Armed_01_hmg_F",
		"O_Boat_Transport_01_F",
		"O_SDV_01_F"
	};

	supplyCrateTypes[] = { //crate types to be used below, format {sizeName, classname}
		{"medical","ACE_medicalSupplyCrate_advanced"},
		{"small","Box_East_Ammo_F"},
		{"medium","Box_East_Wps_F"},
		{"large","Box_East_WpsSpecial_F"},
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
			{"ACE_adenosine",10},
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
			{"O_Mortar_01_weapon_F",2},
			{"O_Mortar_01_support_F",2}
		}},
		{"staticWeaponCrateCategory","Mk30 HMG","large",{
			{"ACE_EarPlugs",2},
			{"O_HMG_01_weapon_F",1},
			{"O_HMG_01_high_weapon_F",1},
			{"O_HMG_01_support_F",1},
			{"O_HMG_01_support_high_F",1}
		}},
		{"staticWeaponCrateCategory","Mk32 GMG","large",{
			{"ACE_EarPlugs",2},
			{"O_GMG_01_high_weapon_F",1},
			{"O_GMG_01_weapon_F",1},
			{"O_HMG_01_support_F",1},
			{"O_HMG_01_support_high_F",1}
		}},
		{"lightWeaponCrateCategory","Standard Resupply","medium",{
			{"30Rnd_65x39_caseless_green",25},
			{"10Rnd_762x54_Mag",20},
			{"150Rnd_762x54_Box",10},
			{"100Rnd_580x42_Mag_F",8},

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