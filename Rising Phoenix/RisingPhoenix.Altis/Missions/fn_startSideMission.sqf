/*
	File: fn_startSideMission.sqf
	Author: Dom
	Description: Randomly selects a new side mission that hasn't recently been used
*/
params [
	["_lastMissionType","",[""]]
];

private _sideMissions = [
	["destroyJammer",DT_fnc_destroyJammer],
	["destroyAA",DT_fnc_destroyAA]
];

private _index = _sideMissions findIf {_x select 0 in _lastMissionType};
_sideMissions deleteAt _index;

(selectRandom _sideMissions) params ["","_code"];

[_code,[],(paramsArray select 10) * 60] call CBA_fnc_waitAndExecute;