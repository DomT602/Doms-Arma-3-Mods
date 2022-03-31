/*
	File: fn_kickFromGroup.sqf
	Author: Dom
	Description: Leave the selected group
*/
params [
	["_group",grpNull,[grpNull]],
	["_unit",objNull,[objNull]]
];

[true] remoteExecCall ["DT_fnc_leaveGroup",_unit];
hint format ["You kicked %1 from your group.",name _unit];
[] remoteExecCall ["DT_fnc_updateMenuifOpen",_group];