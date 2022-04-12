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
hint format [localize "STR_DT_Group_Kicked",name _unit];
[] remoteExecCall ["DT_fnc_updateMenuifOpen",_group];