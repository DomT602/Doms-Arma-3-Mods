/*
	File: fn_deployRallyPoint.sqf
	Author: Dom
	Description: Adds a teleport point for players to use for a set time
*/
params [
	["_pos",[],[[]]]
];

private _rallyTent = createVehicle ["Land_TentDome_F",_pos];
private _marker = createMarker ["rallyPoint",_pos];
_marker setMarkerType "mil_start";
_marker setMarkerText "Rally Point";
_marker setMarkerColor "ColorBLUFOR";

missionNamespace setVariable ["DT_rallyPointPos",_pos,true];
["Rally point now available."] remoteExecCall ["DT_fnc_notify",0];

[
	{
		params ["_object","_marker"];
		missionNamespace setVariable ["DT_rallyPointPos",nil,true];
		deleteVehicle _object;
		deleteMarker _marker;
		["Rally point no longer available."] remoteExecCall ["DT_fnc_notify",0];
	},
	[_rallyTent,_marker],
	1800
] call CBA_fnc_waitAndExecute;