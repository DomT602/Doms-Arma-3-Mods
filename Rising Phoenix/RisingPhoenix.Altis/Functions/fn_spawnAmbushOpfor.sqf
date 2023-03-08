/*
	File: fn_spawnAmbushOpfor.sqf
	Author: Dom
	Description: Spawns enemy units to ambush players
*/
params [
	["_target",objNull,[objNull]],
	["_originalPosition",[],[[]]]
];
if (_target distance2D _originalPosition > 1000) exitWith {};

private _spawnPosition = [_target,400,800,5,0,1,0] call BIS_fnc_findSafePos;

(call DT_fnc_calculateEnemySquads) params ["_infantryCount","_lightCount"];

private _groups = [];
for "_i" from 1 to _infantryCount do {
	private _group = [_spawnPosition] call DT_fnc_createSquad;
	_group reveal [_target,4];
	private _waypoint = _group addWaypoint [_target,5];
	_waypoint setWaypointType "SAD";
	_waypoint setWaypointCombatMode "RED";
	_waypoint setWaypointBehaviour "AWARE";
	_groups pushBack _group;
};

if (50 > random 100) then {
	_groups pushBack ([_target,_lightCount] call DT_fnc_spawnAttackHelicopters);
};

[
	{
		params ["_target"];
		[_target,1500] call DT_fnc_areaIsClear
	},
	{
		params ["","_groups"];

		{
			[_x] call DT_fnc_deleteGroup;
		} forEach _groups;
	},
	[getPosATL _target,_groups]
] call CBA_fnc_waitUntilAndExecute;