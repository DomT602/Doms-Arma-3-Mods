/*
	File: fn_invitedToGroup.sqf
	Author: Dom
	Description: Informs the player they have been invited to the group
*/
params [
	["_group",grpNull,[grpNull]],
	["_name","",[""]]
];

hint format ["%1 has invited you to their group, the invite expires in 60 seconds.",_name];
_group setVariable ["DT_groupInvited",true];

[_group] spawn {
	params ["_group"];
	_group setVariable ["DT_groupInvited",false];
};