/*
	Faction: initServer.sqf
	Author: Dom
	Requires: Start the server up
*/
DT_dynamicGroups = getArray(missionConfigFile >> "Dynamic_Groups" >> "group_setup");
{
	_x params ["_name","_roles","_conditions"];
	_x pushBack grpNull;

	private _roleCount = count _roles;
	private _playerArray = [];
	for "_i" from 1 to _roleCount do {
		_playerArray pushBack objNull;
	};
	_x pushBack _playerArray;
} forEach DT_dynamicGroups;

[DT_dynamicGroups] remoteExecCall ["DT_fnc_updateGroups",-2,"DT_DG_JIP"];

addMissionEventHandler ["HandleDisconnect",{_this call DT_fnc_handleDisconnect}];