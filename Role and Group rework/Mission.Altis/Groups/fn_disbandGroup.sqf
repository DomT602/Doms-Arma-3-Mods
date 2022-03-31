/*
	File: fn_disbandGroup.sqf
	Author: Dom
	Description: Disbands the current group
*/
params [
	["_group",grpNull,[grpNull]]
];

["This group has been disbanded."] remoteExecCall ["hint",_group];
[true] remoteExecCall ["DT_fnc_leaveGroup",_group];
[] remoteExecCall ["DT_fnc_updateMenuifOpen",_group];