/*
	Faction: Logistics setup
	Author: Dom
*/
class Logi_Setup {
	bluforLightVehicles[] = {
		"UK3CB_BAF_LandRover_Soft_Green_A",
		"UK3CB_BAF_LandRover_Soft_FFR_Green_A",
		"UK3CB_BAF_LandRover_Hard_Green_A",
		"UK3CB_BAF_LandRover_Hard_FFR_Green_A",
		"UK3CB_BAF_LandRover_Snatch_Green_A",
		"UK3CB_BAF_LandRover_Snatch_FFR_Green_A",

		"UK3CB_BAF_LandRover_WMIK_GPMG_Green_A",
		"UK3CB_BAF_LandRover_WMIK_GPMG_FFR_Green_A",
		"UK3CB_BAF_LandRover_WMIK_HMG_Green_A",
		"UK3CB_BAF_LandRover_WMIK_HMG_FFR_Green_A",
		"UK3CB_BAF_LandRover_WMIK_GMG_Green_A",
		"UK3CB_BAF_LandRover_WMIK_GMG_FFR_Green_A",
		"UK3CB_BAF_LandRover_WMIK_Milan_Green_A",
		"UK3CB_BAF_LandRover_WMIK_Milan_FFR_Green_A",

		"UK3CB_BAF_Jackal2_L111A1_G",
		"UK3CB_BAF_Jackal2_L134A1_G",

		"UK3CB_BAF_Coyote_Passenger_L111A1_G",
		"UK3CB_BAF_Coyote_Passenger_L134A1_G",
		"UK3CB_BAF_Coyote_Logistics_L111A1_G",
		"UK3CB_BAF_Coyote_Logistics_L134A1_G",

		"UK3CB_BAF_Husky_Passenger_GPMG_Green",
		"UK3CB_BAF_Husky_Passenger_HMG_Green",
		"UK3CB_BAF_Husky_Passenger_GMG_Green",
		"UK3CB_BAF_Husky_Logistics_GPMG_Green",
		"UK3CB_BAF_Husky_Logistics_HMG_Green",
		"UK3CB_BAF_Husky_Logistics_GMG_Green",
		"UK3CB_BAF_Panther_GPMG_Green_A",

		"UK3CB_BAF_MAN_HX60_Cargo_Green_A",
		"UK3CB_BAF_MAN_HX60_Transport_Green",
		"UK3CB_BAF_MAN_HX58_Cargo_Green_A",
		"UK3CB_BAF_MAN_HX58_Transport_Green"
	};

	bluforHeavyVehicles[] = {
		"UK3CB_BAF_FV432_Mk3_GPMG_Green",
		"UK3CB_BAF_FV432_Mk3_RWS_Green",
		"UK3CB_BAF_Warrior_A3_W",
		"UK3CB_BAF_Warrior_A3_W_Camo",
		"UK3CB_BAF_Warrior_A3_W_Cage",
		"UK3CB_BAF_Warrior_A3_W_Cage_Camo"
	};

	bluforAirVehicles[] = {
		"B_UAV_01_F",
		"B_UAV_06_F",
		"UK3CB_BAF_MQ9_Reaper",

		"UK3CB_BAF_Wildcat_AH1_CAS_6A",
		"UK3CB_BAF_Wildcat_AH1_CAS_6B",
		"UK3CB_BAF_Wildcat_AH1_CAS_6C",
		"UK3CB_BAF_Wildcat_AH1_CAS_6D",
		"UK3CB_BAF_Wildcat_AH1_HEL_6A",

		"UK3CB_BAF_Wildcat_AH1_TRN_8A",
		"UK3CB_BAF_Wildcat_AH1_CAS_8A",
		"UK3CB_BAF_Wildcat_AH1_CAS_8B",
		"UK3CB_BAF_Wildcat_AH1_CAS_8C",
		"UK3CB_BAF_Wildcat_AH1_CAS_8D",
		"UK3CB_BAF_Wildcat_AH1_HEL_8A",

		"UK3CB_BAF_Merlin_HC3_18",
		"UK3CB_BAF_Merlin_HC3_24",
		"UK3CB_BAF_Merlin_HC3_32",
		"UK3CB_BAF_Merlin_HC3_Cargo",
		"UK3CB_BAF_Merlin_HC4_CSAR",

		"UK3CB_BAF_Apache_AH1"
	};

	bluforNavalVehicles[] = {
		"B_Boat_Transport_01_F",
		"UK3CB_BAF_RHIB_GPMG",
		"UK3CB_BAF_RHIB_HMG"
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
		{"staticWeaponCrateCategory","M6 Mortar","large",{
			{"ACE_EarPlugs",2},
			{"ACE_MapTools",2},
			{"ACE_Vector",2},
			{"UK3CB_BAF_M6",1},
			{"UK3CB_BAF_1Rnd_60mm_Mo_Shells",20},
			{"UK3CB_BAF_1Rnd_60mm_Mo_Smoke_White",10},
			{"UK3CB_BAF_1Rnd_60mm_Mo_AB_Shells",10},
			{"UK3CB_BAF_1Rnd_60mm_Mo_Flare_White",10},
			{"UK3CB_BAF_1Rnd_60mm_Mo_WPSmoke_White",10}
		}},
		{"staticWeaponCrateCategory","L16 Mortar","large",{
			{"ACE_EarPlugs",2},
			{"ACE_MapTools",2},
			{"ACE_Vector",2},
			{"UK3CB_BAF_L16",1},
			{"UK3CB_BAF_L16_Tripod",1},
			{"UK3CB_BAF_1Rnd_81mm_Mo_Shells",10},
			{"UK3CB_BAF_1Rnd_81mm_Mo_Smoke_White",5},
			{"UK3CB_BAF_1Rnd_81mm_Mo_WPSmoke_White",5},
			{"UK3CB_BAF_1Rnd_81mm_Mo_Flare_White",5},
			{"UK3CB_BAF_1Rnd_81mm_Mo_IRFlare_White",5}
		}},
		{"staticWeaponCrateCategory","L111A1 HMG","large",{
			{"ACE_EarPlugs",2},
			{"UK3CB_BAF_L111A1",1},
			{"UK3CB_BAF_Tripod",1},
			{"UK3CB_BAF_127_100Rnd",5}
		}},
		{"staticWeaponCrateCategory","L134A1 HMG","large",{
			{"ACE_EarPlugs",2},
			{"UK3CB_BAF_L134A1",1},
			{"UK3CB_BAF_Tripod",1},
			{"UK3CB_BAF_32Rnd_40mm_G_Box",5}
		}},
		{"lightWeaponCrateCategory","Light AT","medium",{
			{"ACE_EarPlugs",2},
			{"ACE_Vector",2},
			{"rhs_weap_M136_hp",4},
			{"rhs_weap_M136",4},
			{"rhs_weap_M136_hedp",2}
		}},
		{"lightWeaponCrateCategory","Standard Resupply","medium",{
			{"UK3CB_BAF_556_30Rnd",20},
			{"UK3CB_BAF_556_30Rnd_T",10},
			{"UK3CB_BAF_762_L42A1_20Rnd",20},
			{"UK3CB_BAF_762_L42A1_20Rnd_T",10},
			{"UK3CB_BAF_338_5Rnd",10},
			{"UK3CB_BAF_338_5Rnd_Tracer",5},
			{"UK3CB_BAF_556_200Rnd",5},		
			{"UK3CB_BAF_762_200Rnd",5},
			{"rhs_mag_m18_purple",5},
			{"rhs_mag_m18_red",5},
			{"rhs_mag_m18_blue",5},
			{"rhs_mag_m18_green",5},
			{"rhs_mag_m67",10}		
		}},
		{"miscWeaponCrateCategory","Raven","small",,{
			{"B_rhsusf_B_BACKPACK",1}
		}},
		{"miscWeaponCrateCategory","Empty Crate (Small)","small",{

		}},
		{"miscWeaponCrateCategory","Empty Crate (Medium)","medium",{

		}},
		{"heavyWeaponCrateCategory","Javelin","medium",,{
			{"UK3CB_BAF_Javelin_CLU",1},
			{"UK3CB_BAF_Javelin_Slung_Tube",5}
		}},
		{"heavyWeaponCrateCategory","Javelin Ammo","medium",{
			{"UK3CB_BAF_Javelin_Slung_Tube",10}
		}}
	};
};