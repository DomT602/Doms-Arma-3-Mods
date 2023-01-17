/*
	Faction: initPlayerLocal.sqf
	Author: Dom
	Requires: Start us up
*/

waitUntil {missionNamespace getVariable ["DT_serverReady",false] && {!isNull player && {!isNull (findDisplay 46)}}};

player addEventHandler ["InventoryOpened",DT_fnc_onInventoryOpened];
player addEventHandler ["Respawn",DT_fnc_onRespawn];
addMissionEventHandler ["Map",DT_fnc_createBluforMarkers];

["ace_arsenal_displayClosed",{
	DT_savedLoadout = [player] call CBA_fnc_getLoadout;
	["Loadout saved."] call DT_fnc_notify;
}] call CBA_fnc_addEventHandler;

["ace_treatmentSucceded", {
	params ["_caller","_target","_selectionName","_className","_itemUser","_usedItem"];

	if (_caller isNotEqualTo player) exitWith {};

	private _medicalItems = [
		"ACE_fieldDressing","ACE_elasticBandage","ACE_packingBandage","ACE_quikclot",
		"ACE_splint",
		"ACE_bloodIV_250","ACE_bloodIV_500","ACE_bloodIV",
		"ACE_plasmaIV_250","ACE_plasmaIV_500","ACE_plasmaIV",
		"ACE_salineIV_250","ACE_salineIV_500","ACE_salineIV"
	];

	if (side _target isEqualTo civilian && {_usedItem in _medicalItems}) then {
		[getPosASL _target,paramsArray select 6] remoteExecCall ["DT_fnc_adjustKarma",2];
	};
}] call CBA_fnc_addEventHandler;

[] call DT_fnc_createAceInteractions;

[player] remoteExecCall ["DT_fnc_assignZeus",2];

player setVehiclePosition [getMarkerPos "respawn_west",[],5];
[] call DT_fnc_initGroupMenu;