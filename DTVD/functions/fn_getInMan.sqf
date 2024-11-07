/*
	File: fn_getInMan.sqf
	Author: Dom
	Description: Updates to correct view distance for vehicle type
*/
params ["_unit","","_vehicle"];

private _variable = "DT_carViewDistance";
if (_vehicle isKindOf "Air") then {
	if (_vehicle isKindOf "Helicopter") then {
		_variable = "DT_rotaryViewDistance";
	} else {
		_variable = "DT_airViewDistance";
	};
} else {
	if (_vehicle isKindOf "Ship") then {
		_variable = "DT_shipViewDistance";
	};
};

(profileNamespace getVariable [_variable,[5000,5000,25,0]]) params ["_viewDistance","_objectDistance","_terrainGrid"];
if (viewDistance isNotEqualTo _viewDistance) then {
	setViewDistance _viewDistance;
};
if ((getObjectViewDistance select 0) isNotEqualTo _objectDistance) then {
	setObjectViewDistance _objectDistance;
};
if (getTerrainGrid isNotEqualTo _terrainGrid) then {
	setTerrainGrid _terrainGrid;
};