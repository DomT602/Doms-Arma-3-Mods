/*
	Faction: Paratrooper
	Author: Dom
*/
class paratrooper {
	name = $STR_B_SOLDIER_PG_F0;
	rank = "Private";
	description = $STR_DT_Paratrooper_Description;
	traits[] = {

	};
	icon = "a3\ui_f\data\map\vehicleicons\iconMan_ca.paa";

	defaultLoadout[] = {
		{"arifle_MX_ACO_pointer_F","","acc_pointer_IR","optic_Aco",{"30Rnd_65x39_caseless_mag",30},{},""},
		{},
		{"hgun_P07_F","","","",{"16Rnd_9x21_Mag",16},{},""},
		{"U_B_CombatUniform_mcam",{{"FirstAidKit",1},{"30Rnd_65x39_caseless_mag",2,30},{"Chemlight_green",1,1},{"HandGrenade",1,1}}},
		{"V_PlateCarrierSpec_rgr",{{"30Rnd_65x39_caseless_mag",7,30},{"16Rnd_9x21_Mag",2,16},{"SmokeShell",1,1},{"SmokeShellGreen",1,1},{"Chemlight_green",1,1}}},
		{"B_Parachute",{}},
		"H_HelmetB","",{},
		{"ItemMap","ItemGPS","ItemRadio","ItemCompass","ItemWatch","NVGoggles"}
	};

	arsenalWeapons[] = {
		"arifle_MXM_Black_F", "arifle_MXM_F", "arifle_MXM_khk_F", "arifle_SPAR_03_blk_F", "arifle_SPAR_03_khk_F", "arifle_SPAR_03_snd_F",
		"srifle_DMR_02_camo_F", "srifle_DMR_02_F", "srifle_DMR_02_sniper_F", "srifle_DMR_03_F", "srifle_DMR_03_khaki_F", "srifle_DMR_03_multicam_F", "srifle_DMR_03_tan_F",
		"srifle_DMR_03_woodland_F", "srifle_DMR_05_blk_F", "srifle_DMR_05_tan_f", "srifle_DMR_06_camo_F", "srifle_DMR_06_olive_F",
		"srifle_DMR_07_blk_F", "srifle_EBR_F", "srifle_DMR_06_hunter_F", "arifle_MSBS65_Mark_F",
		"arifle_MSBS65_Mark_black_F", "arifle_MSBS65_Mark_sand_F",

		"arifle_CTARS_blk_F", "arifle_MX_SW_Black_F", "arifle_MX_SW_F", "arifle_MX_SW_khk_F", "arifle_SPAR_02_blk_F",
		"arifle_SPAR_02_khk_F", "arifle_SPAR_02_snd_F", "LMG_03_F", "LMG_Mk200_F", "LMG_Mk200_black_F", "LMG_Zafir_F", "MMG_01_tan_F", "MMG_02_black_F", "MMG_02_camo_F",
		"MMG_02_sand_F", "arifle_RPK12_F", "arifle_RPK12_arid_F", "arifle_RPK12_lush_F", "LMG_Zafir_pointer_F",

		"arifle_AK12_GL_F", "arifle_AK12_GL_arid_F", "arifle_AK12_GL_lush_F", "arifle_CTAR_GL_blk_F", "arifle_Katiba_GL_F",
		"arifle_Mk20_GL_plain_F", "arifle_MX_GL_Black_F", "arifle_MX_GL_F", "arifle_MX_GL_khk_F", "arifle_SPAR_01_GL_blk_F", "arifle_SPAR_01_GL_khk_F",
		"arifle_SPAR_01_GL_snd_F", "arifle_TRG21_GL_F", "arifle_MSBS65_GL_F", "arifle_MSBS65_GL_black_F", "arifle_MSBS65_GL_sand_F",

		"arifle_ARX_blk_F", "srifle_DMR_04_F", "srifle_DMR_04_Tan_F",

		"launch_RPG32_green_F", "launch_RPG7_F", "launch_MRAWS_green_rail_F", "launch_MRAWS_olive_rail_F",
		"launch_MRAWS_sand_rail_F", "launch_MRAWS_green_F", "launch_MRAWS_olive_F", "launch_MRAWS_sand_F", "launch_NLAW_F"
	};
	arsenalMagazines[] = {
		
	};
	arsenalItems[] = {
		"optic_Nightstalker",
		"optic_AMS", "optic_AMS_khk", "optic_AMS_snd",
		"optic_DMS", "optic_DMS_weathered_F", "optic_DMS_weathered_Kir_F",
		"optic_KHS_blk", "optic_KHS_tan", "optic_KHS_old",
		"optic_SOS", "optic_SOS_khk_F"
	};
	arsenalBackpacks[] = {
		
	};
};