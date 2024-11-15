#include "\a3\ui_f\hpp\defineDIKCodes.inc"
/*
	File: fn_createAceInteractions.sqf
	Author: Dom
	Description: Main file to setup all ace interaction options
*/
private _groupCategory = [
	"groupCategory",
	"Group Menu",
	"\a3\ui_f\data\IGUI\Cfg\simpleTasks\types\meet_ca.paa",
	DT_fnc_initGroupMenu,
	{
		isNull objectParent _player &&
		{_player distance arsenal_1 < 100}
	}
] call ace_interact_menu_fnc_createAction;
[player,1,["ACE_SelfActions"],_groupCategory] call ace_interact_menu_fnc_addActionToObject;

private _arsenalCategory = [
	"arsenalCategory",
	"Arsenal",
	"\a3\ui_f\data\IGUI\Cfg\simpleTasks\types\armor_ca.paa",
	{[_player,_player,false] call ace_arsenal_fnc_openBox},
	{
		isNull objectParent _player &&
		{_player getVariable ["ace_arsenal_virtualItems",[]] isNotEqualTo [] &&
		{_player distance arsenal_1 < 100}}
	}
] call ace_interact_menu_fnc_createAction;
[player,1,["ACE_SelfActions"],_arsenalCategory] call ace_interact_menu_fnc_addActionToObject;

private _saveRespawnLoadout = [
	"saveLoadout",
	"Save respawn loadout",
	"\a3\ui_f\data\IGUI\Cfg\simpleTasks\types\download_ca.paa",
	{
		DT_savedLoadout = [_player] call CBA_fnc_getLoadout;
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
		[_player,DT_savedLoadout,true] call CBA_fnc_setLoadout;
	},
	{!isNil "DT_savedLoadout"}
] call ace_interact_menu_fnc_createAction;
[player,1,["ACE_SelfActions","arsenalCategory"],_loadRespawnLoadout] call ace_interact_menu_fnc_addActionToObject;

private _deployToRallyPoint = [
	"rallyPoint",
	"Deploy to Rally Point",
	"\a3\ui_f\data\IGUI\Cfg\simpleTasks\types\takeoff_ca.paa",
	{
		player setVehiclePosition [missionNamespace getVariable ["DT_rallyPointPos",[]],[],5];
	},
	{
		isNull objectParent _player &&
		{missionNamespace getVariable ["DT_rallyPointPos",[]] isNotEqualTo [] &&
		{_player distance arsenal_1 < 100}}
	}
] call ace_interact_menu_fnc_createAction;
[player,1,["ACE_SelfActions"],_deployToRallyPoint] call ace_interact_menu_fnc_addActionToObject;

private _buildMenuCategory = [
	"buildCategory",
	"Build Menu",
	"\a3\ui_f\data\IGUI\Cfg\simpleTasks\types\defend_ca.paa",
	DT_fnc_initBuildMenu,
	{
		rankId player > 1 &&
		{_player distance arsenal_1 < 150}
	}
] call ace_interact_menu_fnc_createAction;
[player,1,["ACE_SelfActions"],_buildMenuCategory] call ace_interact_menu_fnc_addActionToObject;

private _logiMenuCategory = [
	"logiMenu",
	"Open Logistics Menu",
	"\a3\ui_f\data\IGUI\Cfg\simpleTasks\types\box_ca.paa",
	DT_fnc_initSupplyCrateMenu,
	{
		isNull objectParent _player &&
		{_player distance supplyDepot_1 < 25}
	}
] call ace_interact_menu_fnc_createAction;
[player,1,["ACE_SelfActions"],_logiMenuCategory] call ace_interact_menu_fnc_addActionToObject;

private _retrieveWheel = [
	"retrieveWheel",
	"Retrieve wheel",
	"\a3\ui_f\data\IGUI\Cfg\simpleTasks\types\repair_ca.paa",
	{createVehicle ["ACE_Wheel",_player]},
	{true}
] call ace_interact_menu_fnc_createAction;
private _retrieveTrack = [
	"retrieveTrack",
	"Retrieve track",
	"\a3\ui_f\data\IGUI\Cfg\simpleTasks\types\repair_ca.paa",
	{createVehicle ["ACE_Track",_player]},
	{true}
] call ace_interact_menu_fnc_createAction;
["B_Slingload_01_Repair_F",0,["ACE_MainActions"],_retrieveWheel] call ace_interact_menu_fnc_addActionToClass;
["B_Slingload_01_Repair_F",0,["ACE_MainActions"],_retrieveTrack] call ace_interact_menu_fnc_addActionToClass;

