/*
	File: fn_civilianHit.sqf
	Author: Dom
	Description: Handles the injury of a civilian
*/
params ["_unit","","","_instigator"];

if (isPlayer _instigator) then {
	["A civilian has been injured."] remoteExecCall ["DT_fnc_notify",0];
	[getPosASL _unit,paramsArray select 4] call DT_fnc_adjustKarma;
};