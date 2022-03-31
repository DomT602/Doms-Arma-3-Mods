/*
	File: fn_updateMenuIfOpen.sqf
	Author: Dom
	Description: Force update of a clients group menu if their group details changes
*/

private _display = findDisplay 9701;
if (isNull _display) exitWith {};

[] call DT_fnc_initGroupMenu;