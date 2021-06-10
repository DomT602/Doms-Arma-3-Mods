/*
	File: fn_viewSliderChanged.sqf
	Author: Dom
	Description: Handles an update to the view distance options
*/
params ["_args","_type","_updateIndex"];
_args params ["_control","_newValue"];

_newValue = round _newValue;

private _variableToUpdate = format ["DT_%1ViewDistance",_type];
private _viewVar = profileNamespace getVariable [_variableToUpdate,[5000,5000,25]];
_viewVar set [_updateIndex,_newValue];
profileNamespace setVariable [_variableToUpdate,_viewVar];

private _display = findDisplay 9439;
private _controlString = str _control;
private _startIndex = _controlString find "#";
private _controlID = parseNumber (_controlString select [(_startIndex + 1)]);
private _editBox = _display displayCtrl (_controlID - 500);
_editBox ctrlSetText str _newValue;

[_type,_updateIndex,_newValue] call DT_fnc_changeSingleValue;