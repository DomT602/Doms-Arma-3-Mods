/*
	File: fn_terrainGridChanged.sqf
	Author: Dom
	Description: Handles an update to the terrain grid option
*/
params ["_args","_type"];
_args params ["_control","_index"];

private _newValue = parseNumber (_control lbData _index);

private _variableToUpdate = format ["DT_%1ViewDistance",_type];
private _viewVar = profileNamespace getVariable [_variableToUpdate,[5000,5000,25]];
_viewVar set [2,_newValue];
profileNamespace setVariable [_variableToUpdate,_viewVar];

ACE_controlledUAV params [["_uav",objNull]];
private _vehicle = if (isNull _uav) then {objectParent player} else {_uav};

if (_type isEqualTo "rotary") exitWith {
	if (_vehicle isKindOf "Helicopter") then {
		setTerrainGrid _newValue;
	};
};

if (_type isEqualTo "air") exitWith {
	if (_vehicle isKindOf "Air" && {!(_vehicle isKindOf "Helicopter")}) then {
		setTerrainGrid _newValue;
	};
};

if (_type isEqualTo "ship") exitWith {
	if (_vehicle isKindOf "Ship") then {
		setTerrainGrid _newValue;
	};
};

if (_type isEqualTo "car") exitWith {
	if (_vehicle isKindOf "LandVehicle") then {
		setTerrainGrid _newValue;
	};
};

if (_type isEqualTo "foot") exitWith {
	if (isNull _vehicle) then {
		setTerrainGrid _newValue;
	};
};