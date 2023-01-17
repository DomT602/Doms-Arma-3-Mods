/*
	File: fn_civilianKilled.sqf
	Author: Dom
	Description: Handles the death of a civilian
*/
params ["_unit"];

private _lastInstigator = _unit getVariable ["ace_medical_lastInstigator",objNull];

if (isPlayer _lastInstigator && {side (group _unit) isEqualTo civilian}) then {
	["A civilian has been killed."] remoteExecCall ["DT_fnc_notify",0];
	[getPosASL _unit,paramsArray select 5] call DT_fnc_adjustKarma;
};