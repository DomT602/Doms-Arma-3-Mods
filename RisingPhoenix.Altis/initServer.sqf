/*
	Faction: initServer.sqf
	Author: Dom
	Requires: Start the server up
*/
DT_dynamicGroups = getArray(missionConfigFile >> "Dynamic_Groups" >> "group_setup");
{
	_x params ["","_roles"];
	_x pushBack grpNull;

	private _roleCount = count _roles;
	private _playerArray = [];
	for "_i" from 1 to _roleCount do {
		_playerArray pushBack objNull;
	};
	_x pushBack _playerArray;
} forEach DT_dynamicGroups;

[DT_dynamicGroups] remoteExecCall ["DT_fnc_updateGroups",-2,"DT_DG_JIP"];

addMissionEventHandler ["HandleDisconnect",{DT_fnc_handleDisconnect}];

DT_isLambsEnabled = isClass(configFile >> "CfgPatches" >> "lambs_main");
DT_isZenEnabled = isClass(configFile >> "CfgPatches" >> "ZEN_main");

call DT_fnc_setupLocations;

resistance setFriend [west,0];
west setFriend [independent,0];
resistance setFriend [east,1];
east setFriend [independent,1];

DT_missionDetails = [];

["AllVehicles","initpost",{
	params ["_vehicle"];
	[_vehicle] call DT_fnc_clearCargo;

	{
		_x addCuratorEditableObjects [_this,true];
	} forEach allCurators;
},true,[],true] call CBA_fnc_addClassEventHandler;

[] call DT_fnc_mainLoop;
[] call DT_fnc_startNewMission;
[] call DT_fnc_startSideMission;

DT_ambientCivs = [];
DT_ambientCivHandle = -1;
[paramsArray select 2] call DT_fnc_spawnAmbientCiv;

DT_ambientOpfor = [];
DT_ambientOpforHandle = -1;
[paramsArray select 8] call DT_fnc_spawnAmbientOpfor;

DT_serverReady = true;
publicVariable "DT_serverReady";