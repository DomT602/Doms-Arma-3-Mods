/*
	File: fn_joinGroup.sqf
	Author: Dom
	Description: Joins the selected group
*/
params [
	["_group",grpNull,[grpNull]],
	["_unit",objNull,[objNull]]
];

[player] join _group;
[format["%1 has joined your group.",profileName]] remoteExecCall ["hint",_group];
[] remoteExecCall ["DT_fnc_updateMenuifOpen",_group];