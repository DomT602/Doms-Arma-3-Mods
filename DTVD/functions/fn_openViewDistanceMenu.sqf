/*
	File: fn_openViewDistanceMenu.sqf
	Author: Dom
	Description: Opens the view distance menu and populates default values
*/

if !(DT_viewDistanceEnabled) exitWith {};
if (dialog) exitWith {};
	
private _display = createDialog ["DT_viewDistanceMenu",false];

private _sliderDataArray = [];
private _terrainDataArray = [];
{
	_x params ["_viewDistance","_objectDistance","_terrainGrid"];
	_sliderDataArray pushBack _viewDistance;
	_sliderDataArray pushBack _objectDistance;
	_terrainDataArray pushBack _terrainGrid;
} forEach [
	profileNamespace getVariable ["DT_footViewDistance",[5000,5000,25]],
	profileNamespace getVariable ["DT_shipViewDistance",[5000,5000,25]],
	profileNamespace getVariable ["DT_carViewDistance",[5000,5000,25]],
	profileNamespace getVariable ["DT_rotaryViewDistance",[5000,5000,25]],
	profileNamespace getVariable ["DT_airViewDistance",[5000,5000,25]]
];

for "_i" from 1900 to 1909 do {
	private _control = _display displayCtrl _i;
	_control sliderSetRange [200,DT_viewDistanceMax];
	_control sliderSetSpeed [100,100];
	_control sliderSetPosition (_sliderDataArray select (_i - 1900));
};
for "_i" from 1400 to 1409 do {
	private _control = _display displayCtrl _i;
	_control ctrlSetText str (_sliderDataArray select (_i - 1400));
};

private _gridData = ["50","25","12.5","6.25","3.125"];
for "_i" from 2100 to 2104 do {
	private _control = _display displayCtrl _i;
	{
		_control lbAdd localize format ["STR_DTVD_terrainGrid%1",(_forEachIndex + 1)];
		_control lbSetData [_forEachIndex,_x];
	} forEach _gridData;

	private _currentGrid = _terrainDataArray select (_i - 2100);
	private _index = _gridData find (str _currentGrid);
	_control lbSetCurSel _index;
};