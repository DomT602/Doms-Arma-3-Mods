/*
	File: fn_handleDisconnect.sqf
	Author: Dom
	Description: Handles a players disconnection
*/
params ["_unit"];

private _role = _unit getVariable ["DT_role","rifleman"];
["",_role] remoteExecCall ["DT_fnc_updateRoleMenu",-2];