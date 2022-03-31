/*
	File: fn_promoteNewLeader.sqf
	Author: Dom
	Description: Leave the selected group
*/
params [
	["_group",grpNull,[grpNull]],
	["_unit",objNull,[objNull]]
];

_group selectLeader _unit;
[format["%1 is your new group leader.",name _unit]] remoteExecCall ["hint",_group];
[] remoteExecCall ["DT_fnc_updateMenuifOpen",_group];