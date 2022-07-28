/*
	File: fn_changeViewByHotkey.sqf
	Author: Dom
	Description: Handles an update to view distance when a hotkey is pressed
*/
params [
	["_value",100,[0]]
];

setViewDistance _value;
setObjectViewDistance _value;

private _type = "foot";
if !(isNull objectParent player) then {
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
			private _type = "car";
		};
	};
};

private _variableToUpdate = format ["DT_%1ViewDistance",_type];
private _viewVar = profileNamespace getVariable [_variableToUpdate,[5000,5000,25]];
_viewVar set [0,_value];
_viewVar set [1,_value];
profileNamespace setVariable [_variableToUpdate,_viewVar];