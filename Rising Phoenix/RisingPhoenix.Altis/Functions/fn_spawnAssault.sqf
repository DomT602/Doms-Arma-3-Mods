/*
	File: fn_spawnAssault.sqf
	Author: Dom
	Description: Spawns enemy units to attack an area/unit
*/
params [
	["_target",objNull,[objNull,[]]]
];

private _position = [_target,500,1000,5,0,1,0] call BIS_fnc_findSafePos;

private _squadCounts = (call DT_fnc_calculateEnemySquads) apply {round (_x * 1.5)};
_squadCounts params ["_infantryCount","_lightCount","_mediumCount","_heavyCount"];

private _groups = [];
for "_i" from 1 to _infantryCount do {
	private _group = [_position] call DT_fnc_createSquad;
	_groups pushBack _group;
};

for "_i" from 1 to _lightCount do {
	private _lightVehicles = getArray(missionConfigFile >> "Opfor_Setup" >> DT_opforFaction >> "opforLightVehicles");
	private _group = [selectRandom _lightVehicles,_position,250,true] call DT_fnc_createVehicle;
	_groups pushBack _group;
};

for "_i" from 1 to _mediumCount do {
	private _mediumVehicles = getArray(missionConfigFile >> "Opfor_Setup" >> DT_opforFaction >> "opforMediumVehicles");
	private _group = [selectRandom _mediumVehicles,_position,250,true] call DT_fnc_createVehicle;
	_groups pushBack _group;
};

for "_i" from 1 to _heavyCount do {
	private _heavyVehicles = getArray(missionConfigFile >> "Opfor_Setup" >> DT_opforFaction >> "opforHeavyVehicles");
	private _group = [selectRandom _heavyVehicles,_position,250,true] call DT_fnc_createVehicle;
	_groups pushBack _group;
};

{
	private _waypoint = _x addWaypoint [_target,10];
	_waypoint setWaypointType "SAD";
	_waypoint setWaypointCombatMode "RED";
	_waypoint setWaypointBehaviour "AWARE";
} forEach _groups;

_groups pushBack ([_target,_mediumCount] call DT_fnc_spawnAttackHelicopters);

_groups;