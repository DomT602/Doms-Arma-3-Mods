/*
	File: fn_createGroup.sqf
	Author: Dom
	Description: Joins the selected group
*/

private _group = createGroup [playerSide,true];
[player] joinSilent _group;
hint localize "STR_DT_Group_Created";
[] call DT_fnc_initGroupMenu;