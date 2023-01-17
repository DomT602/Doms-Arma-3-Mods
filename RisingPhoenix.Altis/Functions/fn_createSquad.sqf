/*
	File: fn_createSquad.sqf
	Author: Dom
	Description: Creates the squad pulled from the config
*/
params [
	["_position",[],[[]]],
	["_radius",150,[0]]
];

private _spawnPosition = [_position,0,_radius,5,0,1,0,[],[_position,_position]] call BIS_fnc_findSafePos;

private _squadComposition = selectRandom (getArray(missionConfigFile >> "Opfor_Setup" >> "opforSquads"));
private _group = createGroup [east,true];

{
	[_group,east,_x,_spawnPosition,10] call DT_fnc_createUnit;
} forEach _squadComposition;

private _ambushChance = paramsArray select 9;
if (_ambushChance > random 100) then {
	(leader _group) addEventHandler ["FiredNear",{
		params ["_unit","_firer"];

		_unit removeEventHandler [_thisEvent,_thisEventHandler];

		private _target = _firer;
		if !(isPlayer _firer) then {
			_target = _unit findNearestEnemy _unit;
		};

		private _timeDelay = paramsArray select 10;
		[DT_fnc_spawnAmbushOpfor,_target,_timeDelay + random _timeDelay] call CBA_fnc_waitAndExecute;
	}];
};

[_group] call CBA_fnc_clearWaypoints;
_group;