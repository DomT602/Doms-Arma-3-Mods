/*
	File: fn_civilianKilled.sqf
	Author: Dom
	Description: Handles the death of a civilian
*/
params ["_unit","","_instigator"];

private _lastInstigator = _unit getVariable ["ace_medical_lastInstigator",objNull];

if (isPlayer _lastInstigator || {isPlayer _instigator}) then {
	["A civilian has been killed."] remoteExecCall ["DT_fnc_notify",0];
	private _nearTown = [_unit] call DT_fnc_getClosestTown;
	[_nearTown,paramsArray select 8] call DT_fnc_adjustKarma;
	
	private _civsKilled = _nearTown getVariable ["DT_townCivsKilled",0];
	_nearTown setVariable ["DT_townCivsKilled",_civsKilled + 1];
};