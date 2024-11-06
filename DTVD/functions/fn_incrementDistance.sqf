/*
	File: fn_incrementDistance.sqf
	Author: Dom
	Description: Handles an update to view distance when the increment hotkey is pressed
*/
if !(DT_viewDistanceEnabled) exitWith {};
params [
	["_value",100,[0]],
	["_add",true,[false]]
];

private _newViewDistance = if (_add) then {(viewDistance + _value) min DT_viewDistanceMax} else {(viewDistance - _value) max 200};
setViewDistance _newViewDistance;
setObjectViewDistance _newViewDistance;

private _type = "foot";
private _vehicle = objectParent player;
if !(isNull _vehicle) then {
	if (_vehicle isKindOf "Air") then {
		if (_vehicle isKindOf "Helicopter") then {
			_type = "rotary";
		} else {
			_type = "air";
		};
	} else {
		if (_vehicle isKindOf "Ship") then {
			_type = "ship";
		} else {
			_type = "car";
		};
	};
};

private _variableToUpdate = format ["DT_%1ViewDistance",_type];
private _viewVar = profileNamespace getVariable [_variableToUpdate,[5000,5000,25]];
_viewVar set [0,_newViewDistance];
_viewVar set [1,_newViewDistance];