/*
	File: fn_initBuildMenu.sqf
	Author: Dom
	Description: Opens and populates the build menu
*/

private _display = createDialog ["DT_buildMenu",true];
private _tree = _display displayCtrl 1500;

{
	_tree tvAdd [[],_x];
} forEach ["Light Vehicles","Heavy Vehicles","Air","Naval"];

private _baseCfg = missionConfigFile >> "Logi_Setup";

{
	private _index = _forEachIndex;
	{
		([_x] call DT_fnc_fetchDetails) params ["_text","_icon"];

		_tree tvAdd [[_index],_text];

		if !(_icon in ["","pictureStaticObject","pictureThing"]) then {
			_tree tvSetPicture [[_index,_forEachIndex],_icon];
		};

		_tree tvSetData [[_index,_forEachIndex],_x];
	} forEach _x;
} forEach [
	getArray(_baseCfg >> "bluforLightVehicles"),
	getArray(_baseCfg >> "bluforHeavyVehicles"),
	getArray(_baseCfg >> "bluforAirVehicles"),
	getArray(_baseCfg >> "bluforNavalVehicles")
];

DT_canBuild = false;
DT_buildAction = 0;
DT_buildElevation = 0;
DT_buildRotation = 0;