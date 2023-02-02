/*
	File: fn_onDefuse.sqf
	Author: Dom
	Description: Handles the defusal of an explosive - increasing karma if its near a town
*/
params [
	["_explosive",objNull,[objNull]],
	["_unit",objNull,[objNull]]
];

private _closestTown = [_unit] call DT_fnc_getClosestTown;
if (_closestTown distance2D _unit < 750) then {
	[_closestTown,paramsArray select 8] call DT_fnc_adjustKarma;
	[format["The people of %1 thank you for defusing an explosive.",_closestTown getVariable ["DT_townName",""]]] remoteExecCall ["DT_fnc_notify",_unit];
};