private _deleteVehicleCategory = [
	"deleteVehicle",
	"Delete",
	"\a3\ui_f\data\IGUI\Cfg\simpleTasks\types\use_ca.paa",
	{deleteVehicle _target},
	{
		rankId player > 1 &&
		{_player distance arsenal_1 < 100 &&
		{(crew _target isEqualTo [] || {unitIsUAV _target})}}
	}
] call ace_interact_menu_fnc_createAction;
["AllVehicles",0,["ACE_MainActions"],_deleteVehicleCategory,true] call ace_interact_menu_fnc_addActionToClass;

private _fullHealAll = [
	"aceFullHealAll",
	"Full heal nearby players (including self)",
	"\a3\ui_f\data\IGUI\Cfg\Actions\heal_ca.paa",
	{
		{
			if (_x distance _player < 50) then {
				[_x] remoteExecCall ["ace_medical_treatment_fnc_fullHealLocal",_x];
			};
		} forEach playableUnits;
	},
	{true}
] call ace_interact_menu_fnc_createAction;
[medical_1,0,["ACE_MainActions"],_fullHealAll] call ace_interact_menu_fnc_addActionToObject;

private _supportCategory = [
	"supportCategory",
	"Supports",
	"\a3\ui_f\data\IGUI\Cfg\simpleTasks\types\help_ca.paa",
	DT_fnc_initSupportMenu,
	{
		rankId player > 2
	}
] call ace_interact_menu_fnc_createAction;
[player,1,["ACE_SelfActions"],_supportCategory] call ace_interact_menu_fnc_addActionToObject;

private _environmentCategory = [
	"environmentMenu",
	"Environment Control",
	"\a3\ui_f\data\IGUI\Cfg\simpleTasks\types\use_ca.paa",
	DT_fnc_initEnvironmentMenu,
	{
		rankId player > 2
	}
] call ace_interact_menu_fnc_createAction;
[arsenal_1,0,["ACE_MainActions"],_environmentCategory] call ace_interact_menu_fnc_addActionToObject;

private _cleanBase = [
	"cleanBase",
	"Clean base",
	"\a3\ui_f\data\IGUI\Cfg\simpleTasks\types\use_ca.paa",
	{
		private _toClean = nearestObjects [player,["GroundWeaponHolder","WeaponHolderSimulated"],150];
		_toClean append (allDead select {_x distance (getPosATL player) < 150});

		{
			deleteVehicle _x;
		} forEach _toClean;
	},
	{true}
] call ace_interact_menu_fnc_createAction;
[arsenal_1,0,["ACE_MainActions"],_cleanBase] call ace_interact_menu_fnc_addActionToObject;

private _talkCategory = [
	"talkToPerson",
	"Talk",
	"\a3\ui_f\data\IGUI\Cfg\Actions\talk_ca.paa",
	{
		[_target] call DT_fnc_initTalkMenu;
	},
	{
		alive _target &&
		{!(_target getVariable ["ACE_isUnconscious",false])}
	}
] call ace_interact_menu_fnc_createAction;
{
	[_x,0,["ACE_MainActions"],_talkCategory] call ace_interact_menu_fnc_addActionToClass;
} forEach getArray(missionConfigFile >> "Civilian_Setup" >> "civilianTypes");

[
	"DT_callStopAction",
	"CHECKBOX",
	["Add 'Stop' Action to ACE Self Interact","Select this to add the 'Call to Stop' action to ACE Self Interact, it is always available through the selected bound key."],
	["Operation Rising Phoenix","Interaction"],
	true,
	nil,
	{
		params ["_value"];
		if (_value) then {
			private _stopCategory = [
				"stopCategory",
				"Call out 'Stop'",
				"\a3\ui_f\data\IGUI\Cfg\simpleTasks\types\talk_ca.paa",
				DT_fnc_callToStop,
				{
					isNull objectParent _player
				}
			] call ace_interact_menu_fnc_createAction;
			[player,1,["ACE_SelfActions"],_stopCategory] call ace_interact_menu_fnc_addActionToObject;
		} else {
			[player,1,["ACE_SelfActions","stopCategory"]] call ace_interact_menu_fnc_removeActionFromObject;
		};
	}
] call CBA_fnc_addSetting;
[["Operation Rising Phoenix","Interaction"],"callStop","Call out 'Stop'",DT_fnc_callToStop,"",[DIK_5,[false,false,false]]] call CBA_fnc_addKeybind;

[
	"DT_bluforMarkersInterval",
	"SLIDER",
	["Blufor Map Update Interval","Choose the time interval between blufor map marker updates."],
	["Operation Rising Phoenix","Map"],
	[0,10,0.1,2]
] call CBA_fnc_addSetting;

if (DT_isTFAREnabled) then {
	[
		"DT_autoRadioOption",
		"LIST",
		["Automatic Radio Channel Selection","Choose what radio channel selection should happen once you recieve your radio."],
		["Operation Rising Phoenix","Radio"],
		[[0,1,2],["Disabled","Group default","Last selected channel"],1]
	] call CBA_fnc_addSetting;
};