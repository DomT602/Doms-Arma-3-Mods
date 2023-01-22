/*
	File: fn_onSupportMenuTvChange.sqf
	Author: Dom
	Description: Called on change of selection on support menu
*/
params [
	["_control",controlNull,[controlNull]],
	["_selectionPath",[],[[]]]
];

private _display = findDisplay 9745;
private _button = _display displayCtrl 2400;
_selectionPath params ["_firstIndex"];

if (count _selectionPath isEqualTo 1) exitWith {
	_button ctrlEnable false;
};

private _supportCooldowns = missionNamespace getVariable ["DT_supportCooldowns",[]];
_button ctrlEnable (CBA_missionTime > (_supportCooldowns select _firstIndex));