/*
	File: fn_changeViewByHotkey.sqf
	Author: Dom
	Description: Handles an update to view distance when a hotkey is pressed
*/
if !(DT_viewDistanceEnabled) exitWith {};
params [
	["_value",100,[0]]
];

if (viewDistance isNotEqualTo _value) then {
	setViewDistance _value;
};
if ((getObjectViewDistance select 0) isNotEqualTo _value) then {
	setObjectViewDistance _value;
};

private _viewVar = [] call DT_fnc_getVarByVehicle;
_viewVar set [0,_value];
_viewVar set [1,_value];