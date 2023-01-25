/*
	Faction: Middle Eastern Extremists
	Author: Dom
	Requires: 3CB Factions
*/
class MEE {
	opforSquads[] = {
		{
			"UK3CB_MEE_I_SL",
			"UK3CB_MEE_I_TL",
			"UK3CB_MEE_I_MD",
			"UK3CB_MEE_I_AR",
			"UK3CB_MEE_I_RIF_1",
			"UK3CB_MEE_I_ENG",
			"UK3CB_MEE_I_RIF_2",
			"UK3CB_MEE_I_MK"
		},
		{
			"UK3CB_MEE_I_SL",
			"UK3CB_MEE_I_TL",
			"UK3CB_MEE_I_MD",
			"UK3CB_MEE_I_MK",
			"UK3CB_MEE_I_LAT",
			"UK3CB_MEE_I_RIF_1",
			"UK3CB_MEE_I_ENG",
			"UK3CB_MEE_I_DEM"
		},
		{
			"UK3CB_MEE_I_SL",
			"UK3CB_MEE_I_TL",
			"UK3CB_MEE_I_MD",
			"UK3CB_MEE_I_MK",
			"UK3CB_MEE_I_MG",
			"UK3CB_MEE_I_MG_ASST",
			"UK3CB_MEE_I_ENG",
			"UK3CB_MEE_I_RIF_1"
		},
		{
			"UK3CB_MEE_I_SL",
			"UK3CB_MEE_I_TL",
			"UK3CB_MEE_I_MD",
			"UK3CB_MEE_I_AT",
			"UK3CB_MEE_I_AT_ASST",
			"UK3CB_MEE_I_MK",
			"UK3CB_MEE_I_AR",
			"UK3CB_MEE_I_RIF_1"
		},
		{
			"UK3CB_MEE_I_SL",
			"UK3CB_MEE_I_TL",
			"UK3CB_MEE_I_MD",
			"UK3CB_MEE_I_AA",
			"UK3CB_MEE_I_AA_ASST",
			"UK3CB_MEE_I_RIF_2",
			"UK3CB_MEE_I_AR",
			"UK3CB_MEE_I_RIF_1"
		}
	};

	opforOfficer = "UK3CB_MEE_I_COM";
	opforPilot = "UK3CB_MEE_I_CREW";
	opforMortar = "UK3CB_MEE_I_2b14_82mm";
	opforStatics[] = { //HMGs, AT etc
		"UK3CB_MEE_I_Igla_AA_pod",
		"UK3CB_MEE_I_DSHKM",
		"UK3CB_MEE_I_KORD_high",
		"UK3CB_MEE_I_PKM_High",
		"UK3CB_MEE_I_SPG9",
		"UK3CB_MEE_I_AGS"
	};

	//if the vehicle does not belong to the faction naturally, enclose in {} and add ,true
	opforLightVehicles[] = {
		"UK3CB_MEE_I_Datsun_Pkm",
		"UK3CB_MEE_I_Hilux_Igla_Chair",
		"UK3CB_MEE_I_Hilux_GMG",
		"UK3CB_MEE_I_Hilux_BMP",
		"UK3CB_MEE_I_Hilux_BTR",
		"UK3CB_MEE_I_Hilux_Dshkm",
		"UK3CB_MEE_I_Hilux_Vulcan_Front",
		"UK3CB_MEE_I_Hilux_M2",
		"UK3CB_MEE_I_Hilux_Metis",
		"UK3CB_MEE_I_Hilux_Pkm",
		"UK3CB_MEE_I_Hilux_Rocket",
		"UK3CB_MEE_I_Hilux_Spg9",
		"UK3CB_MEE_I_LR_AGS30",
		"UK3CB_MEE_I_LR_M2",
		"UK3CB_MEE_I_LR_SPG9",
		"UK3CB_MEE_I_M1025_MK19",
		"UK3CB_MEE_I_M1025_M2",
		"UK3CB_MEE_I_M1025_TOW",
		"UK3CB_MEE_I_M1025_TOW",
		"UK3CB_MEE_I_Offroad_AT",
		"UK3CB_MEE_I_Pickup_DSHKM",
		"UK3CB_MEE_I_Pickup_M2"
	};

	opforMediumVehicles[] = {
		"UK3CB_MEE_I_BRDM2",
		"UK3CB_MEE_I_BRDM2_ATGM",
		"UK3CB_MEE_I_BRDM2_HQ"
	};

	opforHeavyVehicles[] = {
		"UK3CB_MEE_I_T55"
	};

	opforTroopCarriers[] = {
		"UK3CB_MEE_I_V3S_Closed",
		"UK3CB_MEE_I_V3S_Open",
		"UK3CB_MEE_I_M998_2DR",
		"UK3CB_MEE_I_M998_4DR"
	};

	opforAAVehicles[] = {
		"UK3CB_MEE_I_MTLB_ZU23"
	};

	opforAttackHelicopters[] = {
		"UK3CB_ADA_I_UH1H_M240"
	};

	//CfgMagazines; https://community.bistudio.com/wiki/Arma_3:_CfgMagazines
	opforTrapMunitions[] = {
		"GrenadeHand",
		"mini_Grenade"
	};

	opforMines[] = {
		"ATMine",
		"APERSTripMine",
		"APERSMine",
		"APERSBoundingMine",
		"IEDUrbanBig_F",
		"IEDLandBig_F",
		"IEDUrbanSmall_F",
		"IEDLandSmall_F"
	};
};
