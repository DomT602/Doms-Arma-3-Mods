/*
	File: fn_endMission.sqf
	Author: Dom
	Description: Ends mission either successfully or not
*/
params [
	["_missionVar","",[""]],
	["_success",false,[true]]
];

deleteMarker _missionVar;
private _index = DT_missionDetails find _missionVar;
DT_missionDetails deleteAt _index;
publicVariable "DT_missionDetails";

if (_success) then {
	[_missionVar,"SUCCEEDED",true] call BIS_fnc_taskSetState;
} else {
	[_missionVar,"FAILED",true] call BIS_fnc_taskSetState;
};