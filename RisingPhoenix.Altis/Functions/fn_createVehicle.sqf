/*
	File: fn_createVehicle.sqf
	Author: Dom
	Description: Creates the vehicle pulled from the config
*/
params [
	["_classData","",["",[]]],
	["_position",[],[[]]],
	["_radius",100,[0]],
	["_fillWithPax",false,[true]]
];

private _className = _classData;
private _spawnFactionCrew = false;
if (_classData isEqualType []) then {
	_className = _classData select 0;
	_spawnFactionCrew = call compile (_classData select 1);
};

private _nearRoads = _position nearRoads (_radius * 2);
private _spawnPos = getPosATL (selectRandom _nearRoads);

private _vehicle = createVehicle [_className,_spawnPos];
private _group = createGroup [east,true];
if (_spawnFactionCrew) then {
	[_group,_vehicle] call DT_fnc_forceCreateFactionCrew;
} else {
	private _crew = createVehicleCrew _vehicle;
	(units _crew) joinSilent _group;
};

if (_fillWithPax) then {
	private _squadComposition = selectRandom (getArray(missionConfigFile >> "Opfor_Setup" >> "opforSquads"));
	private _seatCount = getNumber(configOf _vehicle >> "transportSoldier");
	private _troopCount = ceil (random _seatCount);

	for "_i" from 1 to _troopCount do {
		private _unit = [_group,east,selectRandom _squadComposition,_vehicle] call DT_fnc_createUnit;
		_unit moveInCargo _vehicle;
	};
};

[_group] call CBA_fnc_clearWaypoints;
_vehicle setUnloadInCombat [true,false];

_group;