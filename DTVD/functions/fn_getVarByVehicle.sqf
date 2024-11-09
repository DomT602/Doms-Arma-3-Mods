/*
	File: fn_getVarByVehicle.sqf
	Author: Dom
	Description: Returns the correct view distance variable to edit depending on vehicle the player may be in
*/
private _type = "foot";
private _uav = [] call DT_fnc_getActiveUAV;
private _vehicle = if (isNull _uav) then {objectParent player} else {_uav};

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

private _formattedVariable = format ["DT_%1ViewDistance",_type];

profileNamespace getVariable [_formattedVariable,[5000,5000,25,0]];