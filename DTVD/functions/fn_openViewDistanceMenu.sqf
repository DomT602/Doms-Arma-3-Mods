/*
	File: fn_openViewDistanceMenu.sqf
	Author: Dom
	Description: Opens the view distance menu and populates default values
*/

if !(DT_viewDistanceEnabled) exitWith {};
if (dialog) exitWith {};
	
createDialog "DT_viewDistanceMenu";

private _display = findDisplay 9439;

(profileNamespace getVariable ["DT_footViewDistance",[5000,5000,25]]) params ["_footViewDistance","_footObjectDistance","_footTerrainGrid"];
(profileNamespace getVariable ["DT_shipViewDistance",[5000,5000,25]]) params ["_shipViewDistance","_shipObjectDistance","_shipTerrainGrid"];
(profileNamespace getVariable ["DT_carViewDistance",[5000,5000,25]]) params ["_carViewDistance","_carObjectDistance","_carTerrainGrid"];
(profileNamespace getVariable ["DT_rotaryViewDistance",[5000,5000,25]]) params ["_rotaryViewDistance","_rotaryObjectDistance","_rotaryTerrainGrid"];
(profileNamespace getVariable ["DT_airViewDistance",[5000,5000,25]]) params ["_airViewDistance","_airObjectDistance","_airTerrainGrid"];

private _sliderDataArray = [_footViewDistance,_footObjectDistance,_shipViewDistance,_shipObjectDistance,_carViewDistance,_carObjectDistance,_rotaryViewDistance,_rotaryObjectDistance,_airViewDistance,_airObjectDistance];
for "_i" from 1900 to 1909 do {
	private _control = _display displayCtrl _i;
	_control sliderSetRange [100,12000];
	_control sliderSetSpeed [100,100];
	_control sliderSetPosition (_sliderDataArray select (_i - 1900));
};
for "_i" from 1400 to 1409 do {
	private _control = _display displayCtrl _i;
	_control ctrlSetText str (_sliderDataArray select (_i - 1400));
};

private _terrainDataArray = [_footTerrainGrid,_shipTerrainGrid,_carTerrainGrid,_rotaryTerrainGrid,_airTerrainGrid];
private _gridData = [
	["50","50 (Smoothest)"],
	["25","25 (Default)"],
	["12.5","12.5"],
	["6.25","6.25"],
	["3.125","3.125 (Best Quality)"]
];
for "_i" from 2100 to 2104 do {
	private _control = _display displayCtrl _i;
	{
		_x params ["_value","_text"];
		_control lbAdd _text;
		_control lbSetData [_forEachIndex,_value];
	} forEach _gridData;

	private _currentGrid = _terrainDataArray select (_i - 2100);
	private _index = _gridData findIf {(_x select 0) isEqualTo str(_currentGrid)};
	_control lbSetCurSel _index;
};