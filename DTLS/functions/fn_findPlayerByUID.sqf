/*
	File: fn_findPlayerByUID.sqf
	Author: Dom
	Description: Finds the desired player by matching UID and return player object
*/
params [
	["_uid","",[""]]
];

private _unit = objNull;
{
	if (getPlayerUID _x isEqualTo _uid) exitWith {
		_unit = _x;
	};
} forEach playableUnits;

_unit;