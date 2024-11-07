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
private _zoomDataArray = [];

{
	_x params ["_viewDistance","_objectDistance","_terrainGrid","_zoomDistance"];
	_sliderDataArray pushBack _viewDistance;
	_sliderDataArray pushBack _objectDistance;
	_terrainDataArray pushBack _terrainGrid;
	_zoomDataArray pushBack _zoomDistance;
} forEach [
	profileNamespace getVariable ["DT_footViewDistance",[5000,5000,25,0]],
	profileNamespace getVariable ["DT_shipViewDistance",[5000,5000,25,0]],
	profileNamespace getVariable ["DT_carViewDistance",[5000,5000,25,0]],
	profileNamespace getVariable ["DT_rotaryViewDistance",[5000,5000,25,0]],
	profileNamespace getVariable ["DT_airViewDistance",[5000,5000,25,0]]
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

for "_i" from 1950 to 1954 do {
	private _control = _display displayCtrl _i;
	_control sliderSetRange [0,1000];
	_control sliderSetSpeed [100,100];
	_control sliderSetPosition (_zoomDataArray select (_i - 1950));
	if !(DT_scopeBoostEnabled) then {_control ctrlEnable false};
};
for "_i" from 1450 to 1454 do {
	private _control = _display displayCtrl _i;
	_control ctrlSetText str (_zoomDataArray select (_i - 1450));
	if !(DT_scopeBoostEnabled) then {_control ctrlEnable false};
};

private _gridData = ["50","25","12.5","6.25","3.125"];
private _gridIndex = _gridData find (str DT_terrainGridMax);
_gridData = _gridData select [_gridIndex,5];

for "_i" from 2100 to 2104 do {
	private _control = _display displayCtrl _i;
	{
		_control lbAdd localize format ["STR_DTVD_terrainGrid%1",_x];
		_control lbSetData [_forEachIndex,_x];
	} forEach _gridData;

	private _currentGrid = _terrainDataArray select (_i - 2100);
	private _index = _gridData find (str _currentGrid);
	_control lbSetCurSel _index;
};