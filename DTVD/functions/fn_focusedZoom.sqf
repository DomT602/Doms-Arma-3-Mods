/*
	File: fn_focusedZoom.sqf
	Author: Dom
	Description: Temporarily adjusts the view distance values when zooming/focusing in
*/
if (cameraView isEqualTo "GUNNER") exitWith {}; //already scoped in
params ["_activated"];

private _viewVar = [] call DT_fnc_getVarByVehicle;
_viewVar params ["_viewDistance","_objectDistance","","_changeAmount"];

if (_changeAmount isEqualTo 0) exitWith {};

if (_activated) then {
	setViewDistance (_viewDistance + _changeAmount);
	setObjectViewDistance (_objectDistance + _changeAmount);
} else {
	setViewDistance _viewDistance;
	setObjectViewDistance _objectDistance;
};