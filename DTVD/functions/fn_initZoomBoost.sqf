/*
	File: fn_initZoomBoost.sqf
	Author: Dom
	Description: Starts or stops the zoom boost handler
*/
params [
	["_enable",true,[false]]
];

if (_enable) then {
	DT_viewDistance_opticsSwitch = player addEventHandler ["opticsSwitch",DT_fnc_opticsSwitch];
} else {
	if (isNil "DT_viewDistance_opticsSwitch") exitWith {};
	player removeEventHandler ["opticsSwitch",DT_viewDistance_opticsSwitch];
	DT_viewDistance_opticsSwitch = nil;
};