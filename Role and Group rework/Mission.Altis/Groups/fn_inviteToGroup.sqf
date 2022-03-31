/*
	File: fn_inviteToGroup.sqf
	Author: Dom
	Description: Invite selected player to the group
*/
params [
	["_group",grpNull,[grpNull]],
	["_unit",objNull,[objNull]]
];

[_group,profileName] remoteExecCall ["AW_fnc_invitedToGroup",_unit];
hint format ["You invited %1 to your group.",name _unit];