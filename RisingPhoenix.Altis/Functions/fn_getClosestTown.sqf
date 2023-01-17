/*
	File: fn_getClosestTown.sqf
	Author: Dom
	Description: Gets the closest town to position
*/
params [
	["_data",objNull,[objNull,[]]]
];
if (_data isEqualType objNull) then {
	_data = getPosASL _data;
};

private _closestObject = objNull;
private _closestDistance = 99999;
{
	private _distance = _data distance2D _x;
	if (_distance < _closestDistance) then {
		_closestObject = _x;
		_closestDistance = _distance;
	};
} forEach DT_civLocations;

_closestObject;