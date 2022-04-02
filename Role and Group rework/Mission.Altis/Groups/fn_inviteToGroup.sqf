/*
	File: fn_inviteToGroup.sqf
	Author: Dom
	Description: Invite selected player to the group
*/
params [
	["_group",grpNull,[grpNull]],
	["_unit",objNull,[objNull]]
];

[group player,profileName] remoteExecCall ["DT_fnc_invitedToGroup",_unit];
hint format [localize "STR_DT_Group_Invite",name _unit];