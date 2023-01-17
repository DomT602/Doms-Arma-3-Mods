/*
	File: fn_getKarma.sqf
	Author: Dom
	Description: Gets a locations karma and returns the value
*/
params [
	["_data",objNull,[objNull,[]]]
];

if (_data isEqualType []) exitWith {
	private _townObj = [_data] call DT_fnc_getClosestTown;
	_townObj getVariable ["townKarma",0];
};

_data getVariable ["townKarma",0];