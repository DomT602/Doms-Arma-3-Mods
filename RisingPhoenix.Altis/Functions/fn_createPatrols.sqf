/*
	File: fn_createPatrols.sqf
	Author: Dom
	Description: Creates units and sets them on patrols round a specific location
*/
params [
	["_position",[],[[]]],
	["_patrolRadiusBase",150,[0]],
	["_spawnRadius",150,[0]]
];

(call DT_fnc_calculateEnemySquads) params ["_infantryCount","_lightCount","_mediumCount","_heavyCount"];

private _groups = [];
for "_i" from 1 to _infantryCount do {
	private _group = [_position,_spawnRadius] call DT_fnc_createSquad;
	[_group,_position,_patrolRadiusBase] call DT_fnc_initPatrol;
	_groups pushBack _group;
};

for "_i" from 1 to _lightCount do {
	private _lightVehicles = getArray(missionConfigFile >> "Opfor_Setup" >> "opforLightVehicles");
	private _group = [selectRandom _lightVehicles,_position,_spawnRadius] call DT_fnc_createVehicle;
	[_group,_position,(_patrolRadiusBase + 200)] call DT_fnc_initPatrol;
	_groups pushBack _group;
};

for "_i" from 1 to _mediumCount do {
	private _mediumVehicles = getArray(missionConfigFile >> "Opfor_Setup" >> "opforMediumVehicles");
	private _group = [selectRandom _mediumVehicles,_position,_spawnRadius] call DT_fnc_createVehicle;
	[_group,_position,(_patrolRadiusBase + 100)] call DT_fnc_initPatrol;
	_groups pushBack _group;
};

for "_i" from 1 to _heavyCount do {
	private _heavyVehicles = getArray(missionConfigFile >> "Opfor_Setup" >> "opforHeavyVehicles");
	private _group = [selectRandom _heavyVehicles,_position,_spawnRadius] call DT_fnc_createVehicle;
	[_group,_position,(_patrolRadiusBase + 100)] call DT_fnc_initPatrol;
	_groups pushBack _group;
};

_groups;