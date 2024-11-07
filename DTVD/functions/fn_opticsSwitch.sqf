/*
	File: fn_opticsSwitch.sqf
	Author: Dom
	Description: Temporarily adjusts the view distance values when scoping in
*/
params ["","_isADS"];

private _viewVar = [] call DT_fnc_getVarByVehicle;
_viewVar params ["_viewDistance","_objectDistance","","_changeAmount"];

if (_changeAmount isEqualTo 0) exitWith {};

if (_isADS) then {
	setViewDistance (_viewDistance + _changeAmount);
	setObjectViewDistance (_objectDistance + _changeAmount);
} else {
	setViewDistance _viewDistance;
	setObjectViewDistance _objectDistance;
};