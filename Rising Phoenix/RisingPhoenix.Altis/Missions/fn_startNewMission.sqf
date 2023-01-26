/*
	File: fn_startNewMission.sqf
	Author: Dom
	Description: Randomly selects a new mission for players which wasn't last played
*/
params [
	["_lastMissionType","",[""]]
];

if (DT_missionCount isEqualTo (paramsArray select 2)) exitWith {
	private _code = selectRandom [DT_fnc_secureNuke];
	[] call _code;
};

private _missions = [
	["clear",DT_fnc_clearTown],
	["destroyCache",DT_fnc_destroyCache],
	["secureUAV",DT_fnc_secureUAV],
	["secureIntel",DT_fnc_secureIntel]
];

private _index = _missions findIf {_x select 0 in _lastMissionType};
_missions deleteAt _index;

(selectRandom _missions) params ["","_code"];

[_code,[],30] call CBA_fnc_waitAndExecute;
DT_missionCount = DT_missionCount + 1;