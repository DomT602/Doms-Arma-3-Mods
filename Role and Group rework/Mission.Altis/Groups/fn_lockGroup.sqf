/*
	File: fn_lockGroup.sqf
	Author: Dom
	Description: Joins the selected group
*/
params [
	["_group",grpNull,[grpNull]],
	["_lock",true,[true]]
];

if (_lock) then {
	_group setVariable ["DT_groupLocked",true,true];
	hint localize "STR_DT_Group_Locked";
} else {
	_group setVariable ["DT_groupLocked",false,true];
	hint localize "STR_DT_Group_Unlocked";
};
[] call DT_fnc_initGroupMenu;