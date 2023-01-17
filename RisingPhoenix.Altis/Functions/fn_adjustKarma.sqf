/*
	File: fn_adjustKarma.sqf
	Author: Dom
	Description: Updates a locations karma value
*/
params [
	["_data",objNull,[objNull,[]]],
	["_value",0,[0]]
];

if !(_data in DT_civLocations) then {
	_data = [_data] call DT_fnc_getClosestTown;
};

private _currentKarma = [_data] call DT_fnc_getKarma;
private _newKarma = _currentKarma + _value;
_data setVariable ["townKarma",_newKarma,true];