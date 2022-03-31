/*
	File: fn_invitedToGroup.sqf
	Author: Dom
	Description: Informs the player they have been invited to the group
*/
params [
	["_group",grpNull,[grpNull]],
	["_name","",[""]]
];

hint format [localize "STR_DT_Group_Invited",_name];
_group setVariable ["DT_groupInvited",true];

[_group] spawn {
	params ["_group"];
	uiSleep 60;
	_group setVariable ["DT_groupInvited",false];
};