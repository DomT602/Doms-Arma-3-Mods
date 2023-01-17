/*
	File: fn_spawnAttackHelicopters.sqf
	Author: Dom
	Description: Spawns attack helicopters to attack a person/position
*/
params [
	["_target",objNull,[objNull,[]]],
	["_count",1,[0]]
];
if (missionNamespace getVariable ["opforAirDisabled",false]) exitWith {};

private _airports = DT_airportLocations select {[_x select 0,1000] call DT_fnc_areaIsClear};
if (_airports isEqualTo []) exitWith {};
(selectRandom _airports) params ["_airportPos","_airportDir"];

private _heliTypes = getArray (missionConfigFile >> "Opfor_Setup" >> "opforAttackHelicopters");
private _classData = selectRandom _heliTypes;
private _className = _classData;
private _pilotClass = "";
if (_classData isEqualType []) then {
	_className = _classData select 0;
	if (call compile (_classData select 1)) then {
		_pilotClass = getText (missionConfigFile >> "Opfor_Setup" >> "opforPilot");
	};
};

private _group = createGroup [east,true];
private _spawnPos = _airportPos;
for "_i" from 1 to _count do {
	private _helicopter = createVehicle [_className,_spawnPos,[],0,"NONE"];
	private _spacing = (boundingBox _helicopter) select 2;
	if (_pilotClass isEqualTo "") then {
		private _crew = createVehicleCrew _helicopter;
		(units _crew) joinSilent _group;
	} else {
		private _crewCount = [_className,false] call BIS_fnc_crewCount;
		for "_i" from 1 to 2 do {
			private _crewMember = [_group,east,_pilotClass,_helicopter] call DT_fnc_createUnit;
			_crewMember moveInAny _helicopter;
		};
	};
	_helicopter setDir (_helicopter getDir _target);
	_spawnPos = _spawnPos getPos [_spacing * 2,_airportDir];
};

_group setFormation "ECH LEFT";
private _waypoint = _group addWaypoint [_target,25];
_waypoint setWaypointType "SAD";
_waypoint setWaypointBehaviour "AWARE";
_waypoint setWaypointCombatMode "RED";

if (_target isEqualType objNull) then {
	_group reveal [_target,4];
};