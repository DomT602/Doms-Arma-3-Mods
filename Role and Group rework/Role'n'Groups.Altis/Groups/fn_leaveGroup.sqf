/*
	File: fn_leaveGroup.sqf
	Author: Dom
	Description: Leave the selected group
*/
params [
	["_kicked",false,[true]]
];

private _oldGroup = group player;
if !(_kicked) then {
	[format["%1 has left your group.",profileName]] remoteExecCall ["hint",group player];
};

private _group = createGroup [playerSide,true];
[player] joinSilent _group;
[] call DT_fnc_initGroupMenu;

[] remoteExecCall ["DT_fnc_updateMenuifOpen",_oldGroup];