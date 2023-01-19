	/*
	File: fn_createConvoy.sqf
	Author: Dom
	Description: Creates a convoy of vehicles and sets their waypoints
*/
params [
	["_startPos",[],[[]]],
	["_intermediatePos",[],[[]]],
	["_endPos",[],[[]]]
];

(call DT_fnc_calculateEnemySquads) params ["_carrierCount","_lightCount","_mediumCount"];
private _startDirection = _startPos getDir _intermediatePos;

private _groups = [];
for "_i" from 1 to (_carrierCount + _lightCount) do {
	private _lightVehicles = getArray(missionConfigFile >> "Opfor_Setup" >> DT_opforFaction >> "opforLightVehicles");
	_lightVehicles append getArray(missionConfigFile >> "Opfor_Setup" >> DT_opforFaction >> "opforTroopCarriers");
	private _group = [selectRandom _lightVehicles,_startPos,100,true] call DT_fnc_createVehicle;
	_groups pushBack _group;
};

for "_i" from 1 to _mediumCount do {
	private _mediumVehicles = getArray(missionConfigFile >> "Opfor_Setup" >> DT_opforFaction >> "opforMediumVehicles");
	private _group = [selectRandom _mediumVehicles,_startPos] call DT_fnc_createVehicle;
	_groups pushBack _group;
};
	
private _mainGroup = createGroup [east,true];
private _vehicles = [];
{
	_vehicles pushBack (objectParent (leader _x));
	(units _x) joinSilent _mainGroup;
} forEach _groups;

_mainGroup setFormation "COLUMN";
private _waypoint = _mainGroup addWaypoint [_intermediatePos,5];
_waypoint setWayPointType "MOVE";
_waypoint setWaypointBehaviour "AWARE";
_waypoint setWaypointCombatMode "YELLOW";

_waypoint = _mainGroup addWaypoint [_endPos,5];
_waypoint setWayPointType "MOVE";
_waypoint setWaypointBehaviour "AWARE";
_waypoint setWaypointCombatMode "YELLOW";

_vehicles params ["_aheadVehicle"];
{
	_x setDir _startDirection;
	if (_forEachIndex isNotEqualTo 0) then {
		private _vehAheadSize = (boundingBox _aheadVehicle) select 2;
		private _convoyPos = _aheadVehicle getPos [_vehAheadSize + 2,_startDirection + 180];
		_x setVehiclePosition [_convoyPos,[],0,"NONE"];
		_aheadVehicle = _x;
	};

	_x limitSpeed 45;
	_x setConvoySeparation 15;
} forEach _vehicles;

_mainGroup;