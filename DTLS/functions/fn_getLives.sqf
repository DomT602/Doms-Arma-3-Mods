/*
	File: fn_getLives.sqf
	Author: Dom
	Description: Gets desired units life count
*/
params [
	["_unit",objNull,[objNull]]
];

private _lives = [_unit] call BIS_fnc_respawnTickets;
private _templatesUsed = getMissionConfigValue "RespawnTemplates";
if ("Tickets" in _templatesUsed) then {
	_lives = _lives - 1; //display 1 less life as we are subtracting on death
};

_lives