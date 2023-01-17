/*
	File: fn_createAceInteractions.sqf
	Author: Dom
	Description: Main file to setup all ace interaction options
*/
private _groupCategory = [
	"groupCategory",
	"Group Menu",
	"\a3\ui_f\data\IGUI\Cfg\simpleTasks\types\meet_ca.paa",
	{[] call DT_fnc_initGroupMenu},
	{
		isNull objectParent player &&
		{(player distance arsenal_1) < 100}
	}
] call ace_interact_menu_fnc_createAction;
[player,1,["ACE_SelfActions"],_groupCategory] call ace_interact_menu_fnc_addActionToObject;

private _arsenalCategory = [
	"arsenalCategory",
	"Arsenal",
	"\a3\ui_f\data\IGUI\Cfg\simpleTasks\types\armor_ca.paa",
	{[player,player,false] call ace_arsenal_fnc_openBox},
	{
		isNull objectParent player &&
		{player getVariable ["ace_arsenal_virtualItems",[]] isNotEqualTo [] && 
		{(player distance arsenal_1) < 100}}
	}
] call ace_interact_menu_fnc_createAction;
[player,1,["ACE_SelfActions"],_arsenalCategory] call ace_interact_menu_fnc_addActionToObject;

private _saveRespawnLoadout = [
	"saveLoadout",
	"Save respawn loadout",
	"\a3\ui_f\data\IGUI\Cfg\simpleTasks\types\download_ca.paa",
	{
		DT_savedLoadout = [player] call CBA_fnc_getLoadout;
		["Loadout saved."] call DT_fnc_notify;
	},
	{true}
] call ace_interact_menu_fnc_createAction;
[player,1,["ACE_SelfActions","arsenalCategory"],_saveRespawnLoadout] call ace_interact_menu_fnc_addActionToObject;

private _loadRespawnLoadout = [
	"loadLoadout",
	"Load respawn loadout",
	"\a3\ui_f\data\IGUI\Cfg\simpleTasks\types\rearm_ca.paa",
	{
		[player,DT_savedLoadout,true] call CBA_fnc_setLoadout;
	},
	{!isNil "DT_savedLoadout"}
] call ace_interact_menu_fnc_createAction;
[player,1,["ACE_SelfActions","arsenalCategory"],_loadRespawnLoadout] call ace_interact_menu_fnc_addActionToObject;

private _buildMenuCategory = [
	"buildCategory",
	"Build Menu",
	"\a3\ui_f\data\IGUI\Cfg\simpleTasks\types\defend_ca.paa",
	{[] call DT_fnc_initBuildMenu},
	{
		isNull objectParent player &&
		{(player distance arsenal_1) < 100}
	}
] call ace_interact_menu_fnc_createAction;
[player,1,["ACE_SelfActions"],_buildMenuCategory] call ace_interact_menu_fnc_addActionToObject;

private _logiMenuCategory = [
	"logiMenu",
	"Open Logistics Menu",
	"\a3\ui_f\data\IGUI\Cfg\simpleTasks\types\box_ca.paa",
	{[] call DT_fnc_initSupplyCrateMenu},
	{
		isNull objectParent player &&
		{(player distance supplyDepot_1) < 25}
	}
] call ace_interact_menu_fnc_createAction;
[player,1,["ACE_SelfActions"],_logiMenuCategory] call ace_interact_menu_fnc_addActionToObject;

private _deleteVehicleCategory = [
	"deleteVehicle",
	"Delete",
	"\a3\ui_f\data\IGUI\Cfg\simpleTasks\types\use_ca.paa",
	{deleteVehicle _target},
	{
		isNull objectParent player &&
		{(player distance arsenal_1) < 100 &&
		{(crew _target isEqualTo [] || {unitIsUAV _target})}}
	}
] call ace_interact_menu_fnc_createAction;
["AllVehicles",0,["ACE_MainActions"],_deleteVehicleCategory,true] call ace_interact_menu_fnc_addActionToClass;

private _fullHealSelf = [
	"aceFullHeal",
	"Full heal self",
	"\a3\ui_f\data\IGUI\Cfg\Actions\heal_ca.paa",
	{[player] call ace_medical_treatment_fnc_fullHealLocal},
	{true}
] call ace_interact_menu_fnc_createAction;
[medical_1,0,["ACE_MainActions"],_fullHealSelf] call ace_interact_menu_fnc_addActionToObject;

private _fullHealAll = [
	"aceFullHealAll",
	"Full heal nearby players (including self)",
	"\a3\ui_f\data\IGUI\Cfg\Actions\heal_ca.paa",
	{
		{
			if (_x distance player < 25) then {
				[_x] remoteExecCall ["ace_medical_treatment_fnc_fullHealLocal",_x];
			};
		} forEach playableUnits;
	},
	{true}
] call ace_interact_menu_fnc_createAction;
[medical_1,0,["ACE_MainActions"],_fullHealAll] call ace_interact_menu_fnc_addActionToObject;

private _environmentCategory = [
	"environmentMenu",
	"Environment Control",
	"\a3\ui_f\data\IGUI\Cfg\simpleTasks\types\use_ca.paa",
	{[] call DT_fnc_initEnvironmentMenu},
	{
		(player getVariable ["DT_role","rifleman"]) in ["officer","squadlead","commander","pilot"]
	}
] call ace_interact_menu_fnc_createAction;
[arsenal_1,0,["ACE_MainActions"],_environmentCategory] call ace_interact_menu_fnc_addActionToObject;

private _talkCategory = [
	"talkToPerson",
	"Talk",
	"\a3\ui_f\data\IGUI\Cfg\Actions\talk_ca.paa",
	{
		[_target] call DT_fnc_initTalkMenu;
	},
	{
		alive _target &&
		{side _target in [civilian,independent] &&
		{!(_target getVariable ["ACE_isUnconscious",false])}}
	}
] call ace_interact_menu_fnc_createAction;
["CAManBase",0,["ACE_MainActions"],_talkCategory,true] call ace_interact_menu_fnc_addActionToClass;