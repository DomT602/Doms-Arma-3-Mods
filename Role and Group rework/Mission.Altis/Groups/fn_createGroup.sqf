/*
	File: fn_createGroup.sqf
	Author: Dom
	Description: Joins the selected group
*/

private _group = createGroup [playerSide,true];
[player] joinSilent _group;
hint "New group created.";
[] call DT_fnc_initGroupMenu;