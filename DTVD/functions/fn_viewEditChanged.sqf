/*
	File: fn_viewEditChanged.sqf
	Author: Dom
	Description: Handles an update to the view distance options
*/
params ["_control","_type","_updateIndex"];

private _text = ctrlText _control;
if (count _text < 3) exitWith {}; //not finished typing
private _newValue = parseNumber ([_text,"0123456789"] call BIS_fnc_filterString);
_newValue = ((_newValue max 100) min DT_viewDistanceMax);

private _variableToUpdate = format ["DT_%1ViewDistance",_type];
private _viewVar = profileNamespace getVariable [_variableToUpdate,[5000,5000,25]];
_viewVar set [_updateIndex,_newValue];
profileNamespace setVariable [_variableToUpdate,_viewVar];

private _display = findDisplay 9439;
private _controlString = str _control;
private _startIndex = _controlString find "#";
private _controlID = parseNumber (_controlString select [(_startIndex + 1)]);
private _slider = _display displayCtrl (_controlID + 500);
_slider sliderSetPosition _newValue;
_control ctrlSetText str _newValue; //make sure correct value is returned in box

[_type,_updateIndex,_newValue] call DT_fnc_changeSingleValue